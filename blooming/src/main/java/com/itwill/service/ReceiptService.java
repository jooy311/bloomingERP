package com.itwill.service;

import java.util.List;

import com.itwill.dto.Placeorder;
import com.itwill.dto.Receipt;
import com.itwill.dto.Relout;
import com.itwill.dto.Stock;

public interface ReceiptService {
	
	int addRcp(Receipt receipt);
	Receipt getCearchRcp(String rcpNo);
	List<Receipt> getRcpList();
	List<Receipt> getRcpListUp();
	List<Placeorder> getPoList();
	Stock getStock(String rcpNo);
	Relout getRelout(String rcpNo);
	int modifyRcp(Receipt receipt);
	int modifyStock(Stock stock);
	int modifyRel(Relout relout);
	int modifyPl(Placeorder placeorder);
}
