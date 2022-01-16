package com.gr.farming.hiddenExp.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gr.farming.expert.model.ExpertVO;

@Service
public class HiddenExpServiceImpl implements HiddenExpService{

	private final HiddenExpDAO hiddenExpDao;
	
	@Autowired
	public HiddenExpServiceImpl(HiddenExpDAO hiddenExpDao) {
		this.hiddenExpDao = hiddenExpDao;
	}

	@Override
	public List<Map<String, Object>> selectByAddress(String keyword) {
		return hiddenExpDao.selectByAddress(keyword);
	}

}
