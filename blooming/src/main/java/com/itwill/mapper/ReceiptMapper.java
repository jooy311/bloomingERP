package com.itwill.mapper;

import java.util.List;

import com.itwill.dto.Placeorder;
import com.itwill.dto.Receipt;
import com.itwill.dto.Relout;
import com.itwill.dto.Stock;

public interface ReceiptMapper {
	
	int insertRcp(Receipt receipt);
	Receipt selectCearchRcp(String rcpNo);
	List<Receipt> selectRcpList();
	List<Receipt> selectRcpListUp();
	List<Placeorder> selectPoList();
	Stock selectStock(String rcpNo);
	Relout selectRelout(String rcpNo);
	int updateRcp(Receipt receipt);
	int updateStock(Stock stock);
	int updateRel(Relout relout);
	int updatePl(Placeorder placeorder);
}