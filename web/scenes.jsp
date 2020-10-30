<%@ page import="java.util.ArrayList" %>
<%@ page import="javaservlet.vo.Product" %>
<%@ page import="javaservlet.utils.ProductUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>Product list</title>
<%--    <link rel="stylesheet"--%>
<%--          href="static/bootstrap-4.5.0-dist/css/bootstrap.min.css">--%>
<%--    <script src="static/bootstrap-4.5.0-dist/js/bootstrap.min.js"></script>--%>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/proList.css"/>
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
</div><!------------------------------banner------------------------------>
<div class="banner"><a href="#"><img src="img/bg2.jpg"/></a></div>
<!-------------------current---------------------->
<%
    ArrayList<Product> products = (ArrayList<Product>) session.getAttribute("products");
    String scene = (String) session.getAttribute("scene");
    System.out.println(scene);
    int way=-1;
    if(request.getParameter("sortWay")!=null) way = Integer.parseInt(request.getParameter("sortWay"));
    if(way!=-1){
        products = ProductUtils.SortProducts(way,products);
    }

%>
<div class="current">
    <div class="wrapper clearfix"><h3 class="fl"><%=scene%> Type </h3>
        <div class="fr choice">
            <p class="default">Sort Ways</p>
            <ul class="select">
                <li ><a href="./scenes.jsp?sortWay=1" id="1" style="text-decoration: none "><p  class="text-dark" >Sales from low to high</p></a> </li>
                <li ><a href="./scenes.jsp?sortWay=2" id="2" style="text-decoration: none"><p  class="text-dark" >Sales from high to low</p></a> </li>
                <li ><a href="./scenes.jsp?sortWay=3" id="3" style="text-decoration: none"><p  class="text-dark" >Price from low to high</p></a> </li>
                <li ><a href="./scenes.jsp?sortWay=4" id="4" style="text-decoration: none"><p class="text-dark" >Price from high to low</p></a> </li>
            </ul>
        </div>
    </div>
</div><!----------------proList------------------------->

<ul class="proList wrapper clearfix">
    <% for(Product product:products){%>
    <li><a href="./details?id=<%=product.getId()%>" style="text-decoration: none; ">
        <dl>
            <dt><img src="<%=product.getImgUrl()%>" height="268" width="268"></dt>
            <dd></dd>
            <dd><h5 class="text-dark" ><%=product.getName()%></h5></dd>
            <dd>$<%=product.getPrice()%></dd>
        </dl>
    </a></li>
    <%}%>
</ul><!----------------mask------------------->
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
<script src="js/nav.js" type="text/javascript" charset="utf-8"></script>
<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="js/cart.js" type="text/javascript" charset="utf-8"></script>
<script src="js/common.js" type="text/javascript" charset="utf-8"></script>
<script>

    $(function () {
        $(document).ready(function(){
            <%if(way!=-1){%>
            const c = $("#<%=way%> p").text();
            $(".choice .default").text(c);
            <%}%>
        });
        $(".choice .default").click(function () {
            $("#<%=way%>").parent("li").hide();
        });

        $(".choice .select li p").mouseover(function () {
            $(this).css("color","white");
        });
        $(".choice .select li p").mouseout(function () {
            $(this).css("color","black");
        });

    })
</script>
</body>
</html>