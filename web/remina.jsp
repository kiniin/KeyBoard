<%--
  Created by IntelliJ IDEA.
  User: 棠心
  Date: 03/07/2020
  Time: 13:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>Change Password</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/mygrxx.css"/>
</head>
<body><!------------------------------head------------------------------>
<div class="address mt">
    <div class="wrapper clearfix"><a href="index.jsp" class="fl">Home</a><span>/</span><a href="mygxin.jsp" class="on">Personal information</a>
    </div>
</div><!------------------------------Bott------------------------------>
<div class="Bott">
    <div class="wrapper clearfix">
        <div class="zuo fl">
            <h3>
                <div style="border: grey solid 1px;border-radius: 50%;width: 90px;height: 90px;margin-left: 45px;display: flex;
  justify-content: center;align-items: center;background-color: #fff9df">
                    <img src="./img/UserTX.png" width="55" height="55"/></div>

                <p class="clearfix">
                    <% if(session.getAttribute("account") != null){%>

                    <span class="fl">[<%= session.getAttribute("account") %>]</span>
                    <span class="fr"><a href="exit.jsp">[Sign out]</a></span>
                </p>
            </h3>
            <%}else {%>

            <a href="login.jsp">Please Login</a>
            <%}%>

            <div><h4>My Trade</h4>
                <ul>
                    <li><a href="./turntoCart">My cart</a></li>
                    <li><a href="./viewOrder">My order</a></li>
                </ul>
                <h4>Personal Center</h4>
                <ul>
                    <li ><a href="mygxin.jsp">My center</a></li>
                    <li><a href="address.jsp">Address management</a></li>
                </ul>
                <h4>Account Management</h4>
                <ul>
                    <li><a href="mygrxx.jsp">Personal information</a></li>
                    <li class="on"><a href="remina.jsp">Change password</a></li>
                </ul>
            </div>
        </div>

        <div class="you fl"><h2>Change Password</h2>

            <div style="margin-left: 140px">
                <form action="./changePassword" method="get" class="remima" style="text-align: left"><p><span>Auth Ways:&nbsp;
            </span><input name="method" type="radio" value="0" checked="checked"/>Password validation
                    <input name="method"  type="radio" value="1"/>Problem verification</p>

                    <div id="test">
                        <div><p><span>Old password:&nbsp;</span><input name="oldPassword" type="password"/></p>
                            <p class="op">Input old password:</p> </div>

                        <div><p><span>Question:&nbsp;</span><%= session.getAttribute("question")%></p>
                            <p><span>Answer:&nbsp;</span><input name="answer" type="text"></p>
                            <p class="op">Input your answer:</p></div>
                    </div>

                    <p><span>New password:&nbsp;</span><input name="newPassword" type="password"/></p>
                    <p class="op">Input new password</p>
                    <p><span>Repeat:&nbsp;</span><input name="newPassword2" type="password"/></p>
                    <p class="op">Input new password again</p>
                    <input type="submit" name="submit" value="Submit"/></form>
            </div>
        </div>
    </div>
</div>


<div class="gotop"><a href="./turntoCart">
    <dl>
        <dt><img src="img/gt1.png" width="20" height="20"/></dt>
        <dd>Go to<br/>Cart</dd>
    </dl>

</a><a href="AboutUs.jsp" class="dh">
    <dl>
        <dt><img src="img/gt2.png" width="20" height="20"/></dt>
        <dd>About<br/>Us</dd>
    </dl>

</a><a href="mygxin.jsp">
    <dl>
        <dt><img src="img/gt3.png" width="20" height="20"/></dt>
        <dd>User<br/>Info</dd>
    </dl>
</a><a href="#" class="toptop" style="display: none">
    <dl>
        <dt><img src="img/gt4.png"/></dt>
        <dd>Go<br/>Top</dd>
    </dl>
</a>
    <p>888-888-8888</p></div><!-------------------login--------------------------><!--footer-->

<div class="footer">
    <div class="top">
        <div class="wrapper">
            <div class="clearfix"><img src="img/foot1.png" width="50" height="50"/><br>
                <span class="footwords">7 days no reason to return</span>
            </div>
            <div class="clearfix"><img src="img/foot2.png" width="50" height="50"/><br>
                <span class="footwords">15 days free exchange</span>
            </div>
            <div class="clearfix"><img src="img/foot3.png" width="50" height="50"/><br>
                <span class="footwords">Free shipping over 599</span>
            </div>
            <div class="clearfix"><img src="img/foot4.png" width="50" height="50"/><br>
                <span class="footwords">Mobile phone special service</span>
            </div>
        </div>

    </div>
    <p class="dibu">This website is just a learning case.<br/>
        Author: Tenghao Su, Hangjiang Qi, Weizheng Zhang
    </p>
</div>
<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/user.js" type="text/javascript" charset="utf-8"></script>
<script>
    $("#test div:last").hide();
    $(":radio").click(function() {
        var num = $(this).val();
        $("#test div").hide();
        $("#test div").eq(num).show();
    });
</script>
</body>
</html>