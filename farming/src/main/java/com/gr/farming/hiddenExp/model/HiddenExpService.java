package com.gr.farming.hiddenExp.model;

import java.util.List;
import java.util.Map;

import com.gr.farming.expert.model.ExpertVO;

public interface HiddenExpService {

	List<Map<String, Object>> selectByAddress(String keyword);
}
