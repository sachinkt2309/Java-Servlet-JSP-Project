<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.corporate.CorporateDao,com.corporate.Corporate"%>
  <%@page import="java.io.*,java.util.*,java.sql.*"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CorporateList</title>
    <link rel="stylesheet" href="./CorporateCSS/viewCorporate.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
  <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/Main_Project"
                           user="root"  password="23Sachinkt@09"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from Corporate where DeleteStatus=0;
            
        </sql:query>
<div class="mainpage">
        <nav class="navbar">
    <div id="Optionbar">
        <a href="../HomePage.html">Home</a>
        <a href="viewCorporate.jsp">Corporate Setup</a>
        <a href="../UserPage/ViewUser.jsp">User Setup</a>
        <a href="../AccountPage/ViewAccount.jsp">Account Setup</a>
        <a href="">User Profile</a>
        <a href="../LogoutServlet">Logout</a>
    </div>
    <div class="menu">
        <nav>
            <a class="addcorp" href="AddCorporate.html"><button> <span>Add Corporate </span> </button></a><br><br>
            <a class="modifycorp" href="Modifyview.jsp"><button> <span>Modify Corporate </span> </button></a><br>
            <a class="deletecorp" href="deleteview.jsp"><button> <span>Delete Corporate </span> </button></a><br>
            <a class="viewcorp" href="viewCorporate.jsp"><button> <span>View Corporate List </span> </button></a> 
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br> 
        </nav>
    </div>
 
  <div class="operation">
   
  
 <center> <h2>Select Corporate to Update</h2></center><br>
   <table border="2" width="80%" style="margin-left:2%">
    
   <tr><th>Corporate Id</th><th>CorporateName</th><th>Address</th><th>Phone</th><th>Action</th>
   </tr>
   <c:forEach var="c" items="${result.rows}">
   <tr>
   <td><c:out value="${c.CorporateId}"/></td>
   <td><c:out value="${c.CorporateName}"/></td>
   <td><c:out value="${c.Address}"/></td>
   <td><c:out value="${c.PhoneNumber}"/></td>
   <td><a style="color:Green;" href="ModifyCorporate.jsp?id=<c:out value="${c.CorporateId}" />">Update</a></td>
   </tr>
   </c:forEach>
</table>
   </div>
</body>
</html>