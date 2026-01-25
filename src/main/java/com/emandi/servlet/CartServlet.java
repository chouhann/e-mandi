package com.emandi.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.emandi.dao.CartDAO;
import com.emandi.model.Cart;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CartDAO cartDAO;

	@Override
	public void init() throws ServletException {
		cartDAO = new CartDAO();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userId") == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		int userId = (Integer) session.getAttribute("userId");

		// Handle delete operations
		String action = request.getParameter("action");
		String deleteId = request.getParameter("delete");
		String deleteAll = request.getParameter("delete_all");

		try {
			if ("delete".equals(action) && deleteId != null) {
				cartDAO.deleteCartItem(Integer.parseInt(deleteId));
				response.sendRedirect(request.getContextPath() + "/cart");
				return;
			}

			if (deleteAll != null) {
				cartDAO.deleteAllCartItems(userId);
				response.sendRedirect(request.getContextPath() + "/cart");
				return;
			}

			// Display cart items
			List<Cart> cartItems = cartDAO.getCartItemsByUserId(userId);
			request.setAttribute("cartItems", cartItems);

			request.getRequestDispatcher("/jsp/cart.jsp").forward(request, response);

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/error.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("userId") == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		int userId = (Integer) session.getAttribute("userId");

		String productName = request.getParameter("product_name");
		String productPrice = request.getParameter("product_price");
		String productImage = request.getParameter("product_image");
		String productType = request.getParameter("product_type");
		String productMobileNo = request.getParameter("product_mobile_no");
		String productDescription = request.getParameter("product_description");
		String productAddress = request.getParameter("product_address");

		try {
			// Check if item already in cart
			if (cartDAO.isItemInCart(userId, productName)) {
				request.setAttribute("message", "Already added to truck!");
				doGet(request, response);
				return;
			}

			// Add to cart
			Cart cart = new Cart();
			cart.setUserId(userId);
			cart.setName(productName);
			cart.setPrice(Double.parseDouble(productPrice));
			cart.setImage(productImage);
			cart.setType(productType);
			cart.setMobileNo(productMobileNo);
			cart.setDescription(productDescription);
			cart.setAddress(productAddress);

			if (cartDAO.addToCart(cart)) {
				response.sendRedirect(request.getContextPath() + "/cart");
			} else {
				request.setAttribute("message", "Failed to add to truck!");
				doGet(request, response);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/error.jsp");
		}
	}
}