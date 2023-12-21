<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="com.usersetup.UserSetupDao,com.usersetup.UserSetup"%>
  <%@page import="java.io.*,java.util.*,java.sql.*"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Setup</title>
    <link rel="stylesheet" href="./UserCSS/AddUser.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>

<sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/Main_Project"
                           user="root"  password="23Sachinkt@09"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from UserSetup where DeleteStatus=0;
              </sql:query>
    <div class="mainpage">
        <nav class="navbar">
    <div id="Optionbar">
        <a href="../HomePage.html">Home</a>
        <a href="../CorporatePage/viewCorporate.jsp">Corporate Setup</a>
        <a href="ViewUser.jsp">User Setup</a>
        <a href="../AccountPage/ViewAccount.jsp">Account Setup</a>
        <a href="">User Profile</a>
        <a href="../LogoutServlet">Logout</a>
    </div>
    <div class="menu">
        <nav>
            <a class="adduser" href="AddUser.html"><button> <span>Add User </span> </button></a><br><br>
            <a class="modifyuser" href="UserModifyView.jsp"><button> <span>Modify User </span> </button></a><br>
            <a class="deleteuser" href="DeleteUser.jsp"><button> <span>Delete User </span> </button></a><br>
            <a class="viewuser" href="ViewUser.jsp"><button> <span>View User List </span> </button></a> 
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br> 
        </nav>
    </div>
     <div class="operation">
       <center> <h2>List Of Users</h2></center> <br>
   <table border="2" width="80%" style="margin-left:2%">
   <tr><th>Corporate Id</th><th>UserId</th><th>password</th><th>Department</th><th>Address</th><th>Phone</th><th>Action</th>
   </tr>
   <c:forEach var="c" items="${result.rows}">
   <tr>
   <td><c:out value="${c.CorporateId}"/></td>
   <td><c:out value="${c.UserID}"/></td>
   <td><c:out value="${c.UserPassword}"/></td>
   <td><c:out value="${c.Department}"/></td>
   <td><c:out value="${c.Address}"/></td>
   <td><c:out value="${c.PhoneNumber}"/></td>
    <td><a style="color:Green;" href="ModifyUser.jsp?userid=<c:out value="${c.UserID}" />">Update</a></td>
   </tr>
   </c:forEach>
    </div>
</div>
</nav>
</body>
</html>
   