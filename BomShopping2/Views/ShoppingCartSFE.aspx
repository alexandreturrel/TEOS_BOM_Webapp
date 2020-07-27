<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCartSFE.aspx.cs" Inherits="BomShopping2.Views.ShoppingCartSFE" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p>&nbsp;</p>

    <input type="button" value="Select" onclick="selectElementContents(document.getElementById('rawItemList') );">

    <p>&nbsp;</p>

    <p id="rawItemList">
    <asp:ListView ID="RawCartList" runat="server" ItemType="BomShopping2.Models.ShoppingCartItem" SelectMethod="GetShoppingCartItems">
        <ItemTemplate>
            <%#: Item.PricelistItem.Reference %> <%#: Item.Quantity %></br>
        </ItemTemplate>
    </asp:ListView>
    </p>

    <p>&nbsp;</p>

<script type="text/javascript">
    function selectElementContents(el) {
        //filter not relevant data
        var body = document.body, range, sel;
        if (document.createRange && window.getSelection) {
            range = document.createRange();
            sel = window.getSelection();
            sel.removeAllRanges();
            try {
                range.selectNodeContents(el);
                sel.addRange(range);
            } catch (e) {
                range.selectNode(el);
                sel.addRange(range);
            }
        } else if (body.createTextRange) {
            range = body.createTextRange();
            range.moveToElementText(el);
            range.select();
            range.execCommand("copy");
            alert("Copied the text: " + range.value);
        }
        else {
            alert("Failed");
        }
    }
</script>
</asp:Content>


