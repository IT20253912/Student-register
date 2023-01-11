<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="StudentRegistration.signup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <script>
            $(document).ready(function () {
                $("#find").click(function () {
                    //Clear Existing Details
                    $("#error").html("");
                    $("#gender").html("");
                    $("#year").html("");
                    $("#month").html("");
                    $("#day").html("");

                    var NICNo = $("#nic").val();
                    var dayText = 0;
                    var year = "";
                    var month = "";
                    var day = "";
                    var gender = "";
                    if (NICNo.length != 10 && NICNo.length != 12) {
                        $("#error").html("Invalid NIC NO");
                    } else if (NICNo.length == 10 && !$.isNumeric(NICNo.substr(0, 9))) {
                        $("#error").html("Invalid NIC NO");
                    }
                    else {
                        // Year
                        if (NICNo.length == 10) {
                            year = "19" + NICNo.substr(0, 2);
                            dayText = parseInt(NICNo.substr(2, 3));
                        } else {
                            year = NICNo.substr(0, 4);
                            dayText = parseInt(NICNo.substr(4, 3));
                        }

                        // Gender
                        if (dayText > 500) {
                            gender = "Female";
                            dayText = dayText - 500;
                        } else {
                            gender = "Male";
                        }

                        // Day Digit Validation
                        if (dayText < 1 && dayText > 366) {
                            $("#error").html("Invalid NIC NO");
                        } else {

                            //Month
                            if (dayText > 335) {
                                day = dayText - 335;
                                month = "December";
                            }
                            else if (dayText > 305) {
                                day = dayText - 305;
                                month = "November";
                            }
                            else if (dayText > 274) {
                                day = dayText - 274;
                                month = "October";
                            }
                            else if (dayText > 244) {
                                day = dayText - 244;
                                month = "September";
                            }
                            else if (dayText > 213) {
                                day = dayText - 213;
                                month = "Auguest";
                            }
                            else if (dayText > 182) {
                                day = dayText - 182;
                                month = "July";
                            }
                            else if (dayText > 152) {
                                day = dayText - 152;
                                month = "June";
                            }
                            else if (dayText > 121) {
                                day = dayText - 121;
                                month = "May";
                            }
                            else if (dayText > 91) {
                                day = dayText - 91;
                                month = "April";
                            }
                            else if (dayText > 60) {
                                day = dayText - 60;
                                month = "March";
                            }
                            else if (dayText < 32) {
                                month = "January";
                                day = dayText;
                            }
                            else if (dayText > 31) {
                                day = dayText - 31;
                                month = "Febuary";
                            }

                            // Show Details
                            $("#gender").html("Gender : " + gender);
                            $("#year").html("Year : " + year);
                            $("#month").html("Month : " + month);
                            $("#day").html("Day :" + day);
                        }
                    }
                    alert("Date of Birth  = " + year + " " + month + " " + day + "\n" + "Student Gender = " + gender);
                });
            });
        </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
      <div class="row">
         <div class="col-md-8 mx-auto">
            <div class="card">
               <div class="card-body">

                  <div class="row">
                     <div class="col">
                        <center>
                            <img width="100px" src="imgs/userlogin/generaluser.png" />                                                                        
                        </center>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Student Signup</h4>
                        </center>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                   <div class="row">
                     <div class="col-md-6">
                        <label>Full Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="Full Name" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Student Registration Number</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox4" runat="server" placeholder="Registration Number" ></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col-md-6">
                        <label>Contact No</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>NIC</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="NIC"  ></asp:TextBox>
                        </div>
                     </div>
                  </div>

                   <div class="row">
                     <div class="col">
                        <label>Email</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <label>Address</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox8" runat="server" placeholder="Address" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                   <div class="row">
                     <div class="col-md-6">
                        <label>Gender</label>
                        <div class="form-group">
                            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server">
                                <asp:ListItem Text="Male" Value="Male" ></asp:ListItem>
                                <asp:ListItem Text="Female" Value="Male" ></asp:ListItem>
                            </asp:DropDownList>
                            <!--
                           <asp:TextBox CssClass="form-control" ID="TextBox9" runat="server" placeholder="Gender" ></asp:TextBox>
                            -->
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Date of Birth</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox10" runat="server" placeholder="Birth of date" TextMode="Date"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                   <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                   <div class="row">
                     <div class="col">
                         <center>
                            <span class="badge badge-pill badge-warning">Check Gender & Date of Birth By NIC </span>
                         </center>
                      </div>
                  </div>

                   <div class="row">
                            <div class="col-md-6">
                                <label>Enter NIC</label>
                                  <div class="form-group">
                                    <input  class="form-control" type="text" id="nic" />
                                </div>
                             </div>
                                    <div class="col-md-2">
                                        <label>&nbsp;</label>
                                        <div class="form-group">
                                    <button class="btn btn-block btn-success" id="find">Find</button>  
                                            </div>
                              
                            </div>
                        </div>

                   <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                 <div class="row">
                     <div class="col">
                         <center>
                            <span class="badge badge-pill badge-info">Login credentials</span>
                         </center>
                      </div>
                  </div>

                  <div class="row">
                     <div class="col-md-6">
                        <label>Username</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox11" runat="server" placeholder="Username" ></asp:TextBox>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Password</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox12" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                        </div>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <div class="form-group">
                           <asp:Button class="btn btn-success btn-block btn-lg" ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
                        </div>
                     </div>

                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br><br>
         </div>
      </div>
   </div>



</asp:Content>
