package org.arpit.java2blog.controller;

import java.util.List;

import org.arpit.java2blog.model.Product;
import org.arpit.java2blog.service.ProductService;
import org.arpit.java2blog.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StockController {

	@Autowired
	StockService stockService;

	@Autowired
	ProductService productService;

	@RequestMapping(value = "/productStocks", method = RequestMethod.GET, headers = "Accept=application/json")
	public String getProductStocks(Model model) {
		List<Product> lis = productService.getAllProducts();
		model.addAttribute("listOfProducts", lis);
		return "productStocks";
	}
/*
 * get link id parametre ile �al���yor
 * 
	@RequestMapping(value = "/showStock/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public String showStock(@PathVariable("id") int id, Model model) {
		model.addAttribute("listOfProducts", productService.getAllProducts());
		model.addAttribute("listOfStocks", stockService.getAllStocksByProductId(id));
		return "productStocks";
	}
*/
	
	/*post ile id prd modeline id geliyor id ye g�re �al���yor.*/
	@RequestMapping(value = "/showStock", method = RequestMethod.POST, headers = "Accept=application/json")
	public String showStock(@ModelAttribute("prd") Product prd, Model model) {
		model.addAttribute("listOfProducts", productService.getAllProducts());
		Product p = productService.getProduct(prd.getId());
		model.addAttribute("listOfStocks", stockService.getAllStocksByProductId(prd.getId()));

		//Ekrana hangi �r�n stoklar�n� listeledi�imizi g�steriyoruz.
		model.addAttribute("stockOfProductInformation", p.getName()+ " �r�n�ne Ait Stok Bilgileri");
		return "productStocks";
	}

}
