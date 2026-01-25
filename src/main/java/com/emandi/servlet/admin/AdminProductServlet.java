package com.emandi.servlet.admin;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.emandi.dao.ProductDAO;
import com.emandi.model.Product;

@WebServlet("/admin/products")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
		maxFileSize = 1024 * 1024 * 10, // 10 MB
		maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class AdminProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductDAO productDAO;

	@Override
	public void init() throws ServletException {
		productDAO = new ProductDAO();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		try {
			if ("delete".equals(action)) {
				handleDelete(request, response);
				return;
			}

			// Display all products
			List<Product> products = productDAO.getAllProducts();
			request.setAttribute("products", products);

			request.getRequestDispatcher("/jsp/admin/products.jsp").forward(request, response);

		} catch (SQLException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() + "/error.jsp");
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		try {
			if ("add".equals(action)) {
				handleAdd(request, response);
			} else if ("update".equals(action)) {
				handleUpdate(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Database error occurred.");
			doGet(request, response);
		}
	}

	private void handleAdd(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		String name = request.getParameter("name");
		String priceStr = request.getParameter("price");
		String type = request.getParameter("type");
		String mobileNo = request.getParameter("mobile_no");
		String description = request.getParameter("description");
		String address = request.getParameter("address");

		// Check if product already exists
		if (productDAO.productNameExists(name)) {
			request.setAttribute("errorMessage", "Product name already exists!");
			doGet(request, response);
			return;
		}

		// Handle file upload
		Part filePart = request.getPart("image");
		String fileName = extractFileName(filePart);
		String uploadPath = getServletContext().getRealPath("") + File.separator + "uploaded_img";

		// Create directory if not exists
		File uploadDir = new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdirs();
		}

		// Save file
		String filePath = uploadPath + File.separator + fileName;
		filePart.write(filePath);

		// Create product
		Product product = new Product();
		product.setName(name);
		product.setPrice(Double.parseDouble(priceStr));
		product.setImage(fileName);
		product.setType(type);
		product.setMobileNo(mobileNo);
		product.setDescription(description);
		product.setAddress(address);

		if (productDAO.addProduct(product)) {
			request.setAttribute("successMessage", "Product added successfully!");
		} else {
			request.setAttribute("errorMessage", "Failed to add product!");
		}

		response.sendRedirect(request.getContextPath() + "/admin/products");
	}

	private void handleUpdate(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String priceStr = request.getParameter("price");

		Product product = new Product();
		product.setId(id);
		product.setName(name);
		product.setPrice(Double.parseDouble(priceStr));

		// Handle file upload if new image provided
		Part filePart = request.getPart("image");
		if (filePart != null && filePart.getSize() > 0) {
			String fileName = extractFileName(filePart);
			String uploadPath = getServletContext().getRealPath("") + File.separator + "uploaded_img";
			String filePath = uploadPath + File.separator + fileName;
			filePart.write(filePath);
			product.setImage(fileName);
		} else {
			// Keep old image
			Product oldProduct = productDAO.getProductById(id);
			product.setImage(oldProduct.getImage());
		}

		if (productDAO.updateProduct(product)) {
			request.setAttribute("successMessage", "Product updated successfully!");
		} else {
			request.setAttribute("errorMessage", "Failed to update product!");
		}

		response.sendRedirect(request.getContextPath() + "/admin/products");
	}

	private void handleDelete(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException {

		int id = Integer.parseInt(request.getParameter("id"));

		// Get product to delete image file
		Product product = productDAO.getProductById(id);

		if (productDAO.deleteProduct(id)) {
			// Delete image file
			if (product != null && product.getImage() != null) {
				String uploadPath = getServletContext().getRealPath("") + File.separator + "uploaded_img";
				String filePath = uploadPath + File.separator + product.getImage();
				File file = new File(filePath);
				if (file.exists()) {
					file.delete();
				}
			}
		}

		response.sendRedirect(request.getContextPath() + "/admin/products");
	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}
}