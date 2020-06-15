<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PostEditor.aspx.cs" Inherits="WNC.PostEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                                    <li>
                                        <asp:HyperLink ID="hyperlink4"
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
    <section class="hero--area section-padding-80">

        <asp:DropDownList ID="ddlCategory" AutoPostBack="True" runat="server"></asp:DropDownList>

        <div class="form-group">
            <asp:TextBox type="text" class="form-control" ID="txtTitle" placeholder="Title" runat="server"></asp:TextBox>
        </div>
        <div>
            <asp:FileUpload ID="picUp" runat="server" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Image ID="imagePic" runat="server" Visible="False" />
            &nbsp;&nbsp;
                <asp:Button ID="btnChooseImage" runat="server" Text="Ảnh khác"
                    CssClass="buttonLogin" OnClick="btnChooseImage_Click" />
        </div>
        <textarea class="ckeditor" runat="server" id="ckcontent"></textarea>
        <asp:Button
            ID="btnSendPost"
            class="btn vizew-btn w-100 mt-30"
            runat="server" Text="Gửi bài viết"
            OnClick="btnSendPost_Click" />

    </section>
</asp:Content>
