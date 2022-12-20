package com.spring.service;

import java.util.List;

import com.spring.model.EventDTO;

public interface EventDAO {
	
	// �대깽�� 醫�瑜�
	List<EventDTO> eventList();
	
	// �대깽�� ���몄��蹂�
	EventDTO getEventCont(int event_no);

}
