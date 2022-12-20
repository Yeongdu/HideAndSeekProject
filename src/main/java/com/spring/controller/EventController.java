package com.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.model.EventDTO;
import com.spring.service.EventDAO;
import com.spring.service.ProductDAO;

@Controller
public class EventController {
	
	@Autowired
	private EventDAO dao;
	
	@Autowired
	private ProductDAO pdao;
	
	@RequestMapping("event.do")
	public String event(Model model) {
		
		List<EventDTO> list = dao.eventList();
		model.addAttribute("list", list);
		
		return "event/event_main";
	}
	
	@RequestMapping("event_content.do")
	public String event_content(@RequestParam("event_no") int event_no, Model model) {
		EventDTO dto = this.dao.getEventCont(event_no);
		model.addAttribute("Event", dto);

		return "event/event_content";
	}
	

}
