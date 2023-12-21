<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bank Login Page</title>
    <link href="./CSS FILEs/Login.css" rel="stylesheet" type="text/css">  
    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"  type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
 <sql:setDataSource var="dbsource" driver="com.mysql.cj.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/Main_Project"
                           user="root"  password="23Sachinkt@09"/>
                           
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from UserSetup where UserID=?;
            <sql:param value="${param.userid}" />
        </sql:query>
        
  <div class="form-group">
            <!-- Form start -->
            <c:forEach items="${result.rows}"  var="c" >
            <form action="ChangePassValidation.jsp" class="form-container">
                <h1> Change Password </h1><br>
					<label>current Password : </label>
                  <input type="password" class="form-control" id="passwordone" name="curpassword">
                  <label>new Password : </label>
                  <input type="password" class="form-control" id="passwordtwo" name="newpassword">
                  <label>confirm Password :</label>
                  <input type="password" class="form-control" name="confirmPassword" id="Passwordthree" ><br><br>
                    <input type="hidden" value="<c:out value="${c.UserID}"/>" name="UserId" id="Passwordthree" >
                	<input type="reset" value="reset" class="reset">
                  <input type="submit" value="submit" class="submit">
            
              </form>
</c:forEach> 
    </div>
</body>

</html>