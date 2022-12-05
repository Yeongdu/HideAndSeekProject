package com.spring.service;

import java.util.List;

import com.spring.model.EventDTO;

public interface EventDAO {
	
	// 이벤트 종류
	List<EventDTO> eventList();
	
	// 이벤트 상세정보
	EventDTO getEventCont(EventDTO dto);

}
