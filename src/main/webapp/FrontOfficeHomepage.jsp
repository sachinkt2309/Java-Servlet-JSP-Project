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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
body{
    background-image: url('BackGroundimage2.jpg');
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
}

div.mainpage{
    height: 100%;
    width: 100%;
    display: block;
    } 
    
#Optionbar{
     width: 100%;
     background-color:cadetblue;
     padding:10px 10px;
     padding-bottom: 15px;
     font-size: 20px;
     text-align:left;
     overflow: hidden;
     display: block;
}
nav.navbar{
    position: fixed;  
    top: 0;
    width: 100%;
}
#Optionbar a{
    text-decoration: none;
    color: black;
    border-style:groove;
    font-family:Calibri;
    padding: 12px 32px;
    border-spacing: 0%;
    border-color: rgb(126, 188, 204);

}

div.operation{
    background-image: url('./corporateBackgroundImage1.jpg');
    background-repeat: no-repeat;
    background-attachment: fixed;
    background-size: cover;
    display:inline-block;
    background-color: rgb(255, 254, 255); 
    height:600px;
    width:74%;
    margin-left:13%;
    white-space: nowrap;
    
    
}


div.operation form,input{
    margin-left: 4%;
    font-size: 20px;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
}
</style>
</head>
<body>

  <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/Main_Project"
                           user="root"  password="23Sachinkt@09"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from Account where CorporateId=<%=request.getAttribute("CorptId")%>;
            
        </sql:query>
         
<div class="mainpage">
        <nav class="navbar">
    <div id="Optionbar">
   
        <a id="home"  href="FrontOfficeHomepage.jsp">Home</a>      
         <a href="ChangePassword.jsp?userid=<c:out value="${c1.userID}" />">Change Password</a>
        <a id="logout" href="LogoutServlet">Logout</a>
    </div>
   
  <div class="operation">
  <
   <center><h2>Welcome to Smart Bank</h2></center><br>
 <center> <h2>List Of Accounts</h2></center> <br>
   <table border="2" width="80%" style="margin-left:2%">
   <tr><th>Corporate Id</th><th>AccountNumber</th><th>AccountName</th><th>Currency</th><th>Branch</th><th>Action</th>
   </tr>
   <c:forEach var="c" items="${result.rows}">
   <tr>
   <td><c:out value="${c.CorporateId}"/></td>
   <td><c:out value="${c.AccountNumber}"/></td>
   <td><c:out value="${c.AccountName}"/></td>
   <td><c:out value="${c.Currency}"/></td>
   <td><c:out value="${c.branch}"/></td>
   <td><a style="color:blueviolet;" href="ViewAccounts.jsp?AccountNumber=<c:out value="${c.AccountNumber}" />">Details</a></td>
   
   </tr>
   </c:forEach>
</table>
   </div>
</body>
</html>