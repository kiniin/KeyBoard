<%--
  Created by IntelliJ IDEA.
  User: 棠心
  Date: 30/06/2020
  Time: 21:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>ok</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/proList.css"/>
</head>
<body><!----------------------------------------order------------------>
<div class="head ding">
    <div class="wrapper clearfix">
        <div class="clearfix" id="top">
            <h1 class="fl"><a href="index.jsp"><img src="img/logo.png"/></a></h1>

            <div class="fr clearfix" id="top1">

                <% if (session.getAttribute("account") == null) {%>
                <p class="fl"><a href="login.jsp" id="login">Login</a><a href="reg.jsp" id="reg">Registration</a></p>
                <% }else { %>
                <p class="fl">Welcome! <%=session.getAttribute("account")%>
                    <a href="exit.jsp" id="sign_out">Sign out</a></p>
                <% } %>

                <form action="./search" method="post" class="fl">
                    <input type="text" name="query" placeholder="Search any product"/>
                    <input type="submit" value=""/>
                </form>

                <div class="btn fl clearfix">
                    <a href="mygxin.jsp"><img src="img/user.png" height="20" width="20"/></a>
                    <a href="#" class="er1"><img src="img/ewm.png" height="20" width="20"/></a>
                    <a href="./turntoCart"><img src="img/gwc.png" height="20" width="20"/></a>
                    <p><a href="#"><img src="img/smewm.png"/></a></p></div>
            </div>
        </div>

        <ul class="clearfix" id="bott">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="#">All Goods</a>
                <div class="sList">
                    <div class="wrapper  clearfix"><a href="./scenes?type=Studying" style="text-decoration: none;">
                        <dl>
                            <dt><img src="img/studying.jpg" width="202.5" height="250"/></dt>
                            <dd>Studying</dd>
                        </dl>
                    </a><a href="./scenes?type=Professional" style="text-decoration: none;">
                        <dl>
                            <dt><img src="img/professional.jpg" width="202.5" height="250"/></dt>
                            <dd>Professional</dd>
                        </dl>
                    </a><a href="./scenes?type=Portable" style="text-decoration: none;">
                        <dl>
                            <dt><img src="img/portable.jpg" width="202.5" height="250"/></dt>
                            <dd>Portable</dd>
                        </dl>
                    </a><a href="./scenes?type=Teaching" style="text-decoration: none;">
                        <dl>
                            <dt><img src="img/teaching.png" width="202.5" height="250"/></dt>
                            <dd>Teaching</dd>
                        </dl>
                    </a></div>
                </div>
            </li>
            <li><a href="mygxin.jsp">Personal Information</a></li>
            <li><a href="AboutUs.jsp">About Us</a></li>
        </ul>
    </div>
</div>
<div class="order mt cart">
    <div class="site"><p class="wrapper clearfix"><span class="fl">Payment successful</span><img class="top"
                                                                                   src="img/temp/cartTop03.png"></p>
    </div>
    <p class="ok">Payment successful! Remaining <span>5</span> seconds<a href="./viewOrder">Return to order page</a></p></div>
<!--footer-->
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
<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">jQuery(".bottom").slide({
    titCell: ".hd ul",
    mainCell: ".bd .likeList",
    autoPage: true,
    autoPlay: false,
    effect: "leftLoop",
    autoPlay: true,
    vis: 1
});</script>
</body>
</html>