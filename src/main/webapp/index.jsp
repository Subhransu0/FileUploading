<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="in.sp.backend.DBconnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body class="bg-light">

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<p class="text-center fs-3">Image Upload</p>

						<%
						String mssg = (String) session.getAttribute("mssg");
						if (mssg != null) {
						%>
						<h4 class="text-center" style="color: green">
							<%=mssg%>
						</h4>
						<%
						session.removeAttribute("msg");
						}
						%>

						<form action="MyServlet" method="post"
							enctype="multipart/form-data">
							<div class="mb-3">
								<label>Image</label> <input type="file" name="files"
									class="form-control">
							</div>

							<div class="mb-3">
								<label>Remark</label> <input type="text" name="remark"
									class="form-control">
							</div>

							<div class="text-center">
								<button class="btn btn-primary">Upload</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>

		<table class="table mt-4">
			<thead>
				<tr>
					<th scope="col">Image</th>
					<th scope="col">Remark</th>

				</tr>
			</thead>
			<tbody>

				<%
				Connection con = DBconnection.getConnection();
				PreparedStatement ps = con.prepareStatement("select * from image_detail");
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
				%>
				<tr>
					<th scope="row"><img
						src="Image/
						<%=rs.getString("img_name")%>" width="100px" height="100px"></th>
					<td><%=rs.getString("remark")%></td>
				</tr>
				<%
				}
				%>


			</tbody>
		</table>
	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>