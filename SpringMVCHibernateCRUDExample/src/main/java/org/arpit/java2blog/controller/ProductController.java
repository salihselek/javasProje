package org.arpit.java2blog.controller;

import java.util.List;

import org.arpit.java2blog.model.Product;
import org.arpit.java2blog.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {

	@Autowired
	ProductService productService;

	@RequestMapping(value = "/getAllProducts", method = RequestMethod.GET, headers = "Accept=application/json")
	public String getProducts(Model model) {
		List<Product> listOfProducts = productService.getAllProducts();
		model.addAttribute("product", new Product());
		model.addAttribute("listOfProducts", listOfProducts);
		return "productDetails";
	}

	// Ekleme ve Düzenleme Formundan gelen kýsým (Post olarak geliyor)
	@RequestMapping(value = "/addProduct", method = RequestMethod.POST, headers = "Accept=application/json")
	public String addProduct(@ModelAttribute("model") Product product) {
		if (product.getId() == 0) {// insert
			productService.addProduct(product);
		} else {
			productService.updateProduct(product);
		}
		return "redirect:/getAllProducts";
	}

	@RequestMapping(value = "/updateProduct/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public String updateProduct(@PathVariable("id") int id, Model model) {
		model.addAttribute("product", this.productService.getProduct(id));
		model.addAttribute("listOfProducts", this.productService.getAllProducts());
		return "productDetails";
	}

	@RequestMapping(value = "/deleteProduct/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
	public String deleteProduct(@PathVariable("id") int id) {
		this.productService.deleteProduct(id);
		return "redirect:/getAllProducts";
	}

	@RequestMapping(value = "/dashboard", method = RequestMethod.GET, headers = "Accept=application/json")
	public String dashboard() {

		return "dashboard";
	}

}
