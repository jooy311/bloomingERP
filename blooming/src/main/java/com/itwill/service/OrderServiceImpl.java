package com.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.dao.OrderDAO;
import com.itwill.dao.ProductDAO;
import com.itwill.dto.Order;
import com.itwill.dto.Product;

//Service Ŭ���� : ���α׷� �ۼ��� �ʿ��� ����� �����ϴ� Ŭ����
// => Service Ŭ������ �޼ҵ�� DAO Ŭ������ �޼ҵ带 ȣ���Ͽ� ��� ����

//@Service : Service Ŭ������ Spring Bean���� ����ϱ� ���� ������̼�
// => ���� ó�� ����� �����޾� ���
//@Service ������̼��� Spring Container�� ���� ó���ǵ��� ����
//=> Bean Configuration File(servlet-context.xml)���� component-scan ������Ʈ�� ���� 
@Service
public class OrderServiceImpl implements OrderService {
	//DAO ���� Ŭ������ ��ϵ� Spring Bean�� �ʵ忡 ������ ó���Ͽ� ����
	// => Service Ŭ������ �޼ҵ忡�� DAO ��ü�� �޼ҵ� ȣ��
	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private ProductDAO productDAO;

	@Override
	public List<Order> getOrderList() {
		return orderDAO.selectOrderList();
	}

	@Override
	public List<Order> getOrderNoList(String orderNo) {
		return orderDAO.selectOrderNoList(orderNo);
	}

	@Override
	public List<Order> getOrderPersonList(String person) {
		return orderDAO.selectOrderPersonList(person);		
	}

	@Override
	public List<Order> getOrderProductNameList(String productName) {
		return orderDAO.selectOrderProductNameList(productName);
	}

	@Override
	public List<Order> getOrderDateList(String orderDate) {
		return orderDAO.selectOrderDateList(orderDate);
	}

	@Override
	public List<Order> getDynamicOrderList(Order order) {
		return orderDAO.selectDynamicOrderList(order);
	}

	@Override
	public Order getOrderDetail(String orderNo) {
		return orderDAO.selectOrderDetail(orderNo);
	}

	@Override
	public List<Product> getProductList() {
		return productDAO.selectProductList();
	}
	
}
