package com.spring.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DipsDAOImpl implements DipsDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

}
