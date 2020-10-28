package com.itwill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.dto.Placeorder;
import com.itwill.dto.Receipt;
import com.itwill.dto.Relout;
import com.itwill.dto.Stock;
import com.itwill.service.ReceiptService;
import com.itwill.service.ReloutService;
import com.itwill.service.StockService;

@Controller
public class ReceiptController {
	
	@Autowired
	private ReceiptService receiptService;
	
	@Autowired
	private ReloutService reloutService;
	
	@Autowired
	private StockService stockService;
	
	
	@RequestMapping(value = "/receipt", method = RequestMethod.GET)
	public String receipt(Model model) {
		
		model.addAttribute("rcpList", receiptService.getRcpList());
		model.addAttribute("rcpListUp", receiptService.getRcpListUp());
		model.addAttribute("poList", receiptService.getPoList());
		
		return "stock/receipt";
	}
	
	@RequestMapping(value = "/receipt", method = RequestMethod.POST)
	public String receipt(@ModelAttribute Receipt receipt, @ModelAttribute Relout relout, @ModelAttribute Stock stock, @ModelAttribute Placeorder placeorder,  Model model) {
		
		receiptService.addRcp(receipt);
		reloutService.addRel(relout);
		stockService.addStock(stock);
		receiptService.modifyPl(placeorder);
		
		model.addAttribute("rcpList", receiptService.getRcpList());
		model.addAttribute("rcpListUp", receiptService.getRcpListUp());
		model.addAttribute("poList", receiptService.getPoList());
		
		return "stock/receipt";
	}
	
	
	@RequestMapping(value = "/stock/repUpdate", method = RequestMethod.GET)
	public String cltUpdate(@RequestParam String rcpNo, Model model) {
		
		model.addAttribute("rcpUp", receiptService.getCearchRcp(rcpNo));
		model.addAttribute("relUp", receiptService.getRelout(rcpNo));
		model.addAttribute("stockUp", receiptService.getStock(rcpNo));
		
		return "stock/receipt_update";
	}
	
	@RequestMapping(value = "/stock/repUpdate", method = RequestMethod.POST)
	public String cltUpdate(@ModelAttribute Receipt receipt, @ModelAttribute Relout relout, @ModelAttribute Stock stock, Model model) {
		
		receiptService.modifyRcp(receipt);
		receiptService.modifyRel(relout);
		receiptService.modifyStock(stock);
		
		model.addAttribute("rcpList", receiptService.getRcpList());
		model.addAttribute("poList", receiptService.getPoList());
		
		return "stock/receipt";
	}
}