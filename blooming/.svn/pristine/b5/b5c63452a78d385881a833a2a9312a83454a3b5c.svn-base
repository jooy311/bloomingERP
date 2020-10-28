package com.itwill.mapper;

import java.util.List;

import com.itwill.dto.Placeorder;
import com.itwill.dto.Production;
import com.itwill.dto.Receipt;
import com.itwill.dto.Relout;

public interface ProductionMapper {
	
	List<Production> selectProductionList();
	int insertProduction(Production production);
	
	List<Placeorder> selectPlaceorderList();
	
	Relout selectRelout(String pdnPoNo);
	
	int updatePlaceorder(Placeorder placeorder);
	int updateRel(Relout relout);
	int updateRcp(Receipt receipt);
}
