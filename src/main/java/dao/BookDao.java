package dao;

import java.sql.SQLException;
import java.util.List;

import bean.Book;

public interface BookDao {
	public void insert(Book book) throws SQLException;
	public List<Book> findAllBooks() throws SQLException;
	public Book findProductInfo(String id) throws SQLException;

	public List<Book> getAll() throws SQLException;

}
