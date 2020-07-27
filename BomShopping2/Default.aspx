<%@ Page Title="Bill of Material" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BomShopping2._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<!-- Header -->
  <header class="bg-primary py-5 mb-5" style="background-color:#ff8c3c">
	<div class="container h-100">
	  <div class="row h-100 align-items-center">
		<div class="col-lg-12">
		  <h1 class="display-4 text-white mt-5 mb-2"><%: Title %></h1>
		  <p class="lead mb-5 text-white-50">The <%: Title %> can help you find what you need to use the TEOS Manage solution in your buildings.</p>
		</div>
	  </div>
	</div>
  </header>


	<!-- Page Content -->
  <div class="container">

	<div class="row">
	  <div class="col-md-8 mb-5">
		<h2>What We Do</h2>
		<hr>
		<h4>
			TEOS is our complete suite of workplace management solutions. 
			Achieve efficiency, insight and impact through complete workplace control. 
			Optimise how your organisation uses devices, space and time to unlock the true  potential of your workforce.
		</h4>
		<!--<a class="btn btn-primary" href="#">Call to Action &raquo;</a>-->
	  </div>

	  <div class="col-md-4 mb-5">
		<h2>Contact Us</h2>
		<hr>
		<asp:ListView ID="ListViewContacts" runat="server"
						DataKeyNames="ContactID"
						ItemType="BomShopping2.Models.ContactRegion" SelectMethod="GetContacts">
						<EmptyDataTemplate>
							<div>
								<p>There is no contact available for your region.</p>
							</div>
						</EmptyDataTemplate>
						<GroupTemplate>
							<div id="itemPlaceholderContainer" runat="server">
								<div id="itemPlaceholder" runat="server" class="list-group-item"></div>
							</div>
						</GroupTemplate>
						<ItemTemplate>
							<address>
							  <strong><%#:Item.Name%></strong>
							  <br><%#:Item.Address%>
							  <br><%#:Item.City%>, <%#:Item.PostalCode%>
							  <br>
							</address>
							<address>
							  <abbr title="Phone">P:</abbr>
							  <%#:Item.Phone%>
							  <br>
							  <abbr title="Email">E:</abbr>
							  <a href="mailto:<%#:Item.Email%>"><%#:Item.Email%></a>
							</address>
						</ItemTemplate>
						<LayoutTemplate>
							<table id="groupPlaceholderContainer" runat="server">
								<tr id="groupPlaceholder"></tr>
							 </table>
						</LayoutTemplate>
					</asp:ListView>
		  </div>
	</div>
	<!-- /.row -->

	<p>&nbsp;</p>

	<div class="row">
	  <h2>News</h2>
	  <hr>
		<asp:ListView ID="NewsList" runat="server" ItemType="BomShopping2.Models.NewsRelease" SelectMethod="GetLastNews">
			<EmptyDataTemplate>
				<div>
					<p>There is no News available for now.</p>
				</div>
			</EmptyDataTemplate>
			<GroupTemplate>
				<div id="itemPlaceholderContainer" runat="server">
					<div id="itemPlaceholder" runat="server" class="list-group-item"></div>
				</div>
			</GroupTemplate>
			<ItemTemplate>
				<div class="col-md-4 mb-5">
					<div class="card h-100" style="height:60rem;">
					  <img class="card-img-top img-responsive" src="/Static/Images/<%#: Item.ImagePath %>.jpg" alt="">
					  <div class="card-body">
						<h4 class="card-title"><%#: Item.Title %></h4>
						<p class="card-text">
							<%#: Item.Description %>
						</p>
					  </div>
					  <div class="card-footer">
						<a target="_blanck" href="<%#: Item.LinkToDocumentation %>" class="btn btn-primary" style="background-color:#ff8c3c;border:none;">Find Out More!</a>
					  </div>
					</div>
				  </div>
			</ItemTemplate>
			<LayoutTemplate>
				<table id="groupPlaceholderContainer" runat="server">
					<tr id="groupPlaceholder"></tr>
				</table>
			</LayoutTemplate>
		</asp:ListView>
	<!-- /.row -->

	<p>&nbsp;</p>

	<div class="panel-group" id="accordion">
	  <h2>Frequently asked Questions</h2>
	  <hr>
		<asp:ListView ID="ListViewCategories" runat="server"
			DataKeyNames="QnAID"
			ItemType="BomShopping2.Models.QnA" SelectMethod="GetQuestions">
			<EmptyDataTemplate>
				<div>
					<p>No data was returned.</p>
				</div>
			</EmptyDataTemplate>
			<GroupTemplate>
				<div class="panel panel-default" id="itemPlaceholderContainer" runat="server">
					<div id="itemPlaceholder" runat="server"></div>
				</div>
			</GroupTemplate>
			<ItemTemplate>
				<div class="panel-heading">
					<h4 class="panel-title">
						<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#<%#:Item.QnaID%>"><%#:Item.Question%></a>
					</h4>
				</div>
				<div id="<%#:Item.QnaID%>" class="panel-collapse collapse">
					<div class="panel-body">
						<p><%#:Item.Answer%> </p>
					</div>
				</div>
			</ItemTemplate>
			<LayoutTemplate>
				<table id="groupPlaceholderContainer" runat="server">
					<tr id="groupPlaceholder"></tr>
					</table>
			</LayoutTemplate>
		</asp:ListView>

	</div>
<%--	  //liens utiles  https://pro.sony/teos  https://pro.sony/en_GB/solutions/corporate --%>
	</div>
  <!-- /.container -->

</asp:Content>
