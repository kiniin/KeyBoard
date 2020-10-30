<%--
  Created by IntelliJ IDEA.
  User: 棠心
  Date: 02/07/2020
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>Personal information</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/mygxin.css"/>
</head>

<body><!------------------------------head------------------------------>
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
</div><!------------------------------idea------------------------------>
<div class="address mt" id="add">
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

                        <span class="fl" >[<%= session.getAttribute("account") %>]</span>
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
                    <li class="on"><a href="mygxin.jsp">My center</a></li>
                    <li><a href="address.jsp">Address management</a></li>
                </ul>
                <h4>Account Management</h4>
                <ul>
                    <li><a href="mygrxx.jsp">Personal information</a></li>
                    <li><a href="remina.jsp">Change password</a></li>
                </ul>
            </div>
        </div>

        <div class="you fl">
            <div class="tx clearfix">

                <div class="fl clearfix" style="display: flex">

                    <% if(session.getAttribute("account") != null){%>
                        <div id="tx" ><%= session.getAttribute("account").toString().toUpperCase().charAt(0) %></div>

                        <p class="fl"><span style="text-align: left"><%= session.getAttribute("account") %></span>
                            <a href="mygrxx.jsp">Edit personal information></a></p>
                </div>
                        <div class="fr">Bind mailbox:<%= session.getAttribute("email")%></div>
            </div>


            <div class="bott">
                <div class="clearfix" ><a href="myOrder.jsp?status=Shipping" class="fl"><img src="img/gxin2.jpg"/></a>
                    <p class="fl"><span><a href="myOrder.jsp?status=Shipping">View pending orders></a></span></p></div>
                <%--                    <a href="myorderq.html">View pending orders></a></p></div>--%>
                <div class="clearfix" ><a href="myOrder.jsp" class="fl"><img src="img/gxin4.jpg"/></a>
                    <p class="fl"><span><a href="myOrder.jsp">View all orders></a></span></p></div>
                <%--                    <a href="#">View all orders></a></p></div>--%>
            </div>
        </div>
    </div>
</div>
                    <%}else {%>
<%--                        <a href="#" class="fl"><img src="img/tx.png"/></a>--%>
                        <p class="fl"><span>Please Login</span><a href="#">Edit personal information></a></p></div>
            </div>
            <div class="bott">
                <div class="clearfix"><a href="myOrder.jsp?status=Shipping" class="fl"><img src="img/gxin2.jpg"/></a>
                                        <p class="fl"><span><a href="myOrder.jsp?status=Shipping">View pending orders></a></span></p></div>
<%--                    <a href="myorderq.html">View pending orders></a></p></div>--%>
                <div class="clearfix"><a href="myOrder.jsp" class="fl"><img src="img/gxin4.jpg"/></a>
                    <p class="fl"><span><a href="myOrder.jsp">View all orders></a></span></p></div>
<%--                    <a href="#">View all orders></a></p></div>--%>
            </div>
        </div>
    </div>
</div>
                    <%}%>


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
    <p>888-888-8888</p></div>


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
</body>
</html>