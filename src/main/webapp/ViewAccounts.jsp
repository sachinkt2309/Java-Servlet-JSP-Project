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
            SELECT * from Account where AccountNumber=?;
             <sql:param value="${param.AccountNumber}" /> 
        </sql:query>
<div class="mainpage">
        <nav class="navbar">
    <div id="Optionbar">
   
        <a id="home"  href="FrontOfficeHomepage.jsp">Home</a>
        <a id="logout" href="LogoutServlet">Logout</a>
    </div>
   
  <div class="operation">
  <center> <h2>details of Account </h2></center> <br>
  <c:forEach items="${result.rows}"  var="c" >
   <table border="2" width="40%" style="margin-left:2%">
   <td><input type="hidden" maxlength="13" value="<c:out value="${c.AccountNumber}"/>" name="AccountNumber" id="accountNumber"/></td>
   <tr><th>Corporate Id</th>
   <th><input type="text" value="<c:out value="${c.CorporateId}"/>" name="corporateId" readonly /></th></tr>
   <tr><th>AccountNumber</th>
   <th><input type="number" maxlength="13" value="<c:out value="${c.AccountNumber}"/>" name="AccountNumber" id="accountNumber" readonly/></th></tr>
   <tr><th>AccountName</th>
   <th><input type="text" value="<c:out value="${c.AccountName}"/>" name="accountName" id="accountName" readonly/></th></tr>
   <tr><th>Currency</th>
   <th><input type="text" value="<c:out value="${c.Currency}"/>" name="currency" id="currency" readonly/></th></tr>
   <tr><th>Branch</th>
   <th><input type="text" value="<c:out value="${c.branch}"/>" name="branch" id="branch" readonly/></th></tr>
   <tr><th>Available balance</th>
   <th><input type="number" value="<c:out value="${c.AvBalance}"/>" name="availableBalance" id="availableBalance" readonly/></th></tr>
   <tr><th>Account Status</th>
   <th><input type="text" value="<c:out value="${c.Status}"/>" name="accountStatus" id="status" readonly/></th></tr>
   <tr><th><input type="button" value="Back" onclick="javascript:history.go(-1)"></th><tr>
   </tr>
   
   </c:forEach>
</table>
   </div>
</body>
</html>