package org.arpit.java2blog.controller;

import java.util.List;

import org.arpit.java2blog.model.Country;
import org.arpit.java2blog.model.Status;
import org.arpit.java2blog.service.CountryService;
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

	@Autowired
	CountryService countryService;

	@RequestMapping(value = "/create", method = RequestMethod.POST, consumes = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Status addCountry(@RequestBody Country country) {
		try {
			countryService.addCountry(country);
			return new Status(1, "ülke eklendi");
		} catch (Exception e) {
			return new Status(0, e.toString());
		}		
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public @ResponseBody Country getCountryById(@PathVariable("id") int id) {
		Country country = null;
		try {
			country = countryService.getCountry(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return country;
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public @ResponseBody List<Country> getCountryList() {
		List<Country> list = null;
		try {
			list = countryService.getAllCountries();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public @ResponseBody Status deleteCountry(@PathVariable("id") int id) {
		try{
			countryService.deleteCountry(id);
			return new Status(1,"ülke silindi");
		}
		catch (Exception e){
			return new Status(0,e.toString());
		}		
	}
}
