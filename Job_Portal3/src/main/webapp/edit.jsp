<%@page import="java.util.List"%>
<%@page import="com.entity.Jobs"%>
<%@page import="com.dao.JobDAO"%>
<%@ page import="com.DB.DBConnect" %>
<%@ page import ="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 	 <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="components/all_css.jsp" %>
<style>
.bg-img{
	
	background-image:url(image/jobimage.jpg);
	background-size:cover;
	background-repeat: no-repeat;
	width:100vw;
	height:100vh;

}
</style>
<meta charset="ISO-8859-1">
<title>jobs</title>
</head>
<body>
<c:if test="${userobj.role ne 'admin' }">
	<c:redirect url="signin.jsp"></c:redirect>
	</c:if>
<%@ include file="components/navbar.jsp" %>
	<div class="container-fluid bg-img">
		<div class="row  ">
			<div class=" form-body col-lg-6  col-md-6  col-sm-11 col-xs-11 offset-lg-5 offset-sm-1 offset-xs-1 mt-5 ">
		
		<% 
		int id = Integer.parseInt(request.getParameter("id"));
		JobDAO dao= new JobDAO(DBConnect.getConn());
		dao.getJobById(id);
		Jobs j = dao.getJobById(id);
		%>
				<form method="post" action="update">
				<div class="form bg-light" >
				<input type="hidden" value ="<%=j.getId()%>" name="id">
				
				<div class="post-icon offset-5 "><i class="fa fa-space-shuttle mt-3 " aria-hidden="true">Edit Jobs</i></div>
					
					<!--  <c:if test="${not empty msg}">  
						<div class="alert alert-danger" role="alert">${msg}</div>
						<c:remove var="msg"/>
					</c:if>
					
					-->
					
				<div class="form form-group col-11 m-auto float-left mt-3">
				
				
				<label for="Designation"> title</label>
				<input type="text" name="title" class="form-control" value="<%=j.getTitle()%>">
				<h6 name="pdate" value="<%=j.getPdate()%>" >date</h6>
				</div>
				
				<div class="row mt-3">
				<div class="  form col-lg-11 col-md-6 col-sm-11 col-xs-11 d-flex justify-content-between m-auto" >
					<div class="dropdown  col-3 ">
					<label for="location">Location</label>
					<select name="location" class="location form-control ">
						<option value="<%=j.getLocation()%>"><%=j.getLocation()%></option>
						<option value="lucknow">lucknow</option>
						<option value="goa">goa</option>
						<option value="delhi">delhi</option>
						<option value="noida">noida</option>
						<option value="gurgaon">gurgaon</option>
						<option value="pune">pune</option>
						<option value="chennai">chennai</option>
					</select>
					</div>
					<div class="dropdown col-3">
						<label for="category">Category </label>
						<select name="category" class="location form-control">
							<option value="<%=j.getCategory()%>"><%=j.getCategory()%></option>
							<option value="lucknow">frontend</option>
							<option value="goa">fullstack developer</option>
							<option value="delhi">backend</option>
						</select>
					</div>
					
					<div class="dropdown col-3">
						<label for="<%=j.getStatus()%>"><%=j.getStatus()%> </label>
						<select name="status" class="location form-control" >
							<option value="">choose</option>
							<option value="active">active</option>
							<option value="inactive">inactive</option>
						</select>
					</div>
			
				</div>
				</div>
				
				<div class="  form form-group col-11  mt-3 m-auto ">
				  <label for="exampleFormControlTextarea4">Description</label>
				  <textarea class="form-control " id="exampleFormControlTextarea4" rows="10" cols="auto"  name="description"><%=j.getDescription()%> </textarea>
				</div>
				<div class="form-floating btn col-11">
				   <input type="submit" class="btn btn-submit" id="floatingPassword" value="Post">
				</div>
				</div>
			</form>
			</div>
		</div>
	</div>
<%@ include file="components/footer.jsp" %>
</body>
</html>