package com.emandi.util;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class FileUploadUtil {

	private static final int MAX_FILE_SIZE = 2 * 1024 * 1024; // 2MB
	private static final int MAX_REQUEST_SIZE = 5 * 1024 * 1024; // 5MB

	public static String uploadFile(HttpServletRequest request, String uploadPath)
			throws ServletException, IOException {

		String fileName = null;

		if (!ServletFileUpload.isMultipartContent(request)) {
			throw new ServletException("Content type is not multipart/form-data");
		}

		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024 * 1024); // 1MB
		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setFileSizeMax(MAX_FILE_SIZE);
		upload.setSizeMax(MAX_REQUEST_SIZE);

		try {
			List<FileItem> items = upload.parseRequest(request);

			for (FileItem item : items) {
				if (!item.isFormField()) {
					fileName = new File(item.getName()).getName();
					String filePath = uploadPath + File.separator + fileName;
					File storeFile = new File(filePath);

					// Create directory if it doesn't exist
					File parentDir = storeFile.getParentFile();
					if (!parentDir.exists()) {
						parentDir.mkdirs();
					}

					item.write(storeFile);
				}
			}
		} catch (Exception e) {
			throw new ServletException("File upload failed", e);
		}

		return fileName;
	}

	public static boolean deleteFile(String filePath) {
		File file = new File(filePath);
		if (file.exists()) {
			return file.delete();
		}
		return false;
	}
}