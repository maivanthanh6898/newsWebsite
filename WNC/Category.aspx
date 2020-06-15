<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="WNC.Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                        <a href="index.aspx" class="nav-brand">
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
                                    <li class="active">
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
                                    <li>
                                        <asp:HyperLink ID="hyperlink4"
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
                            <h4 style="text-align: center" id="title" runat="server">Latest News</h4>
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
                                                <a href="SinglePost.aspx?newId=<%#Eval("Id")%>" class="post-title mb-2"><%# Eval("sTitle") %></a>
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
                                                <a href="SinglePost.aspx?newId=<%#Eval("Id")%>" class="post-title"><%#Eval("sTitle")%></a>
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
</asp:Content>
