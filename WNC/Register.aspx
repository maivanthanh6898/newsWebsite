﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="WNC.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
        <script>
            function search() {
                var input = document.getElementById("topSearch");
                window.location.href = "filterForm.aspx?filter=" + input.value
            }

            function search1() {
                var input = document.getElementById("topSearch");
                if (event.keyCode == 13) {
                    event.preventDefault();
                    document.getElementById("btn").click();
                }
            }
        </script>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>Vizew - Blog &amp; Magazine HTML Template</title>

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">6
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
            <!-- Top Header Area -->
            <div class="top-header-area">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-12 col-md-6">
                            <!-- Breaking News Widget -->
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="top-meta-data d-flex align-items-center justify-content-end">
                                <!-- Top Social Info -->
                                <!-- Top Search Area -->
                                
                            <div class="top-search-area">
                                    <input name="top-search" id="topSearch" placeholder="Search..." onkeydown="search1()">
                                    <button type="button" class="btn" id="btn" onclick="search()"><i class="fa fa-search" aria-hidden="true" ></i></button>
                            </div>>
                                <!-- Login -->
                                <asp:HyperLink ID="hyperlink2"
                                    NavigateUrl="loginForm.aspx"
                                    Text="Admin"
                                    runat="server"
                                    class="login-btn">
                                    <i class="fa fa-user" aria-hidden="true">

                                    </i></asp:HyperLink>
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Navbar Area -->
            <div class="vizew-main-menu" id="sticker">
                <div class="classy-nav-container breakpoint-off">
                    <div class="container">

                        <!-- Menu -->
                        <nav class="classy-navbar justify-content-between" id="vizewNav">

                            <!-- Nav brand -->
                            <a href="index.html" class="nav-brand">
                                <img src="img/core-img/logo.png" alt=""></a>

                            <!-- Navbar Toggler -->
                            <div class="classy-navbar-toggler">
                                <span class="navbarToggler"><span></span><span></span><span></span></span>
                            </div>

                            <div class="classy-menu">

                                <!-- Close Button -->
                                <div class="classycloseIcon">
                                    <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                                </div>

                                <!-- Nav Start -->
                                <div class="classynav">
                                    <ul>
                                        <li><a href="index.aspx">Trang chủ</a></li>
                                        <li>
                                            <a href="#">Danh mục</a>
                                            <ul class="dropdown">
                                                <asp:Repeater ID="rptCategory" runat="server">
                                                    <ItemTemplate>
                                                        <li><a href="Category.aspx?category=<%#Eval("Id")%>">- <%#Eval("sCategoryName")%></a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </li>
                                        <li class="active">
                                            <asp:HyperLink ID="hyperlink3"
                                                NavigateUrl="loginForm.aspx"
                                                Text="Đăng nhập"
                                                runat="server" /></li>
                                        <li><asp:HyperLink ID="hyperlink4"
                                                NavigateUrl="Contact.aspx"
                                                Text="Liên hệ"
                                                runat="server" /></li>
                                        <li>
                                    </ul>
                                </div>
                                <!-- Nav End -->
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="vizew-breadcrumb">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home" aria-hidden="true"></i>Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Register</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Login Area Start ##### -->
    <div class="vizew-login-area section-padding-80">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-md-6">
                    <div class="login-content">
                        <!-- Section Title -->
                        <div class="section-heading">
                            <h4>Register</h4>
                            <div class="line"></div>
                        </div>

                        <form id="form2" runat="server">
                            <div class="form-group">
                                <asp:TextBox type="email" class="form-control" ID="username" placeholder="Email or User Name" runat="server"></asp:TextBox>
                                <%--<input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email or User Name">--%>
                            </div>
                            <div class="form-group">
                                <asp:TextBox type="password" class="form-control" ID="password" placeholder="Password" runat="server"></asp:TextBox>
                                <%--<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
                            </div>
                            <div class="form-group">
                                <asp:TextBox type="password" class="form-control" ID="repasword" placeholder="Re-type password" runat="server"></asp:TextBox>
                                <%--<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
                            </div>
                            <div class="form-group">
                                <asp:TextBox type="text" class="form-control" ID="name" placeholder="Enter Your Name" runat="server"></asp:TextBox>
                                <%--<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
                            </div>
                            <div class="form-group">
                                <asp:TextBox type="text" class="form-control" ID="Desc" placeholder="Describe yourself" runat="server"></asp:TextBox>
                                <%--<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
                            </div>
                            <div class="form-group">
                                <asp:TextBox type="text" class="form-control" ID="addr" placeholder="Address" runat="server"></asp:TextBox>
                                <%--<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
                            </div>
                            <asp:Button ID="btnRegist" class="btn vizew-btn w-100 mt-30" runat="server" Text="Register" OnClick="btnRegist_Click" />
                            <%--<button type="submit" class="btn vizew-btn w-100 mt-30">Login</button>--%>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Login Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
    <footer class="footer-area">
        <div class="container">
            <div class="row">
                <!-- Footer Widget Area -->
                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="footer-widget mb-70">
                        <!-- Logo -->
                        <a href="index.aspx" class="foo-logo d-block mb-4">
                            <img src="img/core-img/logo2.png" alt=""></a>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna</p>
                        <!-- Footer Newsletter Area -->
                        <div class="footer-nl-area">
                            <form action="#" method="post">
                                <input type="email" name="nl-email" class="form-control" id="nlEmail" placeholder="Your email">
                                <button type="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Footer Widget Area -->
                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="footer-widget mb-70">
                        <h6 class="widget-title">Latest Twister</h6>
                        <!-- Twitter Slides -->
                        <div class="twitter-slides owl-carousel">

                            <!-- Single Twitter Slide -->
                            <div class="single--twitter-slide">
                                <!-- Single Twit -->
                                <div class="single-twit">
                                    <p><i class="fa fa-twitter"></i><span>@Leonard</span> I am so happy because I found this magazine, and it just made Vizeweasier. Thanks for sharing</p>
                                </div>
                                <!-- Single Twit -->
                                <div class="single-twit">
                                    <p><i class="fa fa-twitter"></i><span>@Leonard</span> I am so happy because I found this magazine, and it just made Vizeweasier. Thanks for sharing</p>
                                </div>
                            </div>

                            <!-- Single Twitter Slide -->
                            <div class="single--twitter-slide">
                                <!-- Single Twit -->
                                <div class="single-twit">
                                    <p><i class="fa fa-twitter"></i><span>@Colorlib</span> I am so happy because I found this magazine, and it just made Vizeweasier. Thanks for sharing</p>
                                </div>
                                <!-- Single Twit -->
                                <div class="single-twit">
                                    <p><i class="fa fa-twitter"></i><span>@Colorlib</span> I am so happy because I found this magazine, and it just made Vizeweasier. Thanks for sharing</p>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

                <!-- Footer Widget Area -->
                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="footer-widget mb-70">
                        <h6 class="widget-title">Sport Videos</h6>

                        <!-- Single Blog Post -->
                        <div class="single-blog-post d-flex">
                            <div class="post-thumbnail">
                                <img src="img/bg-img/1.jpg" alt="">
                            </div>
                            <div class="post-content">
                                <a href="single-post.html" class="post-title">DC Shoes: gymkhana the</a>
                                <div class="post-meta d-flex justify-content-between">
                                    <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i>14</a>
                                    <a href="#"><i class="fa fa-eye" aria-hidden="true"></i>34</a>
                                    <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>84</a>
                                </div>
                            </div>
                        </div>

                        <!-- Single Blog Post -->
                        <div class="single-blog-post d-flex">
                            <div class="post-thumbnail">
                                <img src="img/bg-img/2.jpg" alt="">
                            </div>
                            <div class="post-content">
                                <a href="single-post.html" class="post-title">Sweet Yummy Chocolatea Tea</a>
                                <div class="post-meta d-flex justify-content-between">
                                    <a href="#"><i class="fa fa-comments-o" aria-hidden="true"></i>14</a>
                                    <a href="#"><i class="fa fa-eye" aria-hidden="true"></i>34</a>
                                    <a href="#"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i>84</a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Footer Widget Area -->
                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="footer-widget mb-70">
                        <h6 class="widget-title">Our Address</h6>
                        <!-- Contact Address -->
                        <div class="contact-address">
                            <p>
                                101 E 129th St, East Chicago,
                                    <br>
                                IN 46312, US
                            </p>
                            <p>Phone: 001-1234-88888</p>
                            <p>Email: info.colorlib@gmail.com</p>
                        </div>
                        <!-- Footer Social Area -->
                        <div class="footer-social-area">
                            <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
                            <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
                            <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
                            <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                            <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Copywrite Area -->
        <div class="copywrite-area">
            <div class="container">
                <div class="row align-items-center">
                    <!-- Copywrite Text -->
                    <div class="col-12 col-sm-6">
                        <p class="copywrite-text">
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                            All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i>by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                    <div class="col-12 col-sm-6">
                        <nav class="footer-nav">
                            <ul>
                                <li><a href="#">Advertise</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Contact</a></li>
                                <li><a href="#">Disclaimer</a></li>
                                <li><a href="#">Privacy</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->

    <!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="js/active.js"></script>
</body>

</html>
