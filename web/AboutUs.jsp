<%--
  Created by IntelliJ IDEA.
  User: kiniin
  Date: 2020/10/22
  Time: 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0">
    <title>About Us</title>
    <%--    <link rel="stylesheet"--%>
    <%--          href="static/bootstrap-4.5.0-dist/css/bootstrap.min.css">--%>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/proList.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link href="css/main-css.css" rel="stylesheet">
    <script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
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

<div style="margin-top:81px;text-align: center;font-size: 4em;padding-top: 40px;margin-bottom: 35px">
    Advertising and Product Images
</div>
<hr style="color: grey">


<div id="videoContainer" style="width: 800px;height: 500px;margin: 80px auto 80px auto"></div>

    <div class="container" >
        <img src="img/temp/pic1.JPG" alt="1" />
        <img src="img/temp/pic2.JPG" alt="2" />
        <img src="img/temp/pic3.JPG" alt="3" />
        <img src="img/temp/pic4.JPG" alt="4" />
        <img src="img/temp/pic5.JPG" alt="5" />
        <img src="img/temp/pic6.JPG" alt="6" />
        <img src="img/temp/pic7.JPG" alt="7" />
        <img src="img/temp/pic8.JPG" alt="8" />
    </div>
    <div class="name">
        <p>No 1</p>
    </div>

    <div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
    </div>


<div class="footer" >
    <p class="dibu">This website is just a learning case.<br/>
        Author: Tenghao Su, Hangjiang Qi, Weizheng Zhang
    </p>
</div>
<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.flexslider-min.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript" src="js/superVideo.js"></script>
</body>
<script type="text/javascript">
    $(function(){

        var interval;
        $(".container img").click(function cover(){
            $(this).addClass("zoom").fadeOut(700,append);
            function append(){
                $(this).removeClass("zoom").appendTo(".container").show();
                var name = $(".container").children("img").first().attr("alt");
                $(".name p").text("No "+name);
            }

        })

        function auto(){
            var play = $(".container").children("img").first();
            play.addClass("zoom").fadeOut(700,append);
            function append(){
                $(this).removeClass("zoom").appendTo(".container").show();
                var name = $(this).parent().children("img").first().attr("alt");
                $(".name p").text("No "+name);
            }
            interval = setTimeout(auto,5000);
        }

        $(".container img").hover(function(){
            stopPlay();
        },function(){
            interval = setTimeout(auto,5000);
        })

        function stopPlay(){
            clearTimeout(interval)
        }
        auto();

    })
</script>

<script>
    const nextControl = new Super.NextControl() // 实例化“下一个”按钮控件
    const Dbspeen = new Super.Dbspeen() // 倍速控件
    const fullScreenControl = new Super.FullScreenControl() // 实例化“全屏”控件
    const video = new Super.Svideo('videoContainer', {
        source: new Super.VideoSource({ // 引入视频资源
            src: './video/Video.mp4'
        }),
        leftControls: [nextControl], // 控件栏左槽插入控件
        rightControls: [Dbspeen, fullScreenControl] // 控件栏右槽插入控件
    })
    video.addEventListener('change', (event) => { // 监听video各属性变化
        //  console.log(event)
    })
    nextControl.addEventListener('click', () => { // 监听“下一个”按钮控件点击事件
        alert('click next menu !!!')
    })
    fullScreenControl.addEventListener('fullscreen', () => { // 监听进入全屏
        console.log('is fullscreen !!!')
    })
    fullScreenControl.addEventListener('cancelfullscreen', () => { // 监听退出全屏
        console.log('cancel fullscreen !!!')
    })
</script>
</html>
