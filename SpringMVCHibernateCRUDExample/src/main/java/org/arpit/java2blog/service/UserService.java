package org.arpit.java2blog.service;

import java.util.List;

import org.arpit.java2blog.dao.UserDAO;
import org.arpit.java2blog.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
public class UserService {

	@Autowired
	UserDAO userDao;

	@Transactional
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	@Transactional
	public User getUser(int id) {
		return userDao.getUser(id);
	}

	@Transactional
	public void addUser(User u) {
		userDao.addUser(u);
	}

	@Transactional
	public void updateStock(User u) {
		userDao.updateUser(u);
	}

	@Transactional
	public void deleteUser(int id) {
		userDao.deleteUser(id);
	}
	@Transactional
	public User login(String userName, String password) {
		User user = null;
		// Kullanici varmiyok mu kontrol ettik
		for (User u : userDao.getAllUsers())
			if (u.getUserName().equals(userName) && u.getPassword().equals(password))
				return u;// Oyle bir kullanici var

		return user;// yok
	}

}
