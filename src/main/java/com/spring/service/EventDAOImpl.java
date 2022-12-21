package com.spring.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.EventDTO;

/*
 * < �� �� >

@Override
public List<EmpDTO> getEmpList() {
	return this.sqlSession.selectList("list");
}
	
@Override
public int insertEmp(EmpDTO dto) {
	return this.sqlSession.insert("add", dto);
}

@Override
public EmpDTO getEmp(int no) {
	return this.sqlSession.selectOne("cont", no);
}
	
*/

@Repository
public class EventDAOImpl implements EventDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<EventDTO> eventList() {
		return this.sqlSession.selectList("eventList");
	}

	@Override
	public EventDTO getEventCont(int event_no) {
		return this.sqlSession.selectOne("eventContent", event_no);
	}

	@Override
	public int insertEvent(EventDTO dto) {
		return this.sqlSession.insert("eventInsert", dto);
	}
	
	
}
