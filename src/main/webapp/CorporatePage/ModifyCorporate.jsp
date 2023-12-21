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
       
<div class="mainpage">
        <nav class="navbar">
    <div id="Optionbar">
        <a href="../HomePage.html">Home</a>
        <a href="../CorporateSetup.html">Corporate Setup</a>
        <a href="../UserSetup.html">User Setup</a>
        <a href="../AccountSetup.html">Account Setup</a>
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
    
    <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/Main_Project"
                           user="root"  password="23Sachinkt@09"/>
                           
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from Corporate where CorporateId=?;
            <sql:param value="${param.id}" />
        </sql:query>
        
    <div class="operation">
 		<c:forEach items="${result.rows}"  var="c" >
            <form action="../CorporateServlet" method="get">
            <caption>Enter only Address And Phone Number</caption> <br><br>
         <table border="2" width="40%">
               <td> <input type="hidden" name="id" value="<c:out value="${c.CorporateId}"/>" />  </td>
            <tr><th>CorporateId</th>
             <th><input type="text" value="<c:out value="${c.CorporateId}"/>" name="corporateId" readonly /></th>
             <tr><th>CorporateName</th>
             <th><input type="text" value="<c:out value="${c.CorporateName}"/>" name="corporateName" readonly/></th>
            <tr><th>Address</th>
            <th><input type="text" value="<c:out value="${c.Address}"/>" name="Address"/></th> 
            </tr>
            <tr><th>PhoneNumber</th>
            <th><input type="tel" value="<c:out value="${c.PhoneNumber}"/>" name="PhoneNumber" maxlength="10"/></th>
            </tr>
            <tr>
            <td><input style="margin-left: 100%; padding:4px 20px" type="submit" value="Update" id="submit"></td><br>
            <td><input type="hidden" name="action" value="modify"/></td>
            </tr>
          </c:forEach>  
            </table>
            </form>
            
 </div>
</body>
</html>