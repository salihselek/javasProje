package org.arpit.java2blog.service;

import java.util.List;

import org.arpit.java2blog.dao.ProductDAO;
import org.arpit.java2blog.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("productService")
public class ProductService {

	@Autowired
	ProductDAO productDao;

	@Transactional
	public List<Product> getAllProducts() {
		return productDao.getAllProducts();
	}

	@Transactional
	public Product getProduct(int id) {
		return productDao.getProduct(id);
	}

	@Transactional
	public void addProduct(Product p) {
		productDao.addProduct(p);
	}

	@Transactional
	public void updateProduct(Product p) {
		productDao.updateProduct(p);
	}
	
	@Transactional
	public void deleteProduct(int id) {
		productDao.deleteProduct(id);
	}

}
