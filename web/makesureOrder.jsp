<%@ page import="java.util.ArrayList" %>
<%@ page import="javaservlet.vo.Address" %>
<%@ page import="javaservlet.vo.Cart" %><%--
  Created by IntelliJ IDEA.
  User: 棠心
  Date: 05/07/2020
  Time: 06:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>order</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/proList.css"/>
    <link rel="stylesheet" type="text/css" href="css/mygxin.css"/>
    <link rel="stylesheet"
          href="static/bootstrap-4.5.0-dist/css/bootstrap.min.css">

</head>
<body><!----------------------------------------order------------------>
<div class="head ding" style="height: 81px">
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


<div class="order cart mt"><!-----------------site------------------->
    <div class="site"><p class="wrapper clearfix"><span class="fl">Order Confirmation</span><img class="top"
                                                                                   src="img/temp/cartTop02.png"></p>
    </div><!-----------------orderCon------------------->
    <form id="orderForm" method="post" action="./generateOrder">
    <div class="orderCon wrapper clearfix">
        <div class="orderL fl"><!--------h3----------------><h3>Receiving information</h3>
            <!--------addres---------------->
            <div class="addres clearfix">
                <% ArrayList<Address> addresses = (ArrayList<Address>) session.getAttribute("orderAddress");
                for (int i = 0; i<addresses.size();i++){%>
                <div class="addre fl">
                    <input hidden class="selected" value="<%=i%>">
                    <div class="tit clearfix"><p class="fl"><%= addresses.get(i).getReceiver()%></p></div>
                    <div class="addCon"><p><%=addresses.get(i).getDetailedAddress()%></p>
                        <p><%= addresses.get(i).getPhoneNum()%></p></div>
                </div>
                <%}%>
            </div>
        </div>

        <div class="orderR fr">
            <div class="msg"><h3>Order content<a href="cart.jsp" class="fr">Return to shopping cart</a></h3><!--------ul---------------->

                <% Double Price = 0.0;
                    ArrayList<Cart> carts = (ArrayList<Cart>) session.getAttribute("order");
                for (int j= 0; j<carts.size();j++){%>
                <ul class="clearfix">
                    <li class="fl"><img src="<%= carts.get(j).getImgURL()%>"height="87" width="87"></li>
                    <li class="fl"><p><%=carts.get(j).getName()%></p>
                        <p>Color：<%=carts.get(j).getColor()%></p>
                        <p>Quantity：<%=carts.get(j).getNumber()%></p></li>
                    <li class="fr">$<%=(carts.get(j).getNumber()*carts.get(j).getPrice())%></li>
                </ul>
                <%Price += carts.get(j).getNumber()*carts.get(j).getPrice();%>
                <%}%>

            </div><!--------tips---------------->
            <div class="tips"><p><span class="fl">Goods Price：</span><span class="fr">$<%=Price%></span></p>
                <p><span class="fl">Discounted price:</span><span class="fr">$0.00</span></p>
                <p><span class="fl">Freight:</span><span class="fr">free shipping</span></p></div><!--------tips count---------------->
            <div class="count tips"><p><span class="fl">Total Price：</span><span class="fr">$<%=Price%></span></p></div>
            <!--<input type="button" name="" value="去支付">-->
            <a id="makeOrder" href="#payModal" data-toggle="modal" class="pay">To pay</a></div>

        <div class="modal fade" id="payModal">
            <div class="modal-dialog">
                <div class="modal-content">

                    <!-- 模态框头部 -->
                    <div class="modal-header">
                        <h4 class="modal-title">Payment</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- 模态框主体 -->
                        <div class="modal-body">
                            <br><br><br>
                            <img src="img/pay.png" style="height: 250px; width: 250px" >
                            <br><br><br><br><br>
                        </div>

                        <!-- 模态框底部 -->
                        <div class="modal-footer">
                            <div class="btn-group" role="group" style="padding-right: 50px;">
                                <button type="button" class="btn btn-danger btn-lg"  onclick="passPrice()"
                                        id="addAddress" >I've paid the order</button>
                            </div>
                            <div class="btn-group" role="group"  style="margin-right: 50px;">
                                <button type="button" class="btn btn-secondary btn-lg"
                                        data-dismiss="modal">Let me rethink about it</button>
                            </div>

                            <!--                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>-->
                        </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</div>


<script>
    function passPrice() {
        var price = <%=Price%>;
        location.href='./generateOrder?price='+price;
    }
    // $(function () {
    //     $("#makeOrder").click(function () {
    //         var MyForm =  $('#orderForm');
    //         $(".on").children(".selected")
    //     })
    // })
</script>


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
<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="js/user.js" type="text/javascript" charset="utf-8"></script>
<script src="static/bootstrap-4.5.0-dist/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>