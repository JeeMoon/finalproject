package com.gr.farming.community.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gr.farming.community.model.ChatMessageDTO;
import com.gr.farming.community.model.ChatRoomDTO;
import com.gr.farming.community.model.ChatRoomJoinVO;
import com.gr.farming.community.model.ChatRoomRepository;
import com.gr.farming.community.model.ChatService;
import com.gr.farming.expert.model.ExpertService;
import com.gr.farming.expert.model.ExpertVO;
import com.gr.farming.findExp.model.ExpertInfoVO;
import com.gr.farming.findExp.model.FindExpService;
import com.gr.farming.member.model.MemberService;
import com.gr.farming.request.model.FinalRequestVO;
import com.gr.farming.request.model.RequestService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/chat")
@Log4j2

public class RoomController {

    private final ChatRoomRepository repository;
    
    @Autowired
    private ChatService service;
    @Autowired
    private ExpertService e_service;
    @Autowired
    private MemberService m_service;
    @Autowired
    private RequestService r_service;
    @Autowired
    private FindExpService fe_service;
    
    //채팅방 목록 조회
    /*
    @GetMapping(value = "/rooms")
    public ModelAndView rooms(){

        log.info("# All Chat Rooms");
        ModelAndView mv = new ModelAndView("chat/rooms");

        mv.addObject("list", repository.findAllRooms());

        return mv;
    }
    */
    
    @GetMapping("/rooms")
    public String roomsList(HttpSession session, Model model) {
    	log.info("해당 사용자의 채팅방 조회");
    	List<Map<String, Object>> joinList = null;
    	if(session.getAttribute("user").equals("사용자")) {
    		int memNo = (int) session.getAttribute("userNo");
    		joinList = service.selectRoomByMember(memNo);
    	} else if(session.getAttribute("user").equals("전문가")) {
    		int expNo = (int) session.getAttribute("userNo");
    		joinList = service.selectRoomByExpert(expNo);
    	}
    	log.info("joinList = {}",joinList);
    	
    	model.addAttribute("list", joinList);
    	
    	return "chat/rooms";
    }
    
//###################################################################
    /*
    //채팅방 개설
    @PostMapping(value = "/room")
    public String create(@RequestParam String name, RedirectAttributes rttr){

        log.info("# Create Chat Room , name: " + name);
        rttr.addFlashAttribute("roomName", repository.createChatRoomDTO(name));
        return "redirect:/chat/rooms";
    }
	*/
    @RequestMapping("/create")
    public String createRoom(@RequestParam(value="expertEmail", required=false) String expertEmail, 
    		int finalRequestNo, HttpSession session, Model model) {
    	log.info("채팅방 만들기 (상담전문가email)expertEmail = {}", expertEmail);
    	
    	FinalRequestVO finalRequest=r_service.selectFinalDetail2(finalRequestNo);
    	
    	int memNo = (int) session.getAttribute("userNo");
    	ExpertVO eVo = e_service.selectByEmail(expertEmail);
    	String expName = eVo.getName();
    	
    	ChatRoomDTO roomDto = new ChatRoomDTO();
    	roomDto.setRoomName(expName);
    	roomDto.setRequestNo(finalRequest.getRequestNo());
    	roomDto.setFinalRequestNo(finalRequestNo);
    	
    	int cnt = service.createRoom(roomDto);
    	
    	String msg = "채팅방x.", url = "/chat/rooms";
    	if(cnt > 0) {
    		msg = "채팅방o";
    		//채팅방 만들고 해당 사용자를 방에 참여시킴(chatroomjoin테이블에 insert)
    		ChatRoomJoinVO joinVo = new ChatRoomJoinVO();
    		joinVo.setExpertNo(eVo.getExpertNo());
    		joinVo.setMemberNo(memNo);
    		joinVo.setRoomNo(roomDto.getRoomNo());
    		
    		int res = service.joinRoom(joinVo);
    		if(res > 0) {
    			msg = "채팅방 o, 사용자 조인 o";
    			url = "/chat/room?roomNo="+roomDto.getRoomNo();
    		} else {
    			msg = "채팅방 o, 사용자 조인 x";
    			url = "/chat/rooms";
    		}
    	}
    	
    	model.addAttribute("url", url);
    	model.addAttribute("msg", msg);
    	
    	return "common/message";
    }
    
//###################################################################
    
    //채팅방 조회
/*    @GetMapping("/room")
    public void getRoom(String roomId, Model model){

        log.info("# get Chat Room, roomID : " + roomId);

        model.addAttribute("room", repository.findRoomById(roomId));
    }
*/    
    @GetMapping("/room")
    public String getRoom(int roomNo, Model model){
        log.info("# get Chat Room, roomNo : " + roomNo);
        
        ChatRoomDTO room=service.selectRoomNo(roomNo);
        FinalRequestVO vo=r_service.selectFinalDetail2(room.getFinalRequestNo());
        log.info("# 최종견적서 vo={} ", vo);
        
        ExpertInfoVO expInfo=fe_service.selectExpInfo(vo.getExpertNo());
        log.info("# 전문가정보 expInfo={} ", expInfo);
        
        List<ChatMessageDTO> dtoList = service.selectMessageDTO(roomNo);
        
        model.addAttribute("room", service.selectRoomNo(roomNo));
        model.addAttribute("dtoList", dtoList);
        model.addAttribute("vo", vo);
        model.addAttribute("expInfo", expInfo);
        
        return "chat/room";
    }

}