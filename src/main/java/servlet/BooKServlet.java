package servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import bean.Book;
import bean.Che;
import dao.BookDao;
import dao.BookDaoImpl;
import utils.WebUtils;

/**
 * Servlet implementation class BooKServlet
 */
@WebServlet(name = "BooKServlet",urlPatterns = "/BooKServlet")
public class BooKServlet extends HttpServlet {
	BookDao bookDao = new BookDaoImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method = request.getParameter("method");
		try {
			if("getBookInfo".equals(method)){
				getBookInfo(request,response);
			}else if("add".equals(method)){
				add(request,response);
			}else if("findche".equals(method)){
				findche(request,response);
			}else if("insert".equals(method)){
				insert(request,response);
			}else if("getAll".equals(method)){
				getAll(request,response);
			}else if("bookList".equals(method)){
				bookList(request,response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	private void bookList(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		BookDao bookDao = new BookDaoImpl();
		List<Book> books = bookDao.getAll();
		request.getSession().setAttribute("bookList", books);
		request.getRequestDispatcher("BookStore/bookList.jsp").forward(request, response);
	}


	private void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		BookDao bookDao = new BookDaoImpl();
		List<Book> books = bookDao.getAll();
		request.getSession().setAttribute("books", books);
		response.sendRedirect("BookStore/shop.jsp");
	}


	private void insert(HttpServletRequest request, HttpServletResponse response) throws IllegalAccessException, InvocationTargetException, SQLException, ServletException, IOException {
		if(!ServletFileUpload.isMultipartContent(request)){
			request.setAttribute("message", "不支持的操作");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
			return;
		}
		try{ 
			String savepath = this.getServletContext().getRealPath("/BookStore/img");
			Book book = WebUtils.doUpload(request,savepath);
			BookDao bookDao = new BookDaoImpl();
			bookDao.insert(book);
			request.setAttribute("message", "上传成功！！");
		}catch (FileUploadBase.FileSizeLimitExceededException e) {
			request.setAttribute("message", "文件不能超过500m");
		}catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "上传失败");
		}
		request.getRequestDispatcher("/BookStore/addBook.jsp").forward(request, response);
		
	}


	private void findche(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Map<String,Che> ches = (Map<String, Che>) request.getServletContext().getAttribute("maps");
		Double sum = 0.0;
		Set<Entry<String, Che>> sets = ches.entrySet();
		for( Entry<String, Che> ent:sets){
			sum+=ent.getValue().getSum();
		}
		DecimalFormat df = new DecimalFormat("#.00");
		String sums = df.format(sum);
		request.getServletContext().setAttribute("sum", sums);
		response.sendRedirect("BookStore/car.jsp");
	}


	private void add(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
		String id = request.getParameter("id");
		Book book = bookDao.findProductInfo(id);

		Map<String,Che> maps = (Map<String,Che>) request.getServletContext().getAttribute("maps");
		if(maps==null){
			maps = new HashMap<>();
		}
		Che c = maps.get(id);
		if(c!=null){
			c.setCount(c.getCount()+1);
			maps.put(id, c);
		}else{
			Che che = new Che();
			che.setCount(1);
			che.setName(book.getName());
			che.setPrice(book.getPrice());
			maps.put(id, che);
		}

		request.getSession().setAttribute("bbook", "aaa");
		request.getServletContext().setAttribute("maps", maps);
		response.sendRedirect("BookStore/info.jsp?method=getBookInfo&id="+id);
	}


	private void getBookInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String id = request.getParameter("id");
		Book book = bookDao.findProductInfo(id);
		request.getServletContext().setAttribute("book", book);
		response.sendRedirect("BookStore/info.jsp");
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
