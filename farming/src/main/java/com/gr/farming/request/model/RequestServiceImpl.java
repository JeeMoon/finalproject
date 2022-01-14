package com.gr.farming.request.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gr.farming.common.FieldSearchVO;
import com.gr.farming.field.model.FieldDetailVO;

@Service
public class RequestServiceImpl implements RequestService{
	
	private final RequestDAO requestDao;
	
	@Autowired
	public RequestServiceImpl(RequestDAO requestDao) {
		this.requestDao = requestDao;
	}

	@Override
	public int insertRequest(RequestVO vo) {
		return requestDao.insertRequest(vo);
	}
	
	public int insertRequestDevelop(RequestDevelopVO vo) {
		return requestDao.insertRequestDevelop(vo);
	}
	
	public int insertRequestDesign(RequestDesignVO vo) {
		return requestDao.insertRequestDesign(vo);
	}

	@Override
	public List<Map<String, Object>> selectQuestion(int categoryNo) {
		return requestDao.selectQuestion(categoryNo);
	}
	
	@Override
	public List<Map<String, Object>> selectAnswer(int qNo) {
		return requestDao.selectAnswer(qNo);
	}

	@Override
	public List<RequestQnaVO> selectRequestQna(int categoryNo) {
	return requestDao.selectRequestQna(categoryNo);
}

	@Override
	public RequestVO selectReceivedRequest(int requestNo) {
		return requestDao.selectReceivedRequest(requestNo);
	}

	@Override
	public int selectTotalRecord(FieldSearchVO vo) {
		return requestDao.selectTotalRecord(vo);
	}

	@Override
	public List<Map<String, Object>> selectRequestList1(FieldSearchVO vo) {
		return requestDao.selectRequestList1(vo);
	}

	@Override
	public List<Map<String, Object>> selectRequestList2(FieldSearchVO vo) {
		return requestDao.selectRequestList2(vo);
	}

	@Override
	public Map<String, Object> selectRequestDetail1(RequestVO vo) {
		return requestDao.selectRequestDetail1(vo);
	}

	@Override
	public Map<String, Object> selectRequestDetail2(RequestVO vo) {
		return requestDao.selectRequestDetail2(vo);
	}

	@Override
	public int insertFinalRequest(FinalRequestVO vo) {
		return requestDao.insertFinalRequest(vo);
	}

	@Override
	public int updateMatchA(int requestNo) {
		return requestDao.updateMatchA(requestNo);
	}

	@Override
	public int updateMatchY(int requestNo) {
		return requestDao.updateMatchY(requestNo);
	}

	@Override
	public List<Map<String, Object>> selectFinalRequest(int memberNo) {
		return requestDao.selectFinalRequest(memberNo);
	}



	




	

}
