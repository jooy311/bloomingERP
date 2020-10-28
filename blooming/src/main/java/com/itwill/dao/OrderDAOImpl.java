package com.itwill.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.dto.Order;
import com.itwill.mapper.OrderMapper;

//DAO Ŭ���� : ������ ���� ����,����,����,�˻� ����� �����ϴ� Ŭ����
// => DBMS ������ SQL ������ �����Ͽ� ����� ����� ��ȯ�ϴ� ����� �޼ҵ� �ۼ�

//MyBatis Framework�� �̿��� DAO Ŭ���� �ۼ�
//1.MyBatis ���� ���̺귯�� ���� ó�� - pom.xml
//2.SqlSessionFactory Ŭ������ SqlSession Ŭ������ Spring Bean���� ���
// => Bean Configuration File(root-context.xml)���� bean ������Ʈ�� ����  
//3.Mapper ���� �ۼ� - XML Mapper ���ϰ� Interface Mapper ������ ���ε��Ͽ� �ۼ�
//4.DAO Ŭ������ �޼ҵ忡�� Mapper ���Ͽ� ��ϵ� SQL �������� �����ϰ� ����� �����޾� ��ȯ
// => SqlSession ���� Spring Bean�� ����� �� �ֵ��� �ʵ忡 ������ ó��

//Mybatis Framework���� �����Ǵ� �α׸� Spring �α� ����ü�� ��ϵǵ��� �����ϴ� ���
//1.log4jdbc-log4j2-jdbc4 ���̺귯�� ���� ó�� - pom.xml
//2.DataSource ���� Spring Bean ��Ͻ� driverClassName �ʵ�� url �ʵ带 �����Ͽ� ������ ó�� - root-context.xml
//3.resources ��Ű�� ������ log4jdbc.log4j2.properties ���� �ۼ�
//4.log4j.xml ���Ͽ��� �α� �̺�Ʈ�� ���� ��� ����

//@Repository : DAO Ŭ������ Spring Bean���� ����ϱ� ���� ������̼�
// => Ʈ������ ���� ����� �����޾� ���
//@Repository ������̼��� Spring Container�� ���� ó���ǵ��� ����
// => Bean Configuration File(servlet-context.xml)���� component-scan ������Ʈ�� ���� 
@Repository
public class OrderDAOImpl implements OrderDAO {
	//SqlSession ���� Ŭ������ ��ϵ� Spring Bean�� �ʵ忡 ������ ó���Ͽ� ����
	// => DAO Ŭ������ �޼ҵ忡�� SqlSession ��ü�� �޼ҵ� ȣ��
	//@Autowired ������̼ǰ� @Qualifier ������̼��� �̿��Ͽ� �ڵ� ������ ó��
	// => �ʵ帶�� ������ ���� ������̼� ����
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Order> selectOrderList() {
		return sqlSession.getMapper(OrderMapper.class).selectOrderList();
	}

	@Override
	public List<Order> selectOrderNoList(String orderNo) {
		return sqlSession.getMapper(OrderMapper.class).selectOrderNoList(orderNo);
	}

	@Override
	public List<Order> selectOrderPersonList(String person) {
		return sqlSession.getMapper(OrderMapper.class).selectOrderPersonList(person);		
	}

	@Override
	public List<Order> selectOrderProductNameList(String productName) {
		return sqlSession.getMapper(OrderMapper.class).selectOrderProductNameList(productName);		
	}

	@Override
	public List<Order> selectOrderDateList(String orderDate) {
		return sqlSession.getMapper(OrderMapper.class).selectOrderDateList(orderDate);	
	}

	@Override
	public List<Order> selectDynamicOrderList(Order order) {
		return sqlSession.getMapper(OrderMapper.class).selectDynamicOrderList(order);
	}

	@Override
	public Order selectOrderDetail(String orderNo) {
		return sqlSession.getMapper(OrderMapper.class).selectOrderDetail(orderNo);
	}
}