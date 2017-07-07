package org.arpit.java2blog.service;

import java.util.List;

import org.arpit.java2blog.dao.StockDAO;
import org.arpit.java2blog.model.Stock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("stockService")
public class StockService {

	@Autowired
	StockDAO stockDao;

	@Transactional
	public List<Stock> getAllStocks() {
		return stockDao.getAllStocks();
	}

	@Transactional
	public Stock getStock(int id) {
		return stockDao.getStock(id);
	}

	@Transactional
	public void addStock(Stock p) {
		stockDao.addStock(p);
	}

	@Transactional
	public void updateStock(Stock s) {
		stockDao.updateStock(s);
	}

	@Transactional
	public void deleteStock(int id) {
		stockDao.deleteStock(id);
	}

	@Transactional
	public List<Stock> getAllStocksByProductId(int id) {
		return stockDao.getAllStocksByProductId(id);
	}

}
