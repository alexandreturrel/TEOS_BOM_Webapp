<%@ Page Title="Workplace Solutions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TemplateList.aspx.cs" Inherits="BomShopping2.Views.TemplateList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<section>
		<div class="container-fluid">
			<hgroup class="row">
				<h2 class="col-lg-4"><a href="../Views/TemplateList"><%: Page.Title %></a></h2>
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

			<!-- Left menu: Purposes -->
				<div class="col-lg-3" style="border-right:solid;border-width:thin;border-color:lightgray;padding:10px;">
					<ul class="nav nav-pills nav-stacked">
						<asp:ListView ID="ListViewPurposes" runat="server"
							DataKeyNames="PurposeID"
							ItemType="BomShopping2.Models.Purpose" SelectMethod="GetPurposes">
							<EmptyDataTemplate>
								<div>
									<p>No data was returned.</p>
								</div>
							</EmptyDataTemplate>
							<GroupTemplate>
								<li role="presentation" id="itemPlaceholderContainer" runat="server">
									<div id="itemPlaceholder" runat="server"></div>
								</li>
							</GroupTemplate>
							<ItemTemplate>
								<a href="<%#: GetRouteUrl("TemplatesByPurpose", new {purposeName = Item.PurposeName}) %>">
									<%#:Item.PurposeName%>
								</a>
							</ItemTemplate>
							<LayoutTemplate>
								<table id="groupPlaceholderContainer" runat="server">
									<tr id="groupPlaceholder"></tr>
								 </table>
							</LayoutTemplate>
						</asp:ListView>
					</ul>
				</div> <!-- /Left menu: Purposes -->


				<!-- Main content: Template items -->

				<div>
					<asp:ListView ID="templatelist" runat="server" 
						DataKeyNames="TemplateID" GroupItemCount="4"
						ItemType="BomShopping2.Models.Template" SelectMethod="GetTemplates">
						<EmptyDataTemplate>
							<table >
								<tr>
									<td>No data was returned.</td>
								</tr>
							</table>
						</EmptyDataTemplate>
						<EmptyItemTemplate>
							<td/>
						</EmptyItemTemplate>
						<GroupTemplate>
							<tr id="itemPlaceholderContainer" runat="server">
								<td id="itemPlaceholder" runat="server"></td>
							</tr>
						</GroupTemplate>
						<ItemTemplate>
							<div>
								<div class="col-lg-3 col-md-6 mb-4 col-lg-offset-0">
									<div class="card h-100" style="height:28rem;">
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
											<img class="card-img-top img-responsive" src="/Static/Images/<%#:Item.ImagePath%>.jpg" alt="<%#:Item.TemplateName%>">
												<div class="overlay">
													<div class="text">
														<%#:Item.Description%>
													</div>
												</div>
											</div>
										<div class="card-body">
										<h4 class="card-title">
											<a href="TemplateDetails.aspx?templateID=<%#:Item.TemplateID%>"><%#:Item.TemplateName%></a>
										</h4>
										<h5 runat="server" visible='<%# !(User.IsInRole("client")) %>' class="text-right"><%#:String.Format("{0:##,#.00} €", Item.Price)%></h5>
										</div>
										<div class="card-footer">
										<small class="text-muted">
											<div class="text-right"><a href="AddToCart.aspx?templateID=<%#:Item.TemplateID %>&quantity=1">Add to cart</a></div>
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

				</div><!-- /Main content: Template items -->

			</div>
			</div><!-- /All components -->
		</div>
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
