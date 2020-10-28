package com.itwill.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.dto.Placeorder;
import com.itwill.dto.Production;
import com.itwill.dto.Receipt;
import com.itwill.dto.Relout;
import com.itwill.service.EmployeeService;
import com.itwill.service.ProductionService;


@Controller
public class ProductionController {
	
	@Autowired
	private ProductionService productionService;
	
	@Autowired
	private EmployeeService employeeService;
	
	// @RequestParam String pdnPoNo, 
	@RequestMapping(value = "/production", method = RequestMethod.GET)
	public String production(Model model) {
		
		model.addAttribute("productionList", productionService.getProductionList());
		model.addAttribute("prEmpList", employeeService.getEmployeeList());
		model.addAttribute("poList", productionService.getPlaceorderList());
		
		return "production/production";
	}
	
	@RequestMapping(value = "/production", method = RequestMethod.POST)
	public String production(@ModelAttribute Production production, @ModelAttribute Placeorder placeorder, @ModelAttribute Relout relout, @ModelAttribute Receipt receipt, Model model) {
		
		productionService.addProduction(production);
		productionService.modifyPlaceorder(placeorder);
		productionService.modifyRel(relout);
		productionService.modifyRcp(receipt);
		
		model.addAttribute("productionList", productionService.getProductionList());
		model.addAttribute("prEmpList", employeeService.getEmployeeList());
		model.addAttribute("poList", productionService.getPlaceorderList());
		
		return "production/production";
	}
	
	@RequestMapping(value = "/relSearch/{pdnPoNo}", method = RequestMethod.GET)
	@ResponseBody
	public Relout relSearch(@PathVariable String pdnPoNo) {
		return productionService.getRelout(pdnPoNo);
	}
}