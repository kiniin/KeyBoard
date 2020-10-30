<%@ page import="javaservlet.vo.Product" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 棠心
  Date: 30/06/2020
  Time: 22:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(session.getAttribute("flag")==null)
        request.getRequestDispatcher("./index") .forward(request, response);

    ArrayList<ArrayList<Product>> list1 =null;
    ArrayList<ArrayList<Product>> list2 =null;
    int flag1=0;
    if(Integer.parseInt((String)session.getAttribute("flag"))==1){
        flag1=1;

        list1 = (ArrayList<ArrayList<Product>>) session.getAttribute("productsList1");
        list2 = (ArrayList<ArrayList<Product>>) session.getAttribute("productsList2");
    }
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>KeyBoard</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
<%--    <link rel="stylesheet"--%>
<%--          href="static/bootstrap-4.5.0-dist/css/bootstrap.min.css">--%>

<%--    <script src="static/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>--%>
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
</div><!-------------------------banner--------------------------->


<div class="block_home_slider">
    <div id="home_slider" class="flexslider">
        <ul class="slides">
            <li>
                <div class="slide"><img src="img/bg1.jpg"/></div>
            </li>
            <li>
                <div class="slide"><img src="img/bg2.jpg"/></div>
            </li>
        </ul>
    </div>
</div><!------------------------------thImg------------------------------>

<div class="thImg">
    <div class="clearfix">
        <a href="#"><img src="img/pic1.jpg"/></a>
        <a href="#"><img src="img/pic2.jpg"/></a>
        <a href="#"><img src="img/pic3.jpg"/></a>
    </div>
</div><!------------------------------news------------------------------>

<div class="news">
    <div class="wrapper"><h2><img src="img/ih1.png"/></h2>
        <div class="top clearfix"><a href="#"><img src="img/1.jpg"/>
            <p></p></a><a href="#"><img src="img/2.jpg"/>
            <p></p></a><a href="#"><img src="img/3.jpg"/>
            <p></p></a></div>
        <div class="bott clearfix"><a href="#"><img src="img/4.jpg"/>
            <p></p></a><a href="#"><img src="img/5.jpg"/>
            <p></p></a><a href="#"><img src="img/6.jpg"/>
            <p></p></a></div>
        <h2><img src="img/ih2.png"/></h2>

        <%
            int flag=0; String sign="";
        %>
        <%
            if(flag1==1)
                for(ArrayList<Product> products: list1){%>
        <div class="flower clearfix tran">
            <%for(Product product:products) {

                if(flag==0) sign ="clearfix";
                flag++;

            %>

            <a href="./details?id=<%=product.getId()%>"  class="<%=sign%> hr">
                <dl>
                    <dt><span class="abl"></span><img src="<%=product.getImgUrl()%>" alt="<%=product.getImgUrl()%>" height="400" width="300"/><span class="abr"></span></dt>
                    <dd><h4 class="text-muted"><%=product.getName()%></h4></dd>
                    <dd><span>$<%=product.getPrice()%></span></dd>
                </dl>
            </a>
            <% } flag=0;%>
        </div>
        <% }%>
    </div>
</div><!------------------------------ad------------------------------>

<a href="#" class="ad"><img src="img/ib.jpg" width="100%" height="100%"/></a><!------------------------------people------------------------------>

<div class="people">
    <div class="wrapper"><h2><img src="img/ih3.png"/></h2>

        <%
            if(flag1==1)
                for(ArrayList<Product> products: list2 ){%>
        <div class="pList clearfix tran">

            <%for (Product product: products ){%>
            <a href="./details?id=<%=product.getId()%>">
                <dl>
                    <dt><span class="abl"></span><img src="<%=product.getImgUrl()%>" alt="<%=product.getImgUrl()%>" height="240" width="240"/><span class="abr"></span></dt>
                    <dd><h5 class="text-muted"><%=product.getName()%></h5></dd>
                    <dd><span>$<%=product.getPrice()%></span></dd>
                </dl>
            </a>
            <% }%>
        </div>
        <% }%>
    </div>
</div><!--返回顶部-->

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
<script src="js/nav.js" type="text/javascript" charset="utf-8"></script>

<script src="js/jquery.flexslider-min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">$(function () {
    $('#home_slider').flexslider({
        animation: 'slide',
        controlNav: true,
        directionNav: true,
        animationLoop: true,
        slideshow: true,
        slideshowSpeed: 3000,
        animationSpeed: 1200,
        useCSS: false
    });
});</script>
</body>
</html>