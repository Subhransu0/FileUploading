package in.sp.backend;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/MyServlet")
@MultipartConfig
public class UploadFile extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Part p = req.getPart("files");
		String filename = p.getSubmittedFileName();

		String Remark = req.getParameter("remark");
		HttpSession session = req.getSession();
		try {
			Connection connection = DBconnection.getConnection();
			PreparedStatement ps = connection.prepareStatement("insert into image_detail(img_name , remark) values (?,?)");
			ps.setString(1, filename);
			ps.setString(2, Remark);

			int i = ps.executeUpdate();
			if (i > 0) {

				String path = getServletContext().getRealPath("") + "Image";
				File file = new File(path);
				p.write(path + File.separator + filename);

				session.setAttribute("mssg", "Upload Success");

				resp.sendRedirect("index.jsp");
				
				

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
