<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PLItemDetails.aspx.cs" Inherits="BomShopping2.Views.PLItemDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p>&nbsp;</p>
    <span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span><a href="javascript:history.back()">Back</a>

        <hr />

    <asp:FormView ID="plItemDetail" runat="server" ItemType="BomShopping2.Models.PricelistItem" SelectMethod ="GetPricelistItem" RenderOuterTable="false">
        <ItemTemplate>
            <div>
                <h1 style="text-align:center;"><%#:Item.Reference %></h1>
                <h2 style="text-align:center;">
                    <span class="label label-info"><%#:Item.Tag%></span>
                    <span class="label label-<%# ProcessStatusLabel(Item.Status) %>"><%# ProcessStatusText(Item.Status) %></span>
                </h2>
            </div>
            <br />
            
            <img class="center-block img-responsive" src="/Static/Images/Pricelist/<%#:Item.ImagePath%>.jpg" alt="<%#:Item.Reference%>">

            <table>
                <tr> 
                    <td style="vertical-align: top; text-align:left;">
                        <dl class="dl-horizontal">
                        <!--  Description  -->
                        <div id="description" <%# ProcessVisibilityString(Item.Description) %>>
                            <dt>Description</dt><dd><%#:Item.Description %></dd>
                        </div>

                        <div id="listprice">
                            <span visible='<%# !(User.IsInRole("client")) %>'><dt>List Price</dt><dd><%#: String.Format("{0:##,#.00} €", Item.UnitPrice) %></dd></span>
                        </div>

                        <div id="buyprice" >
                            <span visible='<%# !(User.IsInRole("client")) %>'><dt>Buy Price</dt><dd><%#: String.Format("{0:##,#.00} €", Item.BuyPrice) %></dd></span>
                        </div>

                        <div id="size" <%# ProcessVisibilityString(Item.Size) %>>
                            <span><dt>Size</dt><dd><%#: Item.Size %></dd></span>
                        </div>

                        <div  id="technology" <%# ProcessVisibilityString(Item.Technology) %>>
                            <span><dt>Technology</dt><dd><%#:Item.Technology %></dd></span>
                        </div>

                        <div id="resolution" <%# ProcessVisibilityString(Item.Resolution) %>>
                            <span><dt>Resolution</dt><dd><%#:Item.Resolution %></dd></span>
                        </div>

                        <div id="hdr" <%# ProcessVisibilityString(Item.HDR) %>>
                            <span><dt>HDR</dt><dd><%# (Item.HDR == "1" ? "Yes" : "No") %></dd></span>
                        </div>

                        <div id="brightness" <%# ProcessVisibilityString(Item.Brightness) %>>
                            <span><dt>Brightness</dt><dd><%#:Item.Brightness %> cd/m²</dd></span>
                        </div>

                        <div id="twentyfourseven" <%# ProcessVisibilityString(Item.TwentyFourSeven) %>>
                            <span><dt>24/7</dt><dd><%# (Item.TwentyFourSeven == "1" ? "Yes" : "No") %></dd></span>
                        </div>

                        <div id="portrait" <%# ProcessVisibilityString(Item.Portrait) %>>
                            <span><dt>Portrait</dt><dd><%# (Item.Portrait == "1" ? "Yes" : "No") %></dd></span>
                        </div>

                        <div id="tuner" <%# ProcessVisibilityString(Item.Tuner) %>>
                            <span><dt>Tuner</dt><dd><%# (Item.Tuner == "1" ? "Yes" : "No") %></dd></span>
                        </div>

                        <div id="ipcontrol" <%# ProcessVisibilityString(Item.IPControl) %>>
                            <span><dt>IPControl</dt><dd><%# (Item.IPControl == "1" ? "Yes" : "No") %></dd></span>
                        </div>

                        <div id="rs232" <%# ProcessVisibilityString(Item.Rs232) %>>
                            <span><dt>Rs232</dt><dd><%# (Item.Rs232 == "1" ? "Yes" : "No") %></dd></span>
                        </div>

                        <div id="professionalmode" <%# ProcessVisibilityString(Item.Professional) %>>
                            <span><dt>Professional Mode</dt><dd><%# (Item.Professional == "1" ? "Yes" : "No") %></dd></span>
                        </div>

                        <div id="warranty" <%# ProcessVisibilityString(Item.Warranty) %>>
                            <span><dt>Warranty</dt><dd><%#:Item.Warranty %></dd></span>
                        </div>

                        <div id="interactive" <%# ProcessVisibilityString(Item.Interactive) %>>
                            <span><dt>Interactive</dt><dd><%#:Item.Interactive %></dd></span>
                        </div>

                        <div id="color" <%# ProcessVisibilityString(Item.Color) %>>
                            <span><dt>Color</dt><dd><%#:Item.Color %></dd></span>
                        </div>

                        <div id="os" <%# ProcessVisibilityString(Item.OS) %>>
                            <span><dt>OS</dt><dd><%#:Item.OS %></dd></span>
                        </div>

                        <div id="linktodatasheet" <%# ProcessVisibilityString(Item.LinkToDatasheet) %>>
                            <span><dt>Link to Datasheet</dt><dd><a target="_blank" href="<%#:Item.LinkToDatasheet %>"><%#:Item.LinkNameToDatasheet %></a></dd></span>
                        </div>

                        <%--<div id="productnumber">
                            <span><dt>Product Number</dt><dd><%#:Item.PricelistItemID %></dd></span>
                        </div>--%>

                        <%--<div id="compatiblemodels">
                            <span><dt>Compatible Models</dt><dd><%#:Item.CompatibleModels %></dd></span>
                        </div>--%>

                        </dl>
                        <%--<asp:ListView ID="CompatibleItems" runat="server" ItemType="BomShopping2.Models.PricelistItem" SelectMethod ="GetCompatibleItems">
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
                                                <img class="card-img-top img-responsive" src="/Static/Images/Pricelist/<%#:Item.ImagePath%>" alt="<%#:Item.Reference%>"></a>
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
                        </asp:ListView>--%>
                    </td>
                </tr>
            </table>

        </ItemTemplate>
    </asp:FormView>

    <hr />

    <span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span><a href="javascript:history.back()">Back</a>

</asp:Content>
