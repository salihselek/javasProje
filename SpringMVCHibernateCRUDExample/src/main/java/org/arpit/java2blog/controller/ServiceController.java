package org.arpit.java2blog.controller;

import java.util.List;

import org.arpit.java2blog.model.Country;
import org.arpit.java2blog.model.Product;
import org.arpit.java2blog.model.Status;
import org.arpit.java2blog.model.Stock;
import org.arpit.java2blog.model.User;
import org.arpit.java2blog.service.CountryService;
import org.arpit.java2blog.service.ProductService;
import org.arpit.java2blog.service.StockService;
import org.arpit.java2blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/api/")
public class ServiceController {

	/**** COUNTRY ****/
	@Autowired
	CountryService countryService;

	@ResponseBody
	@RequestMapping(value = "/create", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public Status addCountry(@RequestBody Country country) {
		try {
			countryService.addCountry(country);
			return new Status(1, "ülke eklendi");
		} catch (Exception e) {
			return new Status(0, e.toString());
		}
	}

	@ResponseBody
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public Country getCountryById(@PathVariable("id") int id) {
		Country country = null;
		try {
			country = countryService.getCountry(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return country;
	}

	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public List<Country> getCountryList() {
		List<Country> list = null;
		try {
			list = countryService.getAllCountries();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public Status deleteCountry(@PathVariable("id") int id) {
		try {
			countryService.deleteCountry(id);
			return new Status(1, "ülke silindi");
		} catch (Exception e) {
			return new Status(0, e.toString());
		}
	}

	@ResponseBody
	@RequestMapping(value = "/delete1/{id}", method = RequestMethod.DELETE)
	public Status deleteCountry1(@PathVariable("id") int id) {
		try {
			countryService.deleteCountry(id);
			return new Status(1, "ülke silindi");
		} catch (Exception e) {
			return new Status(0, e.toString());
		}
	}

	@ResponseBody
	@RequestMapping(value = "/updateCountry/{id}", method = RequestMethod.PUT, consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public Status updateCountryFull(@PathVariable("id") int id, @RequestBody Country country) {
		try {
			if (country.getCountryName() == null && country.getPopulation() == 0) {
				return new Status(1, "ülke boþ geldi");
			} else {
				countryService.updateCountry(country);
				return new Status(1, "ülke düzenlendi");
			}
		} catch (Exception e) {
			return new Status(0, e.toString());
		}
	}

	/**** END COUNTRY ****/

	/**** LOGIN ****/
	
	@Autowired
	UserService userService;

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public Status login(@RequestBody User user) {

		User u = userService.login(user.getUserName(), user.getPassword());
		if (u == null) {

			return new Status(0, "Login Denemesi Baþarýsýz");
		} else {
			return new Status(1, "Login Denemesi Baþarýlý");
		}
	}

	/**** END LOGIN ****/

	/**** PRODUCT ****/
	@Autowired
	ProductService productService;

	@ResponseBody
	@RequestMapping(value = "/products", method = RequestMethod.GET)
	public List<Product> productList() {
		List<Product> list = productService.getAllProducts();
		return list;
	}

	/**** END PRODUCT ****/
	
	/**** STOCK ****/
	@Autowired
	StockService stockService;

	@ResponseBody
	@RequestMapping(value = "/stocksByProductId/{id}", method = RequestMethod.GET)
	public List<Stock> stockList(@PathVariable("id") int id) {
		List<Stock> list = stockService.getAllStocksByProductId(id);
		return list;
	}

	/**** END STOCK ****/
	

}
