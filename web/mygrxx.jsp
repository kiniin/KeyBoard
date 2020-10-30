<%--
  Created by IntelliJ IDEA.
  User: 棠心
  Date: 03/07/2020
  Time: 01:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>Personal information</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/mygrxx.css"/>
</head>
<body><!------------------------------head------------------------------>
<!------------------------------idea------------------------------>
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
                    <li class="on"><a href="mygrxx.jsp">Personal information</a></li>
                    <li><a href="remina.jsp">Change password</a></li>
                </ul>
            </div>
        </div>
        <div class="you fl"><h2>Personal information</h2>
            <div class="gxin">

                <% if (session.getAttribute("account") == null){%>
                <div id="txw"><img src="./img/UserTX.png" width="55" height="55"/></div>
<%--                <div class="tx"><img src="img/tx.png"/></div>--%>
                <div class="xx" style="text-align: left">
                    <h3 class="clearfix"><strong class="fl">Basic information</strong></h3>
                    <div>Name：Tourist</div>
                    <div>Nickname：Null</div>
                    <div>Birthday：Null</div>
                    <div>Gender：Null</div>
                    <div>Phone：Null</div>
                    <div>Email：Null</div>
                </div>

                <%}else {%>
                <div id="tx"><%= session.getAttribute("account").toString().toUpperCase().charAt(0) %></div>
                <div class="xx" style="text-align: left">
                    <h3 class="clearfix"><strong class="fl">Basic information</strong>
                        <a href="#" class="fr" id="edit1">Edit</a></h3>
                    <% if (session.getAttribute("name")!=null){%>
                    <div>Name：<%=session.getAttribute("name")%></div>
                    <div>Nickname：<%=session.getAttribute("nickName")%></div>
                    <div>Birthday：<%=session.getAttribute("DoB")%></div>
                    <div>Gender：<%=session.getAttribute("gender")%></div>
                    <%}else {%>
                    <div>Name：Null</div>
                    <div>Nickname：Null</div>
                    <div>Birthday：Null</div>
                    <div>Gender：Null</div>
                    <%}%>
                    <div>Phone：<%= session.getAttribute("phoneNo")%></div>
                    <div>Email：<%= session.getAttribute("email")%></div>
                </div>

                <%}%>

            </div>
        </div>
    </div>
</div>

<!--遮罩-->
<div class="mask"></div><!--编辑弹框-->
<div class="bj">
    <div class="clearfix"><a href="#" class="fr gb"><img src="img/icon4.png"/></a></div>
    <h3>Edit basic information</h3>

    <form action="./userDetailed" method="get">
        <% if (session.getAttribute("name")==null){%>
        <div><label>Name：</label><input name="name" type="text"/></div>
        <div><label>Nickname：</label><input name="nickName" type="text"/></div>
        <div><label>Birthday: </label><input name="birthday" type="text"/></div>
        <div><label>Gender：</label><span><input name="gender" value="0" type="radio"/>Male</span>
                                    <span><input name="gender" value="1" type="radio"/>Female</span></div>
        <%}else {%>
        <div><label>Name：</label><input name="name" type="text" value="<%=session.getAttribute("name")%>"/></div>
        <div><label>Nickname：</label><input name="nickName" type="text" value="<%=session.getAttribute("nickName")%>"/></div>
        <div><label>Birthday: </label><input name="birthday" type="text" value="<%=session.getAttribute("DoB")%>"/></div>
            <%if (session.getAttribute("gender").equals("Male")){%>
        <div><label>Gender：</label><span><input name="gender" value="0" type="radio" checked="checked"/>Male</span>
            <span><input name="gender" value="1" type="radio"/>Female</span></div>
            <%}else if (session.getAttribute("gender").equals("Female")){%>
        <div><label>Gender：</label><span><input name="gender" value="0" type="radio"/>Male</span>
            <span><input name="gender" value="1" type="radio" checked="checked"/>Female</span></div>
            <%}%>
        <%}%>
        <div class="bc"><input name="save" type="submit" value="Save"/><input type="button" value="Cancel"/></div>
    </form>
</div>

<!--返回顶部-->
<!--返回顶部-->
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
</body>
</html>