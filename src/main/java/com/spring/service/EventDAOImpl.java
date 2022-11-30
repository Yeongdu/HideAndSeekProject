package com.spring.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/*
 * < ¿¹ ½Ã >

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
}
