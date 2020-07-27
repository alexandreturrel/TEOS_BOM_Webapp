<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCartSF.aspx.cs" Inherits="BomShopping2.Views.ShoppingCartSF" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="False" GridLines="Vertical" CellPadding="4"
            ItemType="BomShopping2.Models.ShoppingCartItem" SelectMethod="GetShoppingCartItems" 
            CssClass="table table-striped table-bordered" >   
            <Columns>
                <asp:BoundField DataField="PricelistItem.Reference" HeaderText="Reference" />
                <asp:TemplateField   HeaderText="Quantity">            
                        <ItemTemplate>
                            <p><%#: Item.Quantity %></p> 
                        </ItemTemplate>        
                </asp:TemplateField>    
            </Columns>    
        </asp:GridView>
</body>
</html>
