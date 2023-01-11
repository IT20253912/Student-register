<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="StudentRegistration.test" %>


    



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <script type="text/javascript">
        function Validation() { //Validation is a function Name it is perform on onClentClick Event
            var errors = "";
            errors += CheckName();

            errors += CheckEmail();
            errors += CheckPassword();
            errors += CheckCnfPassword();
            errors += CheckAge();
            errors += CheckMobileNo();
            if (errors != "") {
                alert(errors);
                return false;
            }
        }
        //CheckName function: Check for Name TextBox
        //getElementById:This method is simply used for read the controls values By ID

        function CheckName() {
            var TN = document.getElementById('txtname');
            var exp = /^[a-zA-Z ]+$/
            if (TN.value == "") {
                return 'please enter your name!!\n';
            }
            else if (exp.test(TN.value)) {
                return "";
            }
            else {
                return 'please enter only alphabets!!\n';
            }
        }

        //CheckEmail() Function: Check for Email

        function CheckEmail() {
            var TM = document.getElementById('txtemail');
            var exp = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            if (TM.value == "") {
                return 'Plzz Enter Email!!\n';
            }
            else if (exp.test(TM.value)) {
                return "";
            }
            else {
                return 'Plzz enter Valid Email!!\n';
            }

        }
        //CheckAge function : Check for Name Age

        function CheckAge() {
            var TA = document.getElementById('txtage');
            if (TA.value == "") {
                return 'Please Enter Age!!\n';
            }
            else if (TA.value >= 18) {
                return "";
            }
            else {
                return "Please Enter age above 17 years!!\n";
            }
        }
        //CheckPassword() Function: Check for Name Password

        function CheckPassword() {
            var TP = document.getElementById('txtpassword');
            if (TP.value == "") {
                return 'Please enter Password\n';
            }
            else {
                return "";
            }
        }
        //CheckCnfPassword() function :Check for Name Confirm Password both password match or not

        function CheckCnfPassword() {
            var TP = document.getElementById('txtpassword');
            var TCF = document.getElementById('txtcnfpwd');
            if (TCF.value == "") {
                return 'Plzz enter Confirm Password!!\n';
            }
            else if (TP.value == TCF.value) {
                return "";
            }
            else {
                return "Password and Confirm Password is not Match!!\n";
            }
        }

        //CheckMobileNo() Function:Check for Mobile Number validation

        function CheckMobileNo() {
            var TMN = document.getElementById('txtmobno');
            var exp = /^[0]?[789]\d{9}$/;

            if (TMN.value == "") {
                return 'Plzz Enter Mobile No!!\n';
            }
            else if (exp.test(TMN.value)) {
                return "";
            }
            else {
                return 'Plzz Enter valid number!!\n';
            }
        }
    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    


    <div>
        <table>
            <tr>
                <td>Name:</td>
                <td>
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Email
                </td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Age
                </td>
                <td>
                    <asp:TextBox ID="txtage" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Password:
                </td>
                <td>
                    <asp:TextBox ID="txtpassword" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Confirm Password
                </td>
                <td>
                    <asp:TextBox ID="txtcnfpwd" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Mob No:
                </td>
                <td>
                    <asp:TextBox ID="txtmobno" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnsave" runat="server" Text="Save" OnClientClick="return Validation()" OnClick="btnsave_Click" /></td>
            </tr>
        </table>

    </div>


</asp:Content>
