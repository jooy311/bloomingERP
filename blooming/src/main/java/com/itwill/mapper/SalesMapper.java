package com.itwill.mapper;
import java.util.List;
import java.util.Map;

import com.itwill.dto.Sales;

import oracle.net.aso.s;

public interface SalesMapper {
	
	//�Ⱓ �˻�
	List<Sales> selectTermList(Sales sales);
	
	//�ְ��˻�
	List<Sales> selectWeekList();
	
	//�� ��ü �˻�
	List<Sales> selectMonthList();
	
	//�ְ��ִ����
	List<Sales> selectWeekMax();
	
	//�ְ��ּҸ���
	List<Sales> selectWeekMin();
	
	//�ְ��Ѹ���
	List<Sales> selectWeekEntire();
	
	//�ְ���ո���
	List<Sales> selectWeekAvg();
	
	//�����ִ����
	List<Sales> selectMonthMax();
	
	//�����ּҸ���
	List<Sales> selectMonthMin();
	
	//�����Ѹ���
	List<Sales> selectMonthEntire();
	
	//������ո���
	List<Sales> selectMonthAvg();
	
	//�Ⱓ����Ʈ ������
	List<Sales> selectBestItem(Sales sales);
	
	//�Ⱓ����Ʈ ������
	List<Sales> selectWorstIme(Sales sales);
	
	//�Ⱓ�Ѹ���
	List<Sales> selectTermTotal(Sales sales);
	
	//�Ⱓ��ո���
	List<Sales> selectTermAvg(Sales sales);
	
	//���� ��
	List<Sales> selectNowMonth();
	
	//���������� ����Ʈ ����
	List<Sales> selectNowBest();
	
	//���������� �� �ֹ���
	List<Sales> selectTotalOrder();
	
	//���������� �� ���ַ�
	List<Sales> selectTotalRelout();
	
	//���������� �̹��� ����
	List<Sales> selectNowmonthSales();
	
	//���������� ������ ����
	List<Sales> selectLastmonthSales();
	
	//���������� �̹��б� ����
	List<Sales> selectNowbunSales();
	
	//���������� �����б� ����
	List<Sales> selectLastbunSales();
	
	//���������� �̹��� ����
	List<Sales> selectNowyearSales();
	
	//���������� �۳� ����
	List<Sales> selectLastyearSales();
	
}
