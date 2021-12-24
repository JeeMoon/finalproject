package com.gr.farming.member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{		
	private final MemberDAO memberDao;
	
	@Autowired
	public MemberServiceImpl(MemberDAO memberDao) { 
		this.memberDao = memberDao; 
	}
	
	
	public int insertMember(MemberVO vo) {
		int cnt=memberDao.insertMember(vo);
		return cnt;
	}
	
	public int duplicateId(String email) {
		int count=memberDao.duplicateId(email);
		
		int result=0;
		if(count>0) {  //해당 아이디가 이미 존재함
			result=EXIST_ID;
		}else {
			result=NON_EXIST_ID;			
		}
		
		return result;
	}
	
	public int loginCheck(String email, String pwd){
		String dbPwd = memberDao.selectPwd(email);
		int result=0;
		if(dbPwd == null || dbPwd.isEmpty()) {
			result=USERID_NONE;
		}else {
			if(dbPwd.equals(pwd)) {
				result=LOGIN_OK;
			}else {
				result=DISAGREE_PWD;
			}
		}
		
		return result;
	}
	
	public MemberVO selectByEmail(String email)  {
		return memberDao.selectByEmail(email);
	}
	
	public int updateMember(MemberVO vo) {
		return memberDao.updateMember(vo);
	}
	
	public int withdrawMember(String email) {
		return memberDao.withdrawMember(email);
	}

}
