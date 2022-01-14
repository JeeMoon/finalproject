package com.gr.farming.request.model;

import java.util.List;
import java.util.Map;

import com.gr.farming.common.FieldSearchVO;
import com.gr.farming.field.model.FieldDetailVO;

public interface RequestService {

	int insertRequest(RequestVO vo);
	int insertRequestDevelop(RequestDevelopVO vo);
	int insertRequestDesign(RequestDesignVO vo);
	
	List<RequestQnaVO> selectRequestQna(int categoryNo);
	List<Map<String, Object>> selectQuestion(int categoryNo);
	List<Map<String, Object>> selectAnswer(int qNo);
	
	RequestVO selectReceivedRequest(int requestNo);
	List<Map<String, Object>> selectRequestList1(FieldSearchVO vo);
	List<Map<String, Object>> selectRequestList2(FieldSearchVO vo);
	Map<String, Object> selectRequestDetail1(RequestVO vo);
	Map<String, Object> selectRequestDetail2(RequestVO vo);
	
	int selectTotalRecord(FieldSearchVO vo);
	
	//최종 견적 작성
	int insertFinalRequest(FinalRequestVO vo);
	int updateMatchA(int requestNo);
	int updateMatchY(int requestNo);
	
	//받은 견적 조회(회원)
	List<Map<String, Object>> selectFinalRequest(int memberNo);
}
