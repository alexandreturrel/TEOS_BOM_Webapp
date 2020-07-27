<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BundleDetails.aspx.cs" Inherits="BomShopping2.Views.BundleDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:FormView ID="bundleDetail" runat="server" ItemType="BomShopping2.Models.Bundle" SelectMethod ="GetBundle" RenderOuterTable="false">
        <ItemTemplate>
            <div>
                <h1><%#:Item.BundleName %></h1>
            </div>
            <br />
            <table>
                <tr> 
                    <td style="vertical-align: top; text-align:left;">
                        <b>Description:</b><br /><%#:Item.Description %>
                        <br />
                        <span visible='<%# !(User.IsInRole("client")) %>'><b>Price:</b>&nbsp;<%#: String.Format("{0:##,#.00} €", Item.Price) %></span>
                        <br />
                        <span><b>Product Number:</b>&nbsp;<%#:Item.BundleID %></span>
                        <br />
                    </td>
                </tr>
            </table>

            <div class="row">
              <div class="col-md-8">
                  <h3>Included Items:</h3>
              </div>
              <div class="col-md-4">
                  <h3><a href="AddToCart.aspx?bundleID=<%#:Item.BundleID %>&quantity=1">Add all items to cart</a></h3>
              </div>
            </div>

        </ItemTemplate>
    </asp:FormView>

    <p>&nbsp;</p>

    <asp:ListView ID="ListView2" runat="server" 
            DataKeyNames="PricelistItemID"
            ItemType="BomShopping2.Models.PricelistItem" SelectMethod="GetItems">
            <EmptyDataTemplate>
                <div>
                    <p>No data was returned.</p>
                </div>
            </EmptyDataTemplate>
            <GroupTemplate>
                <div id="itemPlaceholderContainer" runat="server">
                    <div id="itemPlaceholder" runat="server"></div>
                </div>
            </GroupTemplate>
            <ItemTemplate>
                <div>
                    <div class="col-lg-3 col-md-6 mb-4 col-lg-offset-0">
                        <div class="card h-100" style="height:35rem;">
                            <style>
                                .card-img-top{
                                    max-height:15rem;
                                    max-width:20rem;
                                    display: block;
                                    margin-left: auto;
                                    margin-right: auto
                                }
                            </style>
                            <a href="PLItemDetails.aspx?pricelistItemID=<%#: Item.PricelistItemID %>">
                                <img class="card-img-top img-responsive" src="/Static/Images/Pricelist/<%#:Item.ImagePath%>.jpg" alt="<%#:Item.Reference%>"></a>
                            <div class="card-body">
                            <h4 class="card-title">
                                <a href="PLItemDetails.aspx?pricelistItemID=<%#: Item.PricelistItemID %>"><%#:Item.Reference%></a>
                            </h4>
                            <div runat="server" class="row">
                                <div runat="server" class="col-xs-12 col-md-8">
                                    <span class="label label-info"><%#:Item.Tag%></span>
                                    <span class="label label-<%# ProcessStatusLabel(Item.Status) %>"><%# ProcessStatusText(Item.Status) %></span>
                                </div>
                                <div runat="server" class="col-xs-6 col-md-4" visible='<%# !(User.IsInRole("client")) %>'><h5 class="text-right"><%#:Item.UnitPrice%> <%#:Item.Currency%></h5></div>
                            </div>
                            <style>
                                .card-text{
                                    max-height:5.7rem;
                                    overflow: hidden;
                                    text-overflow: ellipsis;
                                }
                            </style>
                            <p class="card-text" style="display: inline-block;"><%#:Item.Description%></p>
                            </div>
                            <div class="card-footer">
                            <small class="text-muted">
                                    <div class="text-right"><a href="AddToCart.aspx?pricelistItemID=<%#:Item.PricelistItemID %>&quantity=1">Add to cart</a></div>
                            </small>
                            </div>
                        </div>
                        <p>&nbsp;</p>
                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                    
                <table id="groupPlaceholderContainer" runat="server" style="width:100%">
                    <tr id="groupPlaceholder"></tr>
                    </table>

            </LayoutTemplate>
        </asp:ListView>

    <hr />

    <a runat="server" href="~/Views/BundleList">Back to Bundles</a>

</asp:Content>
