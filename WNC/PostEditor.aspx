<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostEditor.aspx.cs" Inherits="WNC.PostEditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
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
