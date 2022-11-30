package com.spring.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.CartDTO;
import com.spring.model.ProductDTO;

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
public class CartDAOImpl implements CartDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public void insertCart(CartDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public CartDTO getCartCont(int cart_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateCart(CartDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCart(int cart_no) {
		// TODO Auto-generated method stub
		
	}




}
