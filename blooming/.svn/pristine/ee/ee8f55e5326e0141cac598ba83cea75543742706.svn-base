package com.itwill.service;

import java.util.List;

import com.itwill.dto.Placeorder;
import com.itwill.dto.Production;
import com.itwill.dto.Receipt;
import com.itwill.dto.Relout;

public interface ProductionService {
	
	List<Production> getProductionList();
	void addProduction(Production production);

	List<Placeorder> getPlaceorderList();
	
	Relout getRelout(String pdnPoNo);
	
	void modifyPlaceorder(Placeorder placeorder);
	void modifyRel(Relout relout);
	void modifyRcp(Receipt receipt);
}
