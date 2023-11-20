package co.empresa.trabajo.controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.empresa.trabajo.dao.UsuarioDao;
import co.empresa.trabajo.modelo.User;

/**
 * Servlet implementation class UsuarioServlet
 */
@WebServlet("/")
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UsuarioDao usuarioDao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsuarioServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {

		this.usuarioDao = new UsuarioDao();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getServletPath();

		try {
			switch (action) {

			case "/new":
				showNewForm(request, response);
				break;

			case "/insert":
				insertarMovimiento(request, response);
				break;

			case "/delete":
				eliminarMovimiento(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				actualizarMovimiento(request, response);
				break;
			default:
				listarMovimentos(request, response);
				break;
			}
		} catch (SQLException e) {
			throw new ServletException(e);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nombre = request.getParameter("nombre");
		String pass = request.getParameter("pass");

		UsuarioDao modelo = new UsuarioDao();
		User user = modelo.iniciarSesion(nombre, pass);

		if (user == null) {
			request.setAttribute("mensaje", "Error nombre de usuario y/o clave");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		} else {
			response.sendRedirect("moves.jsp");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("registrar.jsp");
		dispatcher.forward(request, response);
	}

	private void insertarMovimiento(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, SQLException, IOException {

		String username = request.getParameter("username");
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");

		User user = new User(username, pass, email);

		usuarioDao.insert(user);

		response.sendRedirect("list");
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		User usuarioActual = usuarioDao.select(id);

		request.setAttribute("user", usuarioActual);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("registrar.jsp");
		dispatcher.forward(request, response);

	}

	private void actualizarMovimiento(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, SQLException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		String nombre = request.getParameter("username");
		String email = request.getParameter("pass");
		String pais = request.getParameter("email");

		User user = new User(id, nombre, email, pais);

		usuarioDao.update(user);

		response.sendRedirect("list");
	}

	private void eliminarMovimiento(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, SQLException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		usuarioDao.delete(id);

		response.sendRedirect("list");
	}

	private void listarMovimentos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, SQLException, IOException {

		List<User> listUsuarios = usuarioDao.selectAll();
		request.setAttribute("listUsuarios", listUsuarios);

		RequestDispatcher dispatcher = request.getRequestDispatcher("moves.jsp");
		dispatcher.forward(request, response);
	}
}
