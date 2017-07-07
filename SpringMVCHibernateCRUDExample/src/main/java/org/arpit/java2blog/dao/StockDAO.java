package org.arpit.java2blog.dao;

import java.util.List;

import org.arpit.java2blog.model.Stock;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StockDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	public List<Stock> getAllStocks() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Stock> stocks = session.createQuery("from Stock").list();
		return stocks;
	}

	public Stock getStock(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Stock s = (Stock) session.get(Stock.class, id);
		return s;
	}

	public Stock addStock(Stock s) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(s);
		return s;
	}

	public void updateStock(Stock s) {
		Session session = this.sessionFactory.getCurrentSession();
		session.update(s);
	}

	public void deleteStock(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Stock s = (Stock) session.load(Stock.class, id);
		if (s != null) {
			session.delete(s);
		}
	}

	public List<Stock> getAllStocksByProductId(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		List<Stock> stocks = session.createQuery("select s " 
		+ "from Stock s " 
				+ "left join s.user u "
				+ "left join s.product p "
				+ "where p.id = :id "
				+ "order by date desc").setParameter("id", id)
				.list();
		return stocks;
	}
}
