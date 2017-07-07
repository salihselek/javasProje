package org.arpit.java2blog.dao;

import java.util.List;

import org.arpit.java2blog.model.Product;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	public List<Product> getAllProducts() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Product> products = session.createQuery("from Product").list();
		return products;
	}

	public Product getProduct(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Product p = (Product) session.get(Product.class, id);
		return p;
	}

	public Product addProduct(Product p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		return p;
	}

	public void updateProduct(Product p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(p);
	}

	public void deleteProduct(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Product p = (Product) session.load(Product.class, id);
		if (p != null) {
			session.delete(p);
		}
	}

}
