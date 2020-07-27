<%@ Page Title="Pricelist" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pricelist.aspx.cs" Inherits="BomShopping2.Views.Pricelist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <section>
        <div class="container-fluid">
            <hgroup class="row">
                <h2 class="col-lg-4"><a href="../Views/Pricelist"><%: Page.Title %></a></h2>
                <form class="form-inline col-md-8" style="margin:5px;">
                  <div class="form-group">
                    <label for="myInput" style="margin-left:15px;"> </label>
                    <input type="text" class="form-control" id="myInput" placeholder="Search..." style="width:100%;">
                  </div>
                </form>
            </hgroup>
        </div>
    </section>

    <section>
        <!-- All components -->
        <div class="container">
            <div class="row">

                <!-- Left menu: Categories -->
                <div class="col-lg-3" style="border-right:solid;border-width:thin;border-color:lightgray;padding:10px;">
                    <h4>HARDWARE</h4>
                    <ul class="nav nav-pills nav-stacked" id="Ul1" runat="server">
                        <asp:ListView ID="ListView1" runat="server"
                            DataKeyNames="CategoryID"
                            ItemType="BomShopping2.Models.Category" SelectMethod="GetHardwareCategories">
                            <EmptyDataTemplate>
                                <div></div>
                            </EmptyDataTemplate>
                            <GroupTemplate>
                                <li role="presentation" id="Li1" runat="server">
                                    <div id="itemPlaceholder" runat="server"></div>
                                </li>
                            </GroupTemplate>
                            <ItemTemplate>
                                <a href="<%#: GetRouteUrl("ProductsByCategoryRoute", new {categoryName = Item.CategoryName}) %>">
                                    <%#: Item.CategoryName %>
                                </a>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table id="groupPlaceholderContainer" runat="server">
                                    <tr id="groupPlaceholder"></tr>
                                 </table>
                            </LayoutTemplate>
                        </asp:ListView>
                    </ul>
                    <h4>SOFTWARE</h4>
                    <ul class="nav nav-pills nav-stacked" id="Ul2" runat="server">
                        <asp:ListView ID="ListView3" runat="server"
                            DataKeyNames="CategoryID"
                            ItemType="BomShopping2.Models.Category" SelectMethod="GetSoftwareCategories">
                            <EmptyDataTemplate>
                                <div></div>
                            </EmptyDataTemplate>
                            <GroupTemplate>
                                <li role="presentation" id="Li1" runat="server">
                                    <div id="itemPlaceholder" runat="server"></div>
                                </li>
                            </GroupTemplate>
                            <ItemTemplate>
                                <a href="<%#: GetRouteUrl("ProductsByCategoryRoute", new {categoryName = Item.CategoryName}) %>">
                                    <%#: Item.CategoryName %>
                                </a>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table id="groupPlaceholderContainer" runat="server">
                                    <tr id="groupPlaceholder"></tr>
                                 </table>
                            </LayoutTemplate>
                        </asp:ListView>
                    </ul>
                    <h4>SERVICE</h4>
                    <ul class="nav nav-pills nav-stacked" id="Ul3" runat="server">
                        <asp:ListView ID="ListView4" runat="server"
                            DataKeyNames="CategoryID"
                            ItemType="BomShopping2.Models.Category" SelectMethod="GetServiceCategories">
                            <EmptyDataTemplate>
                                <div></div>
                            </EmptyDataTemplate>
                            <GroupTemplate>
                                <li role="presentation" id="Li1" runat="server">
                                    <div id="itemPlaceholder" runat="server"></div>
                                </li>
                            </GroupTemplate>
                            <ItemTemplate>
                                <a href="<%#: GetRouteUrl("ProductsByCategoryRoute", new {categoryName = Item.CategoryName}) %>">
                                    <%#: Item.CategoryName %>
                                </a>
                            </ItemTemplate>
                            <LayoutTemplate>
                                <table id="groupPlaceholderContainer" runat="server">
                                    <tr id="groupPlaceholder"></tr>
                                 </table>
                            </LayoutTemplate>
                        </asp:ListView>
                    </ul>
                </div> <!-- /Left menu: Categories -->

                <!-- Main content: Pricelist items -->

                <div class="inputSearchResult">

                    <asp:ListView ID="ListView2" runat="server" 
                        DataKeyNames="PricelistItemID"
                        ItemType="BomShopping2.Models.PricelistItem" SelectMethod="GetPricelist">
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
                                    <div class="card h-100" style="height:30rem;">
                                      <style>
											.containerHover {
											  position: relative;
											  width: 100%;
											}

											.card-img-top {
												max-height:17rem;
												max-width:28rem;
												display: block;
												margin-left: auto;
												margin-right: auto
											}

											.overlay {
											  position: absolute;
											  top: 0;
											  bottom: 0;
											  left: 0;
											  right: 0;
											  height: 100%;
											  width: 100%;
											  opacity: 0;
											  transition: .3s ease;
											  background-color: #ff8c3c;
											}

											.containerHover:hover .overlay {
											  opacity: 1;
											}

											.text {
											  color: white;
											  position: absolute;
											  text-align: center;
                                              overflow: hidden;
                                              text-overflow: ellipsis;
                                              height: 100%;
											  width: 100%;
                                              padding:10px;
											}
										</style>
											<div class="containerHover">
											<img class="card-img-top img-responsive" src="/Static/Images/Pricelist/<%#:Item.ImagePath%>.jpg" alt="<%#:Item.Reference%>">
												<div class="overlay">
													<div class="text">
														<%#:Item.Description%>
													</div>
												</div>
											</div>
                                        <div class="card-body">
                                        <h4 class="card-title">
                                          <a href="PLItemDetails.aspx?pricelistItemID=<%#: Item.PricelistItemID %>"><%#:Item.Reference%></a>
                                        </h4>
                                        <div runat="server" class="row">
                                            <div runat="server" class="col-md-8">
                                                <span class="label label-info"><%#:Item.Tag%></span>
                                                <span class="label label-<%# ProcessStatusLabel(Item.Status) %>"><%# ProcessStatusText(Item.Status) %></span>
                                            </div>
                                            <div runat="server" class="col-md-4" visible='<%# !(User.IsInRole("client")) %>'><h5 class="text-right"><%#:Item.UnitPrice%> <%#:Item.Currency%></h5></div>
                                        </div>
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
                </div> <!-- /Main content: Pricelist items -->
            </div>
        </div> <!-- /All components -->
    </section>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#myInput').on("keyup",function () {
                $('.card').show();
                var filter = $(this).val(); // get the value of the input, which we filter on
                $('.container').find(".card-title:not(:contains(" + filter + "))").parent().parent().parent().css('display', 'none');
            });
        });

        $(document).ready(function () {
            var url = window.location;
            $('.container .nav').find('.active').removeClass('active');
            $('.container .nav li a').each(function () {
                if (this.href == url) {
                    $(this).parent().addClass('active');
                }
            });
        });
        
    </script>

</asp:Content>
