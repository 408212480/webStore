package dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import bean.Book;
import utils.DataSourceUtils;

public class BookDaoImpl implements BookDao{

	@Override
	public void insert(Book o) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into book values(?,?,?,?,?,?,?,?)";
		runner.update(sql,o.getName(),o.getCate(),o.getDescr(),o.getDavice(),o.getPush(),o.getMark(),o.getPrice(),
				o.getCount());
	}

	@Override
	public List<Book> findAllBooks() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from orders";
		return runner.query(sql, new BeanListHandler<Book>(Book.class));
	}

	@Override
	public Book findProductInfo(String id) throws SQLException {
		 QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
	        String sql=" select * from book where id= ? ";
	        return qr.query(sql,new BeanHandler<Book>(Book.class),id);
	}

	@Override
	public List<Book> getAll() throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql=" select * from book";
		return qr.query(sql,new BeanListHandler<Book>(Book.class));
	}

	
}
