package com.gr.farming.qna.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gr.farming.common.SearchVO;
import com.gr.farming.common.SearchVO2;

@Service
public class QnaServiceImpl implements QnaService{
	private final QnaDAO qnaDao;

	@Autowired
	public QnaServiceImpl(QnaDAO qnaDao) {
		this.qnaDao = qnaDao;
	}

	
	public int insert(QnaVO vo) {
		return qnaDao.insert(vo);
	}

//	@Override
//	public List<QnaVO> select(int no) {
//		return qnaDao.select(no);
//	}

	@Override
	public int selectTotalRecord(SearchVO2 searchVo) {
		return qnaDao.selectTotalRecord(searchVo);
	}

	@Override
	public int updateQna(QnaVO vo) {
		// TODO Auto-generated method stub
		return qnaDao.updateQna(vo);
	}



	@Override
	public QnaVO selectByNo(int no) {
		// TODO Auto-generated method stub
		return qnaDao.selectByNo(no);
	}


	@Transactional
	@Override
	public int reply(QnaVO vo) {
		// TODO Auto-generated method stub
		int cnt=qnaDao.updateSortNo(vo);
		cnt=qnaDao.reply(vo);
		return cnt;
	}


	@Override
	public List<QnaVO> select(SearchVO2 searchVo) {
		// TODO Auto-generated method stub
		return qnaDao.select(searchVo);
	}


	@Override
	public int deleteQna(int no) {
		// TODO Auto-generated method stub
		return qnaDao.deleteQna(no);
	}


	

	
	
}
