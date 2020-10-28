package com.itwill.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.dto.BootGridz;
import com.itwill.dto.Product;
import com.itwill.service.ProductService;

@Controller
public class ProductController {
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	//ȸ������� JSON �ؽ�Ʈ ����Ÿ�� �����ϴ� ��û ó�� �޼ҵ�
	@RequestMapping(value="/json_list", method=RequestMethod.GET)
	@ResponseBody
	public List<Product> productListJSON(Model model) {		
		model.addAttribute("product",productService.getProductList());
		return productService.getProductList();
	}
	
	@RequestMapping(value="/json_product", method=RequestMethod.GET)
	public String productList_search(@ModelAttribute Product product,Model model) {
		model.addAttribute("productList",productService.getDynamicProductList(product));
		return "operation/productList";
	}
	
/*�������� �̿��ؼ� �󼼰˻� 
	@RequestMapping(value="/json_product", method=RequestMethod.GET)
	@ResponseBody
	public List<Product> productListJSON_search(@ModelAttribute Product product,Model model) {
		model.addAttribute("product",productService.getDynamicProductList(product));
		return productService.getDynamicProductList(product);
	}
*/
	
	//�����ϱ� ���� �޼ҵ� -> ���µ� ������Ʈ�ϰ� insert�� �ؾ���
	@RequestMapping(value="/product_updateStatus/{pdNo}", method = {RequestMethod.PUT, RequestMethod.PATCH})
	@ResponseBody
	public String goToDel(@PathVariable String pdNo) {
		productService.modifyGotoDelivery(pdNo);
		return "success";
	}
	
	//----select
	@RequestMapping(value="/productList", method = RequestMethod.GET)
	public String productList(Model model){
		model.addAttribute("productList", productService.getProductList());
		return "operation/productList";
	}
	
	@RequestMapping(value="/productList", method = RequestMethod.POST)
	public String productList(@ModelAttribute Product product, Model model){
		model.addAttribute("productList", productService.getDynamicProductList(product));
		return "operation/productList";
	}
	
	//��ǰ no�� �޾ƿ� ������ ������ �� �ֵ��� �ϴ� �޼ҵ�
	@RequestMapping(value = "/product_modify",method = {RequestMethod.PUT, RequestMethod.PATCH})
	@ResponseBody
	public String productModify(@RequestBody Product product) {
		productService.modifyProductList(product);
		return "success";//�����ϸ� ������ String��
	}
	
	@RequestMapping(value="/product_no/{pNo}", method = RequestMethod.GET)
	@ResponseBody
	public Product getProductNo(@PathVariable String pNo) {
		return productService.getProductNoList(pNo);
	}
}
