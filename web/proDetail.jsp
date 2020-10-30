<%@ page import="javaservlet.vo.Product" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Details page</title>
<%--    <link rel="stylesheet"--%>
<%--          href="static/bootstrap-4.5.0-dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/proList.css"/>
</head>
<body><!------------------------------head------------------------------>
<%
//    int id = Integer.parseInt(request.getParameter("id"));
    int id = Integer.parseInt(session.getAttribute("id").toString());
    ArrayList<Product> products =(ArrayList<Product>) session.getAttribute("products");
    ArrayList<String> urls = (ArrayList<String>) session.getAttribute("urls");



    Product firstProduct;
    int loc=0;
    for(Product product: products){
        if(product.getId()==id) break;
        loc++;
    }
    ArrayList<Product> colorProducts = new ArrayList<Product>();
    ArrayList<Product> keysProducts = new ArrayList<Product>();

    int flag=0;
    colorProducts.add(products.get(0));
    for(Product product:products){
        for(Product color: colorProducts)
            if (product.getColor().equals(color.getColor())) {
                flag = 1;
                break;
            }
        if(flag==0) colorProducts.add(product);
        flag=0;
    }
    firstProduct = products.get(loc);
//    products.remove(loc);

%>
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
<!-----------------------Detail------------------------------>
<div class="detCon">
    <div class="proDet wrapper">
        <div class="proCon clearfix">
            <div class="proImg fl">
                <img class="det" src="<%=firstProduct.getImgUrl()%>"/>
                <div class="smallImg clearfix">

                    <%for(String url:urls){%>
                    <img src="<%=url%>" data-src="<%=url%>">
                    <%}%>
                </div>
            </div>
            <div class="fr intro">
<% //开始              %>
                <div class="title"><h4><%=firstProduct.getName()%>></h4>
                    <p>【Returns without reason】【Free shipping】</p><span>$<%=firstProduct.getPrice()%>></span></div>
                <div class="proIntro"><h5 class="text-muted">Color type</h5>
                    <div class="smallImg clearfix categ">
<%--                        <p class="fl on"><img src="img/temp/prosmall0<%=loc%>.jpg" alt=<%= firstProduct.getName()%>--%>
<%--                                            data-src="img/temp/prosmall0<%=loc%>.jpg"></p>--%>
                        <%
                            for(Product product:products)
                                if (product.getColor().equals(firstProduct.getColor()))
                                    keysProducts.add(product);

                            loc=0;
                            for(Product product: colorProducts){
                                if(product.getColor().equals(firstProduct.getColor()))
                                    break;;
                                loc++;
                            }

                            for(Product product:colorProducts){
                            flag++;
                            String hover = "";
                            String able = "";%>
                            <% if(flag==loc+1){
                                hover = "on";
                                able = "disable";
                            }%>
                            <p class="fl <%=hover%>">
                                <a href="./details?id=<%=product.getId()%>" class="<%=able%>">
<%--                                <a href="./proDetail.jsp?id=<%=product.getId()%>" class="<%=able%>">--%>
                                    <img src="<%=product.getImgUrl()%>" alt=<%=product.getColor() %>
                                         data-src="<%=product.getImgUrl()%>" >
                                </a>
                            </p>
                        <%} %>
                    </div>
                   <h5 class="text-muted">Number of Organ's keys</h5>
                    <% flag=0; loc=0;%>
                    <div class="smallImg clearfix categ">
                        <%
                            for(Product product: keysProducts){
                                if(product.getId()==id) break;
                                loc++;
                            }
                        %>
                        <% for(Product product:keysProducts){
                            flag++;
                            String hover = "";
                            String able = "";%>
                        <% if(flag==loc+1){
                            hover = "on";
                            able = "disable";
                        }%>
                        <p class="fl <%=hover%>">
<%--                            <a href="./proDetail.jsp?id=<%=product.getId()%>" class="<%=able%>">--%>
                        <a href="./details?id=<%=product.getId()%>" class="<%=able%>">
                                <button style="width:50px; height: 30px"><%=product.getNumOfKey()%></button>
                            </a>
                        </p>
                        <%} %>
                    </div>

                    <% String text=firstProduct.getLeftNum()<100?"text-warning":"text-primary";
                        if(firstProduct.getLeftNum()<10) text="text-danger";
                    %>

                    <h5 class="text-muted">Remaining:<span class="<%=text%>"><%=firstProduct.getLeftNum()%></span></h5>
                    <div class="num clearfix"><img class="fl sub" src="img/temp/sub.jpg">
                        <span class="fl" id="count" contentEditable="true">1</span><img
                            class="fl add" src="img/temp/add.jpg">
                        <p class="please fl">Please select product attributes!</p></div>
                </div>

                <div class="btns clearfix">
                    <a href="javascript:addProduct('T')"><p class="buy fl">Buy Now</p></a>
                    <a href="javascript:addProduct('S')"><p class="cart fr">Add to cart</p></a></div>
            </div>
        </div>
    </div>
</div>
<script>
    function addProduct(url) {
        var id=<%=firstProduct.getId()%>;
        var count = document.getElementById("count").innerHTML;
        location.href='./addProduct?id='+id+'&count='+count+'&url='+url;
    }
</script>

<div class="introMsg wrapper clearfix">
    <div class="msgL fl">
        <div class="msgTit clearfix"><a class="on">Product details</a></div>
        <div class="msgAll">
            <div class="msgImgs">
                <%for(String url:urls){%>
                <img src="<%=url%>">
                <%}%>
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
        </div>
    </div>
</div>
<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/nav.js" type="text/javascript" charset="utf-8"></script>
<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="js/cart.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">jQuery(".bottom").slide({
    titCell: ".hd ul",
    mainCell: ".bd .likeList",
    autoPage: true,
    autoPlay: false,
    effect: "leftLoop",
    autoPlay: true,
    vis: 1
});</script>

<script>
    function disableElement(){
        document.getElementById("firstbtn").disabled=true;
    }

</script>

</body>
</html>