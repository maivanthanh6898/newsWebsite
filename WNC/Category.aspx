<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="WNC.Category" %>

<!DOCTYPE html>
<html lang="en">

<head>
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
    <form id="form1" runat="server">
        <div class="preloader d-flex align-items-center justify-content-center">
            <div class="lds-ellipsis">
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
                            <div class="breaking-news-area d-flex align-items-center">
                                <div class="news-title">
                                    <p>Breaking News:</p>
                                </div>
                                <div id="breakingNewsTicker" class="ticker">
                                    <ul>
                                        <li><a href="single-post.html">10 Things Amazon Echo Can Do</a></li>
                                        <li><a href="single-post.html">Welcome to Colorlib Family.</a></li>
                                        <li><a href="single-post.html">Boys 'doing well' after Thai</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 col-md-6">
                            <div class="top-meta-data d-flex align-items-center justify-content-end">
                                <!-- Top Social Info -->
                                <!-- Top Search Area -->
                                <div class="top-search-area">
                                    <form action="index.html" method="post">
                                        <input type="search" name="top-search" id="topSearch" placeholder="Search...">
                                        <button type="submit" class="btn"><i class="fa fa-search" aria-hidden="true"></i></button>
                                    </form>
                                </div>
                                <!-- Login -->
                                <asp:HyperLink ID="hyperlink2"
                                    NavigateUrl="loginForm.aspx"
                                    Text="Admin"
                                    runat="server"
                                    class="login-btn">
                                    <i class="fa fa-user" aria-hidden="true">

                                    </i></asp:HyperLink>
                                <asp:Label ID="username" runat="server"></asp:Label>
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
                                        <li class="active"><a href="index.aspx">Trang chủ</a></li>
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
                                        <li>
                                            <asp:HyperLink ID="hyperlink3"
                                                NavigateUrl="loginForm.aspx"
                                                Text="Đăng nhập"
                                                runat="server" /></li>
                                        <li><asp:HyperLink ID="hyperlink4"
                                                NavigateUrl="Contact.aspx"
                                                Text="Liên hệ"
                                                runat="server" /></li>
                                        <li>
                                            <asp:HyperLink ID="hyperlink1"
                                                NavigateUrl="PostEditor.aspx"
                                                Text="Admin"
                                                runat="server" />
                                        </li>
                                    </ul>
                                </div>
                                <!-- Nav End -->
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
        </header>

        <!-- ##### Vizew Post Area Start ##### -->
        <section class="vizew-post-area mb-50">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-md-7 col-lg-8">
                        <div class="all-posts-area">
                            <!-- Section Heading -->
                            <div class="section-heading style-2">
                                <br />
                                <h4 style="text-align:center" id="title" runat="server">Latest News</h4>
                                <br />
                                <div class="line"></div>
                            </div>
                            <!-- Single Post Area -->
                            <asp:Repeater ID="rptNews" runat="server">
                                <ItemTemplate>
                                    <div class="single-post-area mb-30">
                                        <div class="row align-items-center">
                                            <div class="col-12 col-lg-6">
                                                <!-- Post Thumbnail -->
                                                <div class="post-thumbnail">
                                                    <img src="img/content-img/<%# Eval("imgPicture") %>" alt="">
                                                </div>
                                            </div>
                                            <div class="col-12 col-lg-6">
                                                <!-- Post Content -->
                                                <div class="post-content mt-0">
                                                    <a href="#" class="post-cata cata-sm cata-success"><%# Eval("sCategoryName") %></a>
                                                    <a href="single-post.html" class="post-title mb-2"><%# Eval("sTitle") %></a>
                                                    <div class="post-meta d-flex align-items-center mb-2">
                                                        <a href="#" class="post-author">By <%# Eval("sName") %></a>
                                                        <i class="fa fa-circle" aria-hidden="true"></i>
                                                        <a href="#" class="post-date"><%# Eval("sPostedDate") %></a>
                                                    </div>
                                                    <div class="post-meta d-flex">
                                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i><%# Eval("iViews") %></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>

                    <div class="col-12 col-md-5 col-lg-4">
                        <div class="sidebar-area">

                            <!-- ***** Single Widget ***** -->
                            <div class="single-widget followers-widget mb-50">
                                <a href="#" class="facebook"><i class="fa fa-facebook" aria-hidden="true"></i><span class="counter">198</span><span>Fan</span></a>
                                <a href="#" class="twitter"><i class="fa fa-twitter" aria-hidden="true"></i><span class="counter">220</span><span>Followers</span></a>
                                <a href="#" class="google"><i class="fa fa-google" aria-hidden="true"></i><span class="counter">140</span><span>Subscribe</span></a>
                            </div>

                            <!-- ***** Sidebar Widget ***** -->
                            <div class="single-widget youtube-channel-widget mb-50">
                                <!-- Section Heading -->
                                <div class="section-heading style-2 mb-30">
                                    <h4>Danh mục hot</h4>
                                    <div class="line"></div>
                                </div>

                                <asp:Repeater ID="Repeater4" runat="server">
                                    <ItemTemplate>
                                        <div class="single-youtube-channel d-flex align-items-center">
                                            <div class="youtube-channel-thumbnail">
                                                <img src="img/category-img/<%# Eval("sImage") %>" alt="">
                                            </div>
                                            <div class="youtube-channel-content">
                                                <a href="Category.aspx?category=<%#Eval("Id")%>" class="channel-title"><%# Eval("sCategoryName") %></a>
                                                <a href="Category.aspx?category=<%#Eval("Id")%>" class="btn subscribe-btn"><i class="fa fa-play-circle-o" aria-hidden="true"></i>Xem tin</a>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>


                                <!-- ***** Single Widget ***** -->
                                <div class="single-widget newsletter-widget mb-50">
                                    <!-- Section Heading -->
                                    <div class="section-heading style-2 mb-30">
                                        <h4>Newsletter</h4>
                                        <div class="line"></div>
                                    </div>
                                    <p>Subscribe our newsletter gor get notification about new updates, information discount, etc.</p>
                                    <!-- Newsletter Form -->
                                    <div class="newsletter-form">
                                        <form action="#" method="post">
                                            <input type="email" name="nl-email" class="form-control mb-15" id="emailnl" placeholder="Enter your email">
                                            <button type="submit" class="btn vizew-btn w-100">Subscribe</button>
                                        </form>
                                    </div>
                                </div>

                                <!-- ***** Single Widget ***** -->
                                <div class="single-widget mb-50">
                                    <!-- Section Heading -->
                                    <div class="section-heading style-2 mb-30">
                                        <h4>Tin tức nổi bật trong tuần
                                        </h4>
                                        <div class="line"></div>
                                    </div>

                                    <asp:Repeater ID="Repeater5" runat="server">
                                        <ItemTemplate>
                                            <div class="single-blog-post d-flex">
                                                <div class="post-thumbnail">
                                                    <img src="img/content-img/<%#Eval("imgPicture")%>" alt="">
                                                </div>
                                                <div class="post-content">
                                                    <a href="single-post.html" class="post-title"><%#Eval("sTitle")%></a>
                                                    <div class="post-meta d-flex justify-content-between">
                                                        <a href="#"><i class="fa fa-eye" aria-hidden="true"></i><%#Eval("iViews")%></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ##### Vizew Psot Area End ##### -->

        <!-- ##### Footer Area Start ##### -->
        <footer class="footer-area">
            <div class="container">
                <div class="row">
                    <!-- Footer Widget Area -->
                    <div class="col-12 col-sm-6 col-xl-3">
                        <div class="footer-widget mb-70">
                            <!-- Logo -->
                            <a href="index.html" class="foo-logo d-block mb-4">
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
    </form>
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
    <script src="js/plugins/ckeditor/ckeditor.js"></script>
</body>

</html>

