package com.itwill.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.itwill.dto.Sales;
import com.itwill.service.SalesService;

@Controller
public class SalesController {
	private static final Logger logger = LoggerFactory.getLogger(SalesController.class);

	@Autowired
	private SalesService salesService;
	
	//�ְ��˻�
	@RequestMapping(value = "/weekSales", method = RequestMethod.GET)
	public String displayWeek(Model model ) {
		logger.info("selectWeekList �޼ҵ� ȣ��");
		model.addAttribute("weekList", salesService.getWeekList());
		logger.info("selectWeekMax �޼ҵ� ȣ��");
		model.addAttribute("weekMax", salesService.getWeekMax());
		logger.info("selectWeekMin �޼ҵ� ȣ��");
		model.addAttribute("weekMin", salesService.getWeekMin());
		logger.info("selectWeekEntire �޼ҵ� ȣ��");
		model.addAttribute("weekEntire", salesService.getWeekEntire());
		logger.info("selectWeekAvg �޼ҵ� ȣ��");
		model.addAttribute("weekAvg", salesService.getWeekAvg());
		return "sales/weekSales";
	}
	
	//�� �˻�
	@RequestMapping(value = "/monthSales", method = RequestMethod.GET)
	public String display(Model model) {
		logger.info("selectMonthList �޼ҵ� ȣ��");
		model.addAttribute("monthList", salesService.getMonthList());
		logger.info("selectMonthMax �޼ҵ� ȣ��");
		model.addAttribute("monthMax", salesService.getMonthMax());
		logger.info("selectMonthMin �޼ҵ� ȣ��");
		model.addAttribute("monthMin", salesService.getMonthMin());
		logger.info("selectMonthEntire �޼ҵ� ȣ��");
		model.addAttribute("monthEntire", salesService.getMonthEntire());
		logger.info("selectMonthAvg �޼ҵ� ȣ��");
		model.addAttribute("monthAvg", salesService.getMonthAvg());
		return "sales/monthSales";
	}
	
	//�Ⱓ �˻�
	@RequestMapping(value = "/month_dateList", method = RequestMethod.GET)
	public String getDateList(@ModelAttribute Sales sales, Model model) {
		String realDateST = "";
		String realdDateED ="";
		
		if (sales.getStartDate() == "" || sales.getStartDate() == null) {
			SimpleDateFormat pattern = new SimpleDateFormat("yyyy-MM-dd");
			Date now = new Date();

			realDateST = pattern.format(now);

		} else {

		String[] splitDate = sales.getStartDate().split("/");
		String dd = splitDate[0];
		String mm = splitDate[1];
		String yyyy = splitDate[2];

		// StartDate
		realDateST = yyyy + "-" + mm + "-" + dd;
		sales.setStartDate(realDateST);
		
		}

		if(sales.getEndDate() == "" || sales.getEndDate() == null) {
			SimpleDateFormat pattern = new SimpleDateFormat("yyyy-MM-dd");
			Date now = new Date();
			
			realdDateED = pattern.format(now);
		} else {
		
		String[] splitDate2 = sales.getEndDate().split("/");
		String DD = splitDate2[0];
		String MM = splitDate2[1];
		String YYYY = splitDate2[2];

		// endDate
		realdDateED = YYYY + "-" + MM + "-" + DD;
		sales.setEndDate(realdDateED);
		
		}
		
		model.addAttribute("termList", salesService.getTermList(sales));
		logger.info("selectBestItem �޼ҵ� ȣ��");
		model.addAttribute("termBest", salesService.getBestItem(sales));
		logger.info("selectWorstIme �޼ҵ� ȣ��");
		model.addAttribute("termWorst", salesService.getWorstIme(sales));
		logger.info("selectTermTotal �޼ҵ� ȣ��");
		model.addAttribute("termTotal", salesService.getTermTotal(sales));
		logger.info("selectTermAvg �޼ҵ� ȣ��");
		model.addAttribute("termAvg", salesService.getTermAvg(sales));
		
		return "sales/daySales";
	}
	
}