package com.itwill.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.dao.ProductionDAO;
import com.itwill.dto.Placeorder;
import com.itwill.dto.Production;
import com.itwill.dto.Receipt;
import com.itwill.dto.Relout;

@Service
public class ProductionServiceImpl implements ProductionService {
	
	@Autowired
	private ProductionDAO productionDAO;
	
	
	@Override
	public List<Production> getProductionList() {
		return productionDAO.selectProductionList();
	}

	@Override
	public void addProduction(Production production) {
		productionDAO.insertProduction(production);
	}

	@Override
	public Relout getRelout(String pdnPoNo) {
		return productionDAO.selectRelout(pdnPoNo);
	}

	@Override
	public void modifyPlaceorder(Placeorder placeorder) {
		productionDAO.updatePlaceorder(placeorder);
	}

	@Override
	public List<Placeorder> getPlaceorderList() {
		return productionDAO.selectPlaceorderList();
	}

	@Override
	public void modifyRel(Relout relout) {
		productionDAO.updateRel(relout);
	}

	@Override
	public void modifyRcp(Receipt receipt) {
		productionDAO.updateRcp(receipt);
	}
}