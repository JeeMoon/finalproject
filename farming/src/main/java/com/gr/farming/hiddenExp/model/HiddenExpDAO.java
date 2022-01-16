package com.gr.farming.hiddenExp.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gr.farming.expert.model.ExpertVO;

@Mapper
public interface HiddenExpDAO {

	List<Map<String, Object>> selectByAddress(String keyword);
}
