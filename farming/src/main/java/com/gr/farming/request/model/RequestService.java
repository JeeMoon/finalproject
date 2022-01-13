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
}
