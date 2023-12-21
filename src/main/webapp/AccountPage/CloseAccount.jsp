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
    <link rel="stylesheet" href="./AccountCSS/AddAccount.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
  <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/Main_Project"
                           user="root"  password="23Sachinkt@09"/>
 
        <sql:query dataSource="${dbsource}" var="result1">
            SELECT distinct Corporate.CorporateName,Corporate.CorporateId from Corporate inner join Account on Corporate.CorporateId=Account.CorporateId where Account.Status="Active";
            </sql:query>
            
       
<div class="mainpage">
        <nav class="navbar">
    <div id="Optionbar">
        <a href="../HomePage.html">Home</a>
        <a href="../CorporatePage/viewCorporate.jsp">Corporate Setup</a>
        <a href="../UserPage/ViewUser.jsp">User Setup</a>
        <a href="ViewAccount.jsp">Account Setup</a>
        <a href="">User Profile</a>
        <a href="../LogoutServlet">Logout</a>
    </div>
    <div class="menu">
        <nav>
             <nav>
            <a style="display: block;margin-top: 9%; margin-left: 19%;" class="addaccount" href="AddAccount.html"><button> <span>Add Account </span> </button></a><br><br>
            <a style="display: block;margin-top: 16%; margin-left: 15%;" class="closeaccount" href="">CloseAccount.jsp<button> <span>Close Account </span> </button></a><br>
            <a style="display: block;margin-top: 20%; margin-left: 9%;margin-bottom:36%;" class="viewaccount" href="ViewAccount.jsp"><button> <span>View Account List </span> </button></a> 
            <br><br><br><br><br><br><br><br><br><br><br><br><br><br> 
        </nav>
    </div>
 
  <div class="operation">

 <center> <h2>List Of Accounts</h2></center> <br>
 <c:forEach var="c" items="${result1.rows}">
  <sql:query dataSource="${dbsource}" var="result2">
            SELECT * from Account where CorporateId=<c:out value="${c.CorporateId}"/> and Status="Active";    
        </sql:query>
  
   <select><option>&nbsp&nbsp<c:out value="${c.CorporateName}" /></option></select>
   <table border="1" width="144" style="margin-left:2%">
   <option><tr><th>CorporateId&nbsp</th><th>&nbsp AccNumber &nbsp</th><th>&nbsp AccName &nbsp</th><th>&nbsp Currancy &nbsp</th>
   <th>&nbspBranch</th><th>&nbspAvalBalance</th><th>Action</th></tr><option>
   <c:forEach var="c1" items="${result2.rows}"> 
   <option >
   <td><c:out value="${c1.CorporateId}"/></td>
   <td><c:out value="${c1.AccountNumber}"/></td>
   <td><c:out value="${c1.AccountName}"/></td>
   <td><c:out value="${c1.Currency}"/></td>
   <td><c:out value="${c1.Branch}"/></td>
   <td><c:out value="${c1.Avbalance}"/></td>
   <td><a href="../AccountServlet?AccountNumber=${c1.AccountNumber}&action=close" style="text-decoration: none;color:red">Close Account</a></td>
    </tr></option >
   </c:forEach>
</table>
 </c:forEach>
   </div>
</body>
</html>