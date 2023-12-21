<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String currentPassword=request.getParameter("curpasword");
String Newpass=request.getParameter("newpasword");
String conpass=request.getParameter("confirmPassword");
String connurl = "jdbc:mysql://localhost:3306/Main_Project";
Connection con=null;
String pass="23Sachinkt@09";
String id="";
try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connurl, "root", pass);
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from UserSetup where UserPassword='"+currentPassword+"'");
while(rs.next()){
id=id+rs.getInt(2);
pass=rs.getString(3);
} System.out.println(id+ " "+pass);
if(pass.equals(currentPassword)){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update UserSetup set UserPassword='"+Newpass+"' where UserID='"+id+"'");
out.println("Password changed successfully");
st1.close();
con.close();
}
else{
out.println("Invalid Current Password");
}
}
catch(Exception e){
out.println(e);
}
%>