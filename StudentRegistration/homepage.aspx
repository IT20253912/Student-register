<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="StudentRegistration.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section>
        <img src="imgs/home/home-bg.jpg" width="100%" class="img-fluid" />
    </section>

    <section>
        <div class="container">
            <div class="row">
                 <div class="col-12">
                     <center>
                         <h2>Our Features</h2>
                         <p><b>Main Primary Feature</b></p>
                     </center>
                 </div>
            </div>

             <div class="row">
                 <div class="col-md-4">
                     <center>
                         <img width="150px" src="imgs/home/registration.png" />
                         <h4>Student Registration</h4>
                     </center>
                 </div>

                 <div class="col-md-4">
                     <center>
                         <img width="150px" src="imgs/home/control.png" />
                         <h4>Profile Control</h4>
                     </center>
                 </div>

                 <div class="col-md-4">
                     <center>
                         <img width="150px" src="imgs/home/access.png" />
                         <h4>Access Control</h4>
                         
                     </center>
                 </div>

            </div>
        </div>
    </section>



</asp:Content>
