package org.arpit.java2blog.controller;

import org.arpit.java2blog.model.User;
import org.arpit.java2blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	User activeUser;
	@Autowired
	UserService userService;

	// get
	@RequestMapping(value = "/login", method = RequestMethod.GET, headers = "Accept=application/json")
	public String getLogin(Model model) {

		if (activeUser == null)
			activeUser = new User();

		model.addAttribute("user", activeUser);
		return "login";
	}

	// kullanýcý adý ve þifresini girdiðinde giriþ yapa týkladýðýnda
	@RequestMapping(value = "/tryLogin", method = RequestMethod.POST, headers = "Accept=application/json")
	public String login(@ModelAttribute("user") User user, Model model) {
		// Login olma iþlemi;
		// eðer login olabilirse kullanýcý döner.
		// olmazsa kullanýcýnýn içi null döner
		User selectedUser = userService.login(user.getUserName(), user.getPassword());

		if (selectedUser == null) {// kullanýcý giriþ hatalý
			activeUser = new User();
			model.addAttribute("user", activeUser);
		} else {
			model.addAttribute("user", selectedUser);
			activeUser = selectedUser;
		}
		return "login";
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET, headers = "Accept=application/json")
	public String logout(Model model) {
		activeUser = new User();
		model.addAttribute("user", activeUser);
		return "login";
	}

}
