package com.itwill.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.dto.Placeorder;
import com.itwill.dto.Production;
import com.itwill.dto.Receipt;
import com.itwill.dto.Relout;
import com.itwill.mapper.ProductionMapper;

@Repository
public class ProductionDAOImpl implements ProductionDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public List<Production> selectProductionList() {
		return sqlSession.getMapper(ProductionMapper.class).selectProductionList();
	}

	@Override
	public int insertProduction(Production production) {
		return sqlSession.getMapper(ProductionMapper.class).insertProduction(production);
	}

	@Override
	public Relout selectRelout(String pdnPoNo) {
		return sqlSession.getMapper(ProductionMapper.class).selectRelout(pdnPoNo);
	}

	@Override
	public int updatePlaceorder(Placeorder placeorder) {
		return sqlSession.getMapper(ProductionMapper.class).updatePlaceorder(placeorder);
	}

	@Override
	public List<Placeorder> selectPlaceorderList() {
		return sqlSession.getMapper(ProductionMapper.class).selectPlaceorderList();
	}

	@Override
	public int updateRel(Relout relout) {
		return sqlSession.getMapper(ProductionMapper.class).updateRel(relout);
	}

	@Override
	public int updateRcp(Receipt receipt) {
		return sqlSession.getMapper(ProductionMapper.class).updateRcp(receipt);
	}
}
