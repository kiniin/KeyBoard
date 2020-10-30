<%@ page import="javaservlet.vo.Cart" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javaservlet.dao.impl.CartDAOimpl" %><%--
  Created by IntelliJ IDEA.
  User: 棠心
  Date: 30/06/2020
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>cart</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/proList.css"/>
    <link rel="stylesheet"
          href="static/bootstrap-4.5.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet"  type="text/css" href="css/toastr.css" >
    <script src="js/toastr.min.js"></script>

</head>
<body><!--------------------------------------cart--------------------->
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


<div class="cart mt"><!-----------------logo------------------->
    <!--<div class="logo"><h1 class="wrapper clearfix"><a href="index.html"><img class="fl" src="img/temp/logo.png"></a><img class="top" src="img/temp/cartTop01.png"></h1></div>-->
    <!-----------------site------------------->
    <div class="site"><p class=" wrapper clearfix">
            <span class="fl">Cart</span><img class="top" src="img/temp/cartTop01.png">
            <a href="index.jsp" class="fr">Continue Shopping&gt;</a></p></div><!-----------------table------------------->
            <div class="table wrapper">
                <div class="tr">
            <div style="text-align: center">Goods</div>
            <div style="text-align: center">Unit price</div>
            <div style="text-align: center">Quantity</div>
            <div style="text-align: center">Total</div>
            <div style="text-align: center">Operation</div>
        </div>



<form name="myForm" action="./makesureOrder" method="get" id="myForm">
                <%
                CartDAOimpl cart = new CartDAOimpl();
                ArrayList<Cart> carts = null;
                int userNo = Integer.parseInt(session.getAttribute("userNo").toString());
                try {
                   carts = cart.queryCartByUserNo(userNo);
                   carts = cart.queryProduct(carts);
                } catch (Exception e) {
                    e.printStackTrace();
                }
//                if(session.getAttribute("flag_cart")==null)
//                if(carts==null)
//                    request.getRequestDispatcher("./getCart") .forward(request, response);

//                carts = (ArrayList<Cart>) session.getAttribute("cartProduct");
                if (carts.size() == 0){%>
    <div><h1>Empty~<a href="index.jsp">Go Shopping</a></h1></div>
                <%}else {for (int i = 0;i<carts.size();i++){%>
                    <div class="th cart"  id="<%=carts.get(i).getProductNo()%>">
                        <div class="pro clearfix" style="text-align: center"><label class="fl">
                            <input class="singlePro" name="cartProduct" type="checkbox" value="<%=carts.get(i).getProductNo()%>"/><span></span></label>
                            <a class="fl" href="#">
                                <dl class="clearfix">
                                    <dt class="fl"><img src="<%=carts.get(i).getImgURL()%>" height="120" width="120"></dt>
                                    <dd class="fl"><p><%=carts.get(i).getName()%></p>
                                        <p>Color:
                                        <%=carts.get(i).getColor()%></p>
                                        <p>Num of Key:
                                        <%=carts.get(i).getNumofKey()%></p>
                                    </dd>
                                </dl></a></div>

                        <div class="price" style="text-align: center">$<%=carts.get(i).getPrice()%></div>
                        <div class="number" style="text-align: center"><p class="num clearfix"><img class="fl sub" src="img/temp/sub.jpg">
                            <span class="fl"><input hidden name="productNum" value="<%=carts.get(i).getNumber()%>"><%=carts.get(i).getNumber()%></span><img class="fl add" src="img/temp/add.jpg"></p></div>
                        <div class="price sAll " style="text-align: center">$<%=(carts.get(i).getPrice()*carts.get(i).getNumber())%></div>
                        <div class="price" style="text-align: center"><button class="btn btn-danger btn-sm delete">Delete</button></div>
                    </div>


            <%}}%>

        <div class="tr clearfix"><label class="fl"><input class="checkAll" type="checkbox"/><span></span></label>
            <p class="fl"><a href="#" >Select All</a></p>
            <p class="fr"><span>Totally <small class="text-danger" id="sl" style="font-size: large">0</small> Goods</span><span>Total Cost:&nbsp;$<small style="font-size: large" class="text-danger" id="all">0.00</small></span>
                <span><a id="makeOrder" href="#" style="background-color: firebrick">pay</a></span></p></div>
    </div>
</div>
<%--<a hidden id="myButton" class="btn" data-toggle="modal" data-target="#cart_modal"></a>--%>
<div class="modal fade" id="cart_modal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
<%--            <div class="modal-header">--%>
<%--                <h4 class="modal-title" id="myModalLabel">Warning</h4>--%>
<%--                --%>
<%--            </div>--%>
            <div class="modal-body">
                <span><button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button></span>
                <br>
                <h5>You must choose at least one item!</h5>
            </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">OK</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
<%--            <button type="button" class="btn btn-secondary" data-dismiss="modal">close</button>--%>
        </div>
    </div>
</div>
</form>


<div class="mask"></div>
<div class="tipDel"><p>Are you sure you want to delete this product?</p>
    <p class="clearfix"><a class="fl cer" href="#">Yes</a><a class="fr cancel" href="#">Cancel</a></p></div>





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
</div><!----------------mask------------------->


<div class="mask"></div><!----------------- --mask内容------------------->
<div class="pleaseC"><p>Please choose goods</p><img class="off" src="img/temp/off.jpg"/></div>

<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="js/cart.js" type="text/javascript" charset="utf-8"></script>
<script src="static/bootstrap-4.5.0-dist/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script >
    function makeOrder() {

    }
    function num_price(){
        var totalPrice=0;
        var totalNum=0;
        $(".singlePro:checkbox").each(function () {
            if ($(this).is(':checked')){
                totalNum+=parseInt($(this).parent().parent().siblings(".number").find("span").text());
                totalPrice+=parseFloat($(this).parent().parent().siblings(".sAll").text().substring(1));
            }
        })
        $("#all").text(totalPrice);
        $("#sl").text(totalNum);
    }
    $(function () {

            $(".checkAll").on("click",function () {
                if($(this).is(":checked")){
                    $(".singlePro:checkbox").each(function () {
                        if(!$(this).is(":checked"))
                            $(this).trigger("click");
                    })
                }else {
                    $(".singlePro:checkbox").each(function () {
                        if($(this).is(":checked"))
                            $(this).trigger("click");
                    })
                }

            })

        $(document).ready(function () {
            num_price();
        })

        $("input:checkbox").on("click", function (){
            num_price();
        });
        $('#cart_modal').on('shown.bs.modal', function (e) {
            // 关键代码，如没将modal设置为 block，则$modala_dialog.height() 为零
            $(this).css('display', 'block');
            var modalHeight=$(window).height() / 3 - $('#youModel .modal-dialog').height() / 3;
            $(this).find('.modal-dialog').css({
                'margin-top': modalHeight
            });
        });

        $(".delete").click(function () {
            var del = $(this).parent().parent();
            del.remove();
            var proID = del.attr("id");
            var xmlhttp = new XMLHttpRequest();
            var url = "./changeCart?proID="+proID;
            xmlhttp.open("Get",url,true);
            xmlhttp.send();
            num_price();
        })
        $("#makeOrder").click(function () {
            var proList = [];
            var proNum = [];
            $("input:checkbox").each(function () {
                if ($(this).is(':checked')) {

                    proList.push($(this).val());
                    var number = $(this).parent().siblings(".number").find("input").val();
                    proNum.push(number);
                }
            })
            if(proList.length===0){
               // alert("what");
               //  jQuery.noConflict();
                $("#cart_modal").modal("toggle")
                // $("#myButton").trigger("click");
            }else {

                $("#myForm").submit();
                // $.post(
                //     "/getToOrder", {"proList":proList, "preNum":proNum}
                // )
            }
        })

    })
</script>
</body>
</html>