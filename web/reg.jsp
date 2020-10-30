<%--
  Created by IntelliJ IDEA.
  User: 棠心
  Date: 30/06/2020
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/login.css"/>

    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body><!-------------------reg-------------------------->

<div class="reg">
    <form action="./reg" method="post" class="bs-example bs-example-form" role="form">
        <h1><a href="index.jsp"><img src="img/logo.png"></a></h1>

        <div class="input-group input-group-sm">
            <span class="input-group-addon">Account</span>
            <input type="text" class="form-control" name="account"  placeholder="Please input account">
        </div>
        <br>

        <div class="input-group input-group-sm">
            <span class="input-group-addon">Password</span>
            <input type="password" class="form-control" name="password"  placeholder="Please input password">
        </div>
        <br>

        <div class="input-group input-group-sm">
            <span class="input-group-addon">Password</span>
            <input type="password" class="form-control" name="password2"  placeholder="Please ensure password">
        </div>
        <br>

        <div class="input-group input-group-sm">
            <span class="input-group-addon">Email</span>
            <input type="text" class="form-control" name="email"  placeholder="Please input email">
        </div>
        <br>

        <div class="input-group input-group-sm">
            <span class="input-group-addon">PhoneNo</span>
            <input type="text" class="form-control" name="phoneNo"  placeholder="Please input phone number">
        </div>
        <br>

        <div class="input-group input-group-sm">
            <span class="input-group-addon">Question</span>
            <input type="text" class="form-control" name="question"  placeholder="Please input a question">
        </div>
        <br>

        <div class="input-group input-group-sm">
            <span class="input-group-addon">Answer</span>
            <input type="text" class="form-control" name="answer"  placeholder="Please input an answer">
        </div>
        <br>

        <div>
            <input type="submit" name="registration" value="Registration">
        </div>
        <br>

        <p class="txt"><a href="login.jsp">Have an account to login</a></p>

    </form>
</div>

</body>
</html>