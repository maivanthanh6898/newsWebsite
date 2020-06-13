<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostEditor.aspx.cs" Inherits="WNC.PostEditor" %>

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
                                        <li>
                                            <asp:HyperLink ID="hyperlink3"
                                                NavigateUrl="loginForm.aspx"
                                                Text="Đăng nhập"
                                                runat="server" /></li>
                                        <li><asp:HyperLink ID="hyperlink4"
                                                NavigateUrl="Contact.aspx"
                                                Text="Liên hệ"
                                                runat="server" /></li>
                                        <li class="active">
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
    <!-- ##### Header Area End ##### -->

    <form id="form1" runat="server">
        <div class="form-group">
            <asp:DropDownList ID="ddlCategory" runat="server"></asp:DropDownList>
        </div>
        <div class="form-group">
            <asp:TextBox type="text" class="form-control" ID="txtTitle" placeholder="Title" runat="server"></asp:TextBox>
        </div>
        <div id="editor"></div>
        <%--<asp:Button ID="btnCreatePost" runat="server" Text="Button" />--%>
        <button type="button" id="btnCreatePost">Create</button>
    </form>
    

                <!-- Footer Widget Area -->
                <div class="col-12 col-sm-6 col-xl-3">
                    <div class="footer-widget mb-70">
                        <h6 class="widget-title">Our Address</h6>
                        <!-- Contact Address -->
                        <div class="contact-address">
                            <p>101 E 129th St, East Chicago, <br>IN 46312, US</p>
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
                        <p class="copywrite-text"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
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
    <script src="js/plugins/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        var editor = CKEDITOR.replace("editor");
        var btnCreatePost = document.getElementById("btnCreatePost");
        var txtTitle = document.getElementById("txtTitle");
        btnCreatePost.addEventListener('click', () => {
            console.log(CKEDITOR.instances.editor.getData(), txtTitle.value)
        }); 
    </script>
</body>

</html>
