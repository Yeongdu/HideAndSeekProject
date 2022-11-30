package com.spring.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Subscribe_userDAOImpl implements Subscribe_userDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

}
