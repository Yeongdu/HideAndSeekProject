package com.spring.service;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.CartDTO;
import com.spring.model.OrderDTO;
import com.spring.model.PageDTO;
import com.spring.model.ProductDTO;
import com.spring.model.Product_categoryDTO;

@Repository
public class OrderDAOImpl implements OrderDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<OrderDTO> getNewOrderList() {
		return this.sqlSession.selectList("admin_new5order");
	}

	@Override
	public List<OrderDTO> getOrderList() {
		return this.sqlSession.selectList("admin_order");
	}

	@Override
	public List<Product_categoryDTO> getCategoryList() {
		return this.sqlSession.selectList("adminCateList");
	}
	
	@Override
	public int getOrderCount() {
		return this.sqlSession.selectOne("admin_getOrderListCount");
	}

	@Override
	public void insertOrder(OrderDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public CartDTO getOrderCont(int order_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateOrder(OrderDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOrder(int order_no) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public int getOrderListCount() {
		
		return this.sqlSession.selectOne("getOrderListCount");
		
	}

	@Override
	public List<OrderDTO> getOrderList(PageDTO dto) {
		
		return this.sqlSession.selectList("getOrderList", dto);
		
	}
	
	@Override
	public List<ProductDTO> getOrderProductList(int product_no) {

		return this.sqlSession.selectList("getOrderProductList", product_no);
		
	}

	@Override
	public int orderStatusChange(Map<String, Object> map) {
		
		return this.sqlSession.update("orderStatusChange", map);
		
	}

	@Override
	public int getOrderSearchListCount(String keyword) {

		return this.sqlSession.selectOne("getOrderSearchListCount", keyword);
		
	}

	@Override
	public List<OrderDTO> getOrderSearchList(Map<String, Object> map) {
		
		return this.sqlSession.selectList("getOrderSearchList", map);
		
	}
	
	@Override
	public int getOrderDelListCount() {

		return this.sqlSession.selectOne("getOrderDelListCount");
		
	}

	@Override
	public List<OrderDTO> getOrderDelList(PageDTO dto) {
		
		return this.sqlSession.selectList("getOrderDelList", dto);
		
	}

	@Override
	public int getOrderDelSearchListCount(String keyword) {
		
		return this.sqlSession.selectOne("getOrderDelSearchListCount", keyword);
		
	}

	@Override
	public List<OrderDTO> getOrderDelSearchList(Map<String, Object> map) {

		return this.sqlSession.selectList("getOrderDelSearchList", map);
		
	}

	@Override
	public List<OrderDTO> getSamePakageOrderList(int order_pakage) {
		return this.sqlSession.selectList("getOrderSamePakage", order_pakage);
	}
	
	@Override
	public int getOrderMaxPackageNo() {

		return this.sqlSession.selectOne("getOrderMaxPackageNo");
		
	}

	@Override
	public int getOrderMaxNo() {

		return this.sqlSession.selectOne("getOrderMaxNo");
		
	}

	@Override
	public void insertorder(Map<String, Object> map) {

		this.sqlSession.insert("insertorder", map);
		
	}

	@Override
	public void updateProductStock(Map<String, Object> map) {
		
		this.sqlSession.update("updateProductStock", map);
		
	}
	
	@Override
	public void updateMinusPoint(Map<String, Object> map) {
		
		this.sqlSession.update("updateMinusPoint", map);
		
	}

	@Override
	public void updateSavePoint(Map<String, Object> map) {

		this.sqlSession.update("updateSavePoint", map);
		
	}

	@Override
	public void updateProductStatus(Map<String, Object> map) {

		this.sqlSession.update("updateProductStatus", map);
		
	}

}
