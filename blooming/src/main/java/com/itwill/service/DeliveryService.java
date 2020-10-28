package com.itwill.service;

import java.util.List;

import com.itwill.dto.Delivery;
import com.itwill.dto.Transport;

public interface DeliveryService {
	//��ü �˻�
	List<Delivery> getDeliveryList();
	//��������
	List<Delivery> getDynamicProductList(Delivery delivery);
	Delivery selectDeliveryNoList(Delivery deliver);
	
	int modifyDeliveryStatus(String deliPdNo);
	int modifyDeliveryTransfort(Delivery delivery);
	
	List<Transport> getTransportList(); 
}
