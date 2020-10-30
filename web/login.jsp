<%--
  Created by IntelliJ IDEA.
  User: 棠心
  Date: 01/07/2020
  Time: 01:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/login.css"/>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body><!-------------------login-------------------------->
<%--    <form action="./login" method="post">--%>
<%--        <h1><a href="index.jsp"><img src="img/logo.png"></a></h1>--%>

<%--        <p><input type="text"  class="form-control" name="account"  placeholder="Account"></p>--%>
<%--        <p><input type="password" class="form-control" name="password"  placeholder="Password"></p>--%>
<%--        <p><input type="submit"  name="submit" value="Log in"></p>--%>

<%--        <p class="txt"><a href="reg.jsp">Registration</a><a href="#">Forget Password？</a></p></form>--%>
<div class="login">
    <form action="./login" method="post" class="bs-example bs-example-form" role="form">
        <h1><a href="index.jsp"><img src="img/logo.png"></a></h1>

        <div class="input-group">
            <span class="input-group-addon">Account</span>
            <input type="text" class="form-control" name="account"  placeholder="Account">
        </div>
        <br>

        <div class="input-group">
            <span class="input-group-addon">Password</span>
            <input type="password" class="form-control" name="password"  placeholder="Password">
        </div>
        <br>

        <div>
            <input type="submit"  name="submit" value="Log in">
        </div>

        <br>
        <p class="txt"><a href="reg.jsp">Registration</a><a href="#">Forget Password？</a></p>
    </form>

</div>

</body>
</html>