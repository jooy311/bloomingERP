package com.itwill.mapper;

import java.util.List;

import com.itwill.dto.Transport;

public interface TransportMapper {
	//��ü�˻�
	List<Transport> selectTransprotList();
	//��������
	List<Transport> selectDynamicTransprotList(Transport transport);
	
	int insertTransport(Transport transport);
	Transport selectTransprotDoubleCheck(String tpNo);
	int updateTransport(Transport transport);
}
