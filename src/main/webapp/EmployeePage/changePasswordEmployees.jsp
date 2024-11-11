<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfume Store</title>
        <link rel="stylesheet" href="/EmployeePage/css/EchangePassword.css"/>       
    </head>
    <body>
        <%@include file="/EmployeePage/headerEmployees.jsp" %>
        <div class="container-fluid" style="min-height: 100vh; padding-top: 110px;">
            <div class="title mx-auto my-5" style="color: black; background-color: white; font-size:50px;font-weight: 800;width: auto;">Change Password</div>
            <form action="/employee" method="post" onsubmit="return validateForm()">
                <div class="customer-info mx-auto p-4 d-flex flex-column justify-content-center" style="border: none;border-radius:20px; color: white;border: 1px solid #000;background: white; height: 440px;; width: 600px;">
                    <div class="form-group m-3 mb-2">
                        <label for="txtOldPassword" style="color: black; font-weight: 800;">Current Password</label>
                        <input required="" type="password" id="txtOldPassword" name="txtOldPassword" class="form-control" style="border: 1px solid #000;">
                    </div>
                    <div class="form-group m-3 mb-2">
                        <label for="txtNewPassword" style="color: black;font-weight: 800;">New Password</label>
                        <input required="" type="password" id="txtNewPassword" name="txtNewPassword" class="form-control"  style="border: 1px solid #000;">
                    </div>
                    <div class="form-group m-3 mb-2">
                        <label for="txtNewPassword1" style="color: black;font-weight: 800;">Confirm New Password</label>
                        <input required="" type="password" id="txtNewPassword1" name="txtNewPassword1" class="form-control"  style="border: 1px solid #000;">
                    </div>
                    <%
                        try {
                            String result = (String) request.getAttribute("result");
                            if (!result.equals("")) {
                    %>
                    <div class="alert alert-info mt-3" role="alert"><%=result%></div>
                    <%
                            }
                        } catch (Exception e) {
                        }
                    %>
                    
                <div class="btnBack mx-auto mt-5 d-flex">
                    <button type="submit" value="ChangePassword" name="btnChangePassword" class="btn btn-primary" style="height: 40px; width: 100px; font-size: 16px; text-align: center; margin-left: 50px;">Confirm</button> 
                     <button type="button" value="Back" onclick="window.location.href='/employee/orderListEmployees';" style="height: 40px; width: 100px; font-size: 16px; text-align: center; margin-left: 10px; background: red;">Back</button>
                </div>
                </div>

            </form>
        </div>
        <script>
            function validateForm() {
                var newPassword = document.getElementsByName("txtNewPassword")[0].value;
                var confirmPassword = document.getElementsByName("txtNewPassword1")[0].value;
                if (newPassword != confirmPassword) {
                    alert("New Password and Confirm New Password must match");
                    return false;
                }
            }
        </script>
    </body>
</html>
