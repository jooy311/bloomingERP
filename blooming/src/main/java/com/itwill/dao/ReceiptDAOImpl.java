package com.itwill.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.dto.Placeorder;
import com.itwill.dto.Receipt;
import com.itwill.dto.Relout;
import com.itwill.dto.Stock;
import com.itwill.mapper.ReceiptMapper;

@Repository
public class ReceiptDAOImpl implements ReceiptDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	@Override
	public int insertRcp(Receipt receipt) {
		return sqlSession.getMapper(ReceiptMapper.class).insertRcp(receipt);
	}

	@Override
	public Receipt selectCearchRcp(String rcpNo) {
		return sqlSession.getMapper(ReceiptMapper.class).selectCearchRcp(rcpNo);
	}

	@Override
	public List<Receipt> selectRcpList() {
		return sqlSession.getMapper(ReceiptMapper.class).selectRcpList();
	}

	@Override
	public List<Placeorder> selectPoList() {
		return sqlSession.getMapper(ReceiptMapper.class).selectPoList();
	}

	@Override
	public Stock selectStock(String rcpNo) {
		return sqlSession.getMapper(ReceiptMapper.class).selectStock(rcpNo);
	}

	@Override
	public Relout selectRelout(String rcpNo) {
		return sqlSession.getMapper(ReceiptMapper.class).selectRelout(rcpNo);
	}

	@Override
	public int updateRcp(Receipt receipt) {
		return sqlSession.getMapper(ReceiptMapper.class).updateRcp(receipt);
	}

	@Override
	public int updateStock(Stock stock) {
		return sqlSession.getMapper(ReceiptMapper.class).updateStock(stock);
	}

	@Override
	public int updateRel(Relout relout) {
		return sqlSession.getMapper(ReceiptMapper.class).updateRel(relout);
	}

	@Override
	public int updatePl(Placeorder placeorder) {
		return sqlSession.getMapper(ReceiptMapper.class).updatePl(placeorder);
	}

	@Override
	public List<Receipt> selectRcpListUp() {
		return sqlSession.getMapper(ReceiptMapper.class).selectRcpListUp();
	}
}
