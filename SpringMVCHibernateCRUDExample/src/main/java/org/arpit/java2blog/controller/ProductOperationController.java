package org.arpit.java2blog.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.arpit.java2blog.model.PStock;
import org.arpit.java2blog.model.Product;
import org.arpit.java2blog.model.Stock;
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
public class ProductOperationController {

	@Autowired
	ProductService productService;

	@Autowired
	LoginController loginController;

	@Autowired
	StockService stockService;

	final int STOCK_OPERATION_TYPE_ENTRY = 1;
	final int STOCK_OPERATION_TYPE_EXIT = 2;

	@RequestMapping(value = "/ioProducts", method = RequestMethod.GET, headers = "Accept=application/json")
	public String getProductsForOperations(Model model) {
		model.addAttribute("pStock", new PStock());
		model.addAttribute("listOfProducts", productService.getAllProducts());
/*
		User activeUser=loginController.activeUser;
		model.addAttribute("activeUserName", activeUser.getUserName());		
*/		
		return "productOperation";
	}
	// ürün giriþi
	// get

	@RequestMapping(value = "/entryStock/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public String entryStock(@PathVariable("id") int id, Model model) {
		PStock pStock = new PStock();
		pStock.setProductId(id);
		pStock.setOperationType(STOCK_OPERATION_TYPE_ENTRY);
		model.addAttribute("pStock", pStock);
		model.addAttribute("listOfProducts", productService.getAllProducts());
		model.addAttribute("information", "Stok Giriþi");
		return "productOperation";
	}

	// post
	@RequestMapping(value = "addStock", method = RequestMethod.POST, headers = "Accept=application/json")
	public String addStock(@ModelAttribute("pStock") PStock pStock) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Product p = productService.getProduct(pStock.getProductId());
		Stock newStock = new Stock();
		newStock.setProduct(p);
		newStock.setStock(pStock.getQuantity());

		switch (pStock.getOperationType()) {
		case STOCK_OPERATION_TYPE_ENTRY:
			newStock.setOperation("Ürün Giriþi");
			p.setUnitsInStock(p.getUnitsInStock() + pStock.getQuantity());
			break;
		case STOCK_OPERATION_TYPE_EXIT:
			newStock.setOperation("Ürün Çýkýþý");
			p.setUnitsInStock(p.getUnitsInStock() - pStock.getQuantity());
			break;
		}
		if (loginController.activeUser != null)
			newStock.setUser(loginController.activeUser);

		newStock.setDate(formatter.format(Calendar.getInstance().getTime()));
		// önce ürünün miktarýný arttýralým
		// Product updateProduct = stock.getProduct();
		// yeni stok

		productService.updateProduct(p);// ürünün stoðunu

		// güncelledik.
		stockService.addStock(newStock);
		// stock.setUser("");
		return "redirect:/ioProducts";
	}

	// ürün çýkýþý

	@RequestMapping(value = "/exitStock/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public String exitStock(@PathVariable("id") int id, Model model) {
		PStock pStock = new PStock();
		pStock.setProductId(id);
		pStock.setOperationType(STOCK_OPERATION_TYPE_EXIT);
		model.addAttribute("pStock", pStock);
		model.addAttribute("listOfProducts", productService.getAllProducts());
		model.addAttribute("information", "Stok Çýkýþý");
		return "productOperation";
	}
}
