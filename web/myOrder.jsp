<%@ page import="javaservlet.vo.Order" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="javaservlet.vo.Product" %>
<%@ page import="javaservlet.vo.Address" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>MyOrder</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/myorder.css"/>
    <link rel="stylesheet"
          href="static/bootstrap-4.5.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet"  type="text/css" href="css/toastr.css" >
    <script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/toastr.min.js"></script>
    <script src="static/bootstrap-4.5.0-dist/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<body><!------------------------------head------------------------------>
<%
    int state=0;
    if(session.getAttribute("userNo") !=null){
        System.out.println(session.getAttribute("userNo"));
        state=1;
    }
    System.out.println("www");
    if(state==1 && session.getAttribute("order_Products")==null){
        request.getRequestDispatcher("./viewOrder") .forward(request, response);
    }

    LinkedHashMap<Order,ArrayList<Product>> order_products = (LinkedHashMap<Order,ArrayList<Product>>) session.getAttribute("order_Products");
    ArrayList<Address> addresses = (ArrayList<Address>) session.getAttribute("addressOfOrder");

    String status="";int pages=0;
    if(request.getParameter("status")!=null) status = request.getParameter("status");

    int size=0;int which = 0;

    if(state==1){
        if(!status.equals("")){
            System.out.println(status);
            for(Map.Entry<Order, ArrayList<Product>> entry: order_products.entrySet()){
                String status_ = entry.getKey().isState()?"Received":"Shipping";
                if(status_.equals(status)) size++;
            }
            if (size%2==0)  pages=size/2;
            else pages=size/2+1;
        }else {
            if (order_products.size()%2==0)  pages=order_products.size()/2;
            else pages=order_products.size()/2+1;
        }
    }

    if(status.equals("")) which=0;
    else if(status.equals("Shipping")) which=1;
    else if(status.equals("Received")) which=2;
    int loc=0; int ifNull = 0;

%>
<!------------------------------idea------------------------------>
<div class="address mt">
    <div class="wrapper clearfix"><a href="index.jsp" class="fl">Home</a><span>/</span><a
            href="mygxin.jsp">Personal information</a><span>/</span><a href="myOrder.jsp" class="on">My Order</a></div>
</div><!------------------------------Bott------------------------------>
<div class="Bott">
    <div class="wrapper clearfix">
        <div class="zuo fl">
            <h3 style="font-size: 1.17em">
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

            <div style="margin-top: 20px;line-height: 40px;font-size: 12px;font-weight: normal;"><h4>My Trade</h4>
                <ul>
                    <li><a href="./turntoCart">My cart</a></li>
                    <li class="on"><a href="./viewOrder">My order</a></li>
                </ul>
                <h4>Personal Center</h4>
                <ul>
                    <li ><a href="mygxin.jsp">My center</a></li>
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
            <div class="my clearfix"><h2 class="fl">My Order</h2></div>
            <div class="dlist clearfix">
                <ul class="fl clearfix" id="wa">
                    <li><a href="./myOrder.jsp">All valid orders</a></li>
                    <li><a href="./myOrder.jsp?status=Shipping">Shipping</a></li>
                    <li><a href="./myOrder.jsp?status=Received">Received</a></li>
                </ul>
            </div>
            <%
            int cur_page=1, item_num=0;
            if(order_products!=null)
                for(Map.Entry<Order, ArrayList<Product>> entry: order_products.entrySet()){
                    Address address = addresses.get(loc);
                    loc++;
                    String status_ = entry.getKey().isState()?"Received":"Shipping";
                    if(!status.equals("")) if(!status_.equals(status)) continue;
                    SimpleDateFormat ft =
                            new SimpleDateFormat ("yyyy-MM-dd E 'at' hh:mm a", Locale.ENGLISH);

                    item_num++;
                    if(item_num>2){
                        cur_page++;
                        item_num=1;
                    }
//                    System.out.println(ft.format(entry.getKey().getDate()));
            %>
            <div class="dkuang <%=cur_page%>" style="text-align: left"><p class="one"><%=status_%></p>
                <div class="word clearfix">
                    <ul class="fl clearfix">
                        <li><%=ft.format(entry.getKey().getDate())%></li>
                        <li><%=address.getProvince()%> <%=address.getCity()%> <%=address.getDetailedAddress()%></li>
                        <li>Order Number:102200<%=entry.getKey().getOrderNo()%></li>
<%--                        <li></li>--%>
                    </ul>
                    <p class="fr">Total price: <span>$<%=entry.getKey().getTotalPrice()%></span></p></div>
                <%for(Product product:entry.getValue()){%>
                <div class="shohou clearfix"><a href="./details?id=<%=product.getId()%>" class="fl">
                    <img src="<%=product.getImgUrl()%>" height="65px" width="65px"/></a>
                    <p class="fl " ><a href="#">
                        <%=product.getName()%>-<%=product.getColor()%>-<%=product.getNumOfKey()%> keys <%=product.getWeight()%>kg</a>
                            <a>$<%=product.getPrice()%>x<%=product.getBuyNum()%></a>
                    </p>
                    </div>
                <%}%>
            </div>
            <%}else if(state==1){ ifNull=1;%>
                <div class="row">
                    <div class="col-md-9 offset-md-2">
                        <h4>You do not have any orders yet, go and buy something!</h4>
                    </div>
                </div>
            <%}else if(state==0){%>
            <div class="row">
                <div class="col-md-6 offset-md-4">
                    <h4>You have not signed in yet!</h4>
                </div>
            </div>
            <%}%>


            <div class="fenye clearfix" id="">


                <% for(int i=1;i<=pages;i++){ %>

                        <a class="page" href="#"><%=i%></a>
                <%}%>

        </div>
    </div>
</div>


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

<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/user.js" type="text/javascript" charset="utf-8"></script>
<script>
    $(function () {
        // if($("p.one").text()==="Wait for receiving"){
        //     $(this).addClass("text-danger");
        // }
        $(".dkuang").find("p.one").each(function () {
            if ($(this).text() === "Shipping") {
                $(this).addClass("text-danger");
            }
        });
        var ifNull = <%=ifNull%>;
        if(ifNull===1){
            $("#searchForm").css("visibility","hidden");

        }
        var which = <%=which%>;
        $(document).ready(function(){
            var state = <%=state%>;
            if(state===0) $('.fenye').remove();

            $(".page").eq(0).css('background-color','#B22222');
            $("#wa li").eq(which).addClass("on");

            $(".dkuang").each(function () {
                var div = $(this).attr("class").split(" ")[1];
                if(div!=="1") $(this).hide();
            })
            var pages = <%=pages%>;
            $(".fenye").css("margin","45px "+(330-20*pages)+"px auto");
        })
        $(".page").click(function () {
            var page = $(this).text();
            $(".dkuang").show();
            // $(this).addClass("on_back").siblings().removeClass("on_back");
            $('.page').css('background-color','#757575');
            $(this).css('background-color','#B22222');
            $(".dkuang").each(function () {
                var div = $(this).attr("class").split(" ")[1];

                if(div!==page) $(this).hide();
            })

        })
    })
</script>
</body>
</html>