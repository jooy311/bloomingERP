package com.itwill.service;

import java.util.List;

import com.itwill.dto.Product;

public interface ProductService {
	List<Product> getProductList();
	
	//��������
	List<Product> getDynamicProductList(Product product);
	
	//���� ������Ʈ��
	int modifyProductList(Product product);
	
	//pdNo���� �����ͼ� �˻��ϴ� ���
	Product getProductNoList(String pNo);
	
	int modifyGotoDelivery(String pNo);
	
	//��ǰ���� ������̺��� �ֱ�
	//int addFromProductToDelivery(Product product);
}