<%@ page import="java.util.ArrayList" %>
<%@ page import="javaservlet.vo.Address" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>Adress</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/mygxin.css"/>
    <link rel="stylesheet"
          href="static/bootstrap-4.5.0-dist/css/bootstrap.min.css">
    <link rel="stylesheet"  type="text/css" href="css/toastr.css" >
    <script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="js/toastr.min.js"></script>
    <script src="static/bootstrap-4.5.0-dist/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
    <script>
        toastr.options = {
            closeButton: true,
            debug: false,
            progressBar: false,
            positionClass: "toast-top-full-width",
            preventOpenDuplicates: true,
            onclick: null,
            showDuration: "1000",
            hideDuration: "3000",
            timeOut: "2000",
            extendedTimeOut: "1000",
            showEasing: "swing",
            hideEasing: "linear",
            showMethod: "fadeIn",
            hideMethod: "fadeOut"
        };
    </script>

</head>
<%
    int state=0;
    if(session.getAttribute("userNo") !=null)
        state=1;
    if(state==1 && session.getAttribute("addressLists")==null)
        request.getRequestDispatcher("./getAddress") .forward(request, response);
    ArrayList<ArrayList<Address>> addressLists = (ArrayList<ArrayList<Address>>) session.getAttribute("addressLists");

%>
<body>
<!------------------------------idea------------------------------>
<div class="address mt">
    <div class="wrapper clearfix"><a href="index.jsp" class="fl">Home</a><span>/</span><a
            href="mygxin.jsp">Personal information</a><span>/</span><a href="address.jsp" class="on">Address Management</a></div>
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
                    <li><a href="./viewOrder">My order</a></li>
                </ul>
                <h4>Personal Center</h4>
                <ul>
                    <li ><a href="mygxin.jsp">My center</a></li>
                    <li class="on"><a href="address.jsp">Address management</a></li>
                </ul>
                <h4>Account Management</h4>
                <ul>
                    <li><a href="mygrxx.jsp">Personal information</a></li>
                    <li><a href="remina.jsp">Change password</a></li>
                </ul>
            </div>
        </div>
        <div class="you fl">
            <h2 class="">Receive addresses
                <a href="#myModal" id="toMyModal" data-target="#myModal" data-toggle="modal" style="text-decoration: #0c5460"  title="Add New Address">
                    <span style="font-size: 15px">- Add new address</span>&nbsp;<img src="img/jia.png" width="20px" height="20px" /></a>
            </h2>

            <% if(addressLists != null){ %>
            <%for(ArrayList<Address> addresses: addressLists){%>
            <div class="row">
                <%for(Address address:addresses){%>
                <div class="col-md-4 " >
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title"><%=address.getReceiver()%></h4>
                            <p class="card-text">
                                <%=address.getPhoneNum()%><br>
                                <%=address.getProvince()%>&nbsp;<%=address.getCity()%><br>
                                <%=address.getDetailedAddress()%>&nbsp;(<%=address.getPostcode()%>)<br>
                            </p>
                            <a id="<%=address.getAddressNo()%>" href="#myModal" data-toggle="modal" title="Edit Address" class="card-link">Edit</a>
                            <a href="./deleteAddress?deleteAddressNo=<%=address.getAddressNo()%>" class="card-link">Delete</a>
                        </div>
                    </div>
                </div>
            <% }%>
            </div>
            <%}%>
            <%}
            else if(state == 1){ %>
            <div class="row">
                <div class="col-md-9 offset-md-2"><h4>There is now no address here, you can add your address above!</h4></div>
            </div>
           <% }else { %>
                <div class="row">
                    <div class="col-md-9 offset-md-3"><h4 style="text-align: left">Signed in and look at your addresses!</h4></div>
                </div>
           <% }%>


        </div>
    </div>
</div><!--编辑弹框--><!--遮罩-->
<%--<div class="mask"></div>--%>
<div class="modal fade" id="myModal">
    <div class="modal-dialog">
        <div class="modal-content">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">Add new address</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <form action="./addAddress" method="post" id="addressForm">
                <div class="modal-body">

                    <div class="form-group has-feedback">
                        <div class="input-group mb-3 input-group-lg">
                            <div class="input-group-prepend ">
                                <span class="input-group-text btn-primary">Receiver :</span>
                            </div>
                            <input type="text" class="form-control required" placeholder="nickname" name="nickname" id="nickname" >
                            <!--                        <h5 class="glyphicon glyphicon-user form-control-feedback"></h5>-->
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <div class="input-group mb-3 input-group-lg">
                            <div class="input-group-prepend ">
                                <span class="input-group-text btn-primary">Contact &nbsp;: </span>
                            </div>
                            <input type="text" class="form-control required" placeholder="phone number" name="phoneNum" id="phoneNum" >
                            <h5 class="glyphicon glyphicon-user form-control-feedback"></h5>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <div class="input-group mb-3 input-group-lg">
                            <div class="input-group-prepend ">
                                <span class="input-group-text btn-primary">Postcode:</span>
                            </div>
                            <input type="text" class="form-control" placeholder="postcode" name="postcode" id="postcode" >
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>

                    </div>
                    <div class="form-group has-feedback">
                        <div class="input-group mb-3 input-group-lg">
                            <div class="input-group-prepend">
                                <span class="input-group-text btn-primary">Province :</span>
                            </div>
                            <input type="text" class="form-control required" placeholder="province" name="province" id="province">
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>

                    </div>
                    <div class="form-group has-feedback">
                        <div class="input-group mb-3 input-group-lg">
                            <div class="input-group-prepend">
                                <span class="input-group-text btn-primary">City:</span>
                            </div>
                            <input type="text" class="form-control required" placeholder="city/town" name="city" id="city">
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>
                    </div>
                    <div class="form-group has-feedback">
                        <div class="form-group">
                            <label for="detail"><h5 class="">Detailed address:</h5></label>
                            <textarea class="form-control required" rows="5" id="detail" style="min-width: 50%" name="detail" ></textarea>
                            <span class="glyphicon glyphicon-user form-control-feedback"></span>
                        </div>
                    </div>

                    <input hidden type="text" id="hide"  name="editAddressNo">

                </div>

                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <div class="btn-group" role="group" style="padding-right: 80px;">
                        <button type="button" class="btn btn-primary btn-lg"  style="width: 90px;"
                                id="addAddress" >Submit</button>
                    </div>
                    <div class="btn-group" role="group"  style="margin-right: 100px;">
                        <button type="button" class="btn btn-secondary btn-lg" style="width: 90px;"
                                data-dismiss="modal">Cancel</button>
                    </div>

                    <!--                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>-->
                </div>
            </form>
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
        var sign=0;  //check edit or add new

        var status = <%=state%>;
        if(status===0) {
            $("#toMyModal").css("visibility","hidden");
        }

        var id="";
        $(".card a").click(function () {
            id = this.id;
            if(id!=="") sign=1;
            else sign=0;
        })
        $("#addAddress").click(function () {
            var flag=0;
            $("#addressForm :input.required").each(function () {
                if($.trim($(this).val())===""){
                    flag=1;
                    $(this).parent().find("span").removeClass("btn-primary").addClass("btn-danger");
                }

            })
            if(flag===1) {
                toastr.error("Please ensure no inputs are none!","");
                return;
            }

            flag=0;
            var errorMsg ="";
            var regName ="";

            // $(this).parent().find("span").addClass("btn-primary").removeClass("btn-danger");
            var nameVal = $.trim($("#nickname").val());
            regName = /[~#^$@%&!*()<>:;'"{}【】  ]/;
            if (regName.test(nameVal) ) {
                flag=1;
                errorMsg = "Do not contain illegal characters in your name!";

            }
            else if(nameVal.length < 6 ||nameVal.length>20){
                flag=1;
                errorMsg = "Your name's length should be between 4-20 characters!";
            }
            if(flag===1){
                toastr.warning(errorMsg,"");
                return;
            }
            flag=0;
            var phoneNum = $.trim($("#phoneNum").val());
            regName = /^[0-9]+$/;
            if(!regName.test(phoneNum)){
                flag=1;
                errorMsg = "Only digits allowed in your phone number";
            }
            else if(phoneNum.length!==11) {
                flag=1;
                errorMsg="Your phone number must have 11 digits!";
            }

            if(flag===1){
                toastr.warning(errorMsg,"");
                return;
            }
            flag=0;


            var postcode = $.trim($("#postcode").val());
            regName = /^[0-9]+$/;
            if(!regName.test(postcode)){
                errorMsg = "Only digits allowed in your postcode";
                flag=1;
            }
            else if(postcode.length!==6){
                errorMsg="Your postcode must have 6 digits!";
                flag=1;
            }

            if(flag===1){
                toastr.warning(errorMsg,"");
                return;
            }
            flag=0;

            var province = $.trim($("#province").val());
            regName = /^[a-zA-Z]+$/;
            if(!regName.test(province)) {
                flag=1;
                errorMsg = "Only characters allowed in province";
            }

            else if(province.length<4) {
                flag=1;
                errorMsg="The province may be illegal";
            }


            if(flag===1){
                toastr.warning(errorMsg,"");
                return;
            }
            flag=0;

            var city = $.trim($("#city").val());
            regName = /^[a-zA-Z]+$/;
            if(!regName.test(city)){
                flag=1;
                errorMsg = "Only characters allowed in city";
            }
            else if(city.length<4){
                flag=1;
                errorMsg="The city may be illegal";
            }

            if(flag===1){
                toastr.warning(errorMsg,"");
                return;
            }
            flag=0;


            var detail = $.trim($("#detail").val());
            if(detail.length<10){
                flag=1;
                errorMsg = "Must be more specific so that we can send the product to you.";
            }

            if(flag===1){
                toastr.warning(errorMsg,"");
                return;
            }
            var MyForm =  $('#addressForm');
            if (flag===0) {
                if(sign===0){
                    toastr.success("Successfully add a new address!","");
                   MyForm.submit();
                }
                else if(sign===1){
                    $("#hide").val(id);
                    toastr.success("Successfully edit a address!","");
                    var path = "./editAddress";
                    MyForm.attr('action', path);
                    MyForm.submit();
                }

            }

        });


    });
</script>
</body>
</html>