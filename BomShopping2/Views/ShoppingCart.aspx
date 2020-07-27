<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="BomShopping2.Views.ShoppingCart" %>

<asp:Content ID="ShoppingCartContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Load Pako Deflate library to enable PDF compression 
    <script src="https://kendo.cdn.telerik.com/2020.2.617/js/pako_deflate.min.js"></script> -->

    <div class="printing_to_pdf">
        <p>&nbsp;</p>

        <div id="ShoppingCartTitle" runat="server" class="ContentHead">            
            <h1>Shopping Cart</h1>
        </div>

        <asp:GridView ID="CartList" runat="server" AutoGenerateColumns="False" ShowFooter="False" GridLines="Vertical" CellPadding="4"
            ItemType="BomShopping2.Models.ShoppingCartItem" SelectMethod="GetShoppingCartItems" 
            CssClass="table table-striped table-bordered" >   
            <Columns>
                <asp:BoundField DataField="PricelistItem.PricelistItemId" HeaderText="ID" HeaderStyle-CssClass="noPrint noCopy" ItemStyle-CssClass="noPrint noCopy" />
                <asp:BoundField DataField="PricelistItem.Reference" HeaderText="Reference" />
                <asp:BoundField DataField="PricelistItem.Description" HeaderText="Description" HeaderStyle-CssClass="noCopy" ItemStyle-CssClass="noCopy" />
                <asp:BoundField DataField="PricelistItem.UnitPrice" HeaderText="Price (each)" HeaderStyle-CssClass="noCopy" ItemStyle-CssClass="noCopy" DataFormatString="{0:##,#.00} €"/>     
                <asp:TemplateField   HeaderText="Quantity">            
                        <ItemTemplate>
                            <asp:TextBox ID="PurchaseQuantity" Width="40" runat="server" Text="<%#: Item.Quantity %>"></asp:TextBox> 
                        </ItemTemplate>        
                </asp:TemplateField>    
                <asp:TemplateField HeaderText="Item Total" HeaderStyle-CssClass="noCopy" ItemStyle-CssClass="noCopy" >
                        <ItemTemplate >
                            <p><%#: String.Format("{0:##,#.00} €", ((Convert.ToDouble(Item.Quantity)) *  Convert.ToDouble(Item.PricelistItem.UnitPrice)))%></p>
                        </ItemTemplate>        
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Remove Item" HeaderStyle-CssClass="noPrint noCopy" ItemStyle-CssClass="noPrint noCopy">            
                        <ItemTemplate>
                            <asp:CheckBox id="Remove" runat="server"></asp:CheckBox>
                        </ItemTemplate>        
                </asp:TemplateField>    
            </Columns>    
        </asp:GridView>
    
        <div>
            <p></p>
            <strong>
                <asp:Label ID="LabelTotalText" runat="server" Text="Order Total: "></asp:Label>
                <asp:Label ID="lblTotal" runat="server" EnableViewState="false"></asp:Label>
            </strong> 
        </div>
    </div> <!-- End Printable container -->
    <br />
    <!-- Checkout Placeholder -->
        <table> 
        <tr>
            <td>
                <asp:Button ID="UpdateBtn" runat="server" Text="Update" OnClick="UpdateBtn_Click" />
            </td>
            <td>
                <asp:Button ID="ExportPDFBtn" runat="server" Text="Export to PDF" CssClass="export_pdf" />
            </td>
            <td>
                <asp:Button ID="CopyToClipboard" runat="server" Text="Copy to Clipboard" CssClass="copy_clipboard" OnClick="CopyToClipboard_Click"/>
                <!--<input type="button" value="select table"
                    onclick="selectElementContents(document.getElementById('table') );">-->
            </td>
        </tr>
        </table>



    <script>
        $(document).ready(function () {
            $(".export_pdf").click(function () {
                //filter not printable data
                $(".noPrint").css({ "display": "none" });
                // Convert the DOM element to a drawing using kendo.drawing.drawDOM
                kendo.pdf.defineFont({
                    "DejaVu Sans": "https://kendo.cdn.telerik.com/2016.2.607/styles/fonts/DejaVu/DejaVuSans.ttf",
                    "DejaVu Sans|Bold": "https://kendo.cdn.telerik.com/2016.2.607/styles/fonts/DejaVu/DejaVuSans-Bold.ttf",
                    "DejaVu Sans|Bold|Italic": "https://kendo.cdn.telerik.com/2016.2.607/styles/fonts/DejaVu/DejaVuSans-Oblique.ttf",
                    "DejaVu Sans|Italic": "https://kendo.cdn.telerik.com/2016.2.607/styles/fonts/DejaVu/DejaVuSans-Oblique.ttf",
                });
                kendo.drawing.drawDOM($(".printing_to_pdf"))
                    .then(function (group) {
                        // Render the result as a PDF file
                        return kendo.drawing.exportPDF(group, {
                            paperSize: "auto",
                            margin: { left: "1cm", top: "1cm", right: "1cm", bottom: "1cm" }
                        });
                    })
                    .done(function (data) {
                        // Save the PDF file
                        kendo.saveAs({
                            dataURI: data,
                            fileName: "TEOS Cart.pdf",
                        });
                        $(".noPrint").css({ "display": "initial" });
                    });
            });
        });
    </script>
    <script type="text/javascript">
        function selectElementContents(el) {
            //filter not relevant data
            $(".noCopy").css({ "display": "none" });
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
                //range.execCommand("copy");
                //alert("Copied the text: " + range.value));
            }
            //get back not relevant data
            $(".noCopy").css({ "display": "initial" });
        }

    </script>

</asp:Content>
