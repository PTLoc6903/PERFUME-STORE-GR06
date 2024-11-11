<%@page import="modelEmployees.Employee"%>
<%@page import="daoEmployees.EmployeeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Information</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <link rel="stylesheet" href="/EmployeePage/css/EupdateProfile.css">
</head>
    <%@include file="/EmployeePage/headerEmployees.jsp" %>
<body>
    <%
        String phone = (String) session.getAttribute("phone");
        EmployeeDAO empDAO = new EmployeeDAO();
        Employee empInfo = empDAO.searchByPhone(phone);
    %>

    <div class="container-fluid" style="padding-top: 110px;">
        <div class="title" style="background:white; color: black; padding-top: 40px; margin-bottom: 40px ; height: auto; width:  auto; font-size: 50px">Employee Information</div>
        <form action="/employee" method="post" onsubmit="return validateForm()" style='width: 100%;display: flex;justify-content: center;justify-items: center;'>
            <div class="customer-info mx-auto p-4 d-flex flex-column justify-content-center" style="background-color:white; border-radius: 20px; box-shadow: 0 0 10px rgba(0,0,0,0.1); height: auto; margin-bottom: 20px; width: 600px;margin-bottom: 50px;">
                <div class="mb-3 row">
                    <label for="txtPhone" class="col-sm-2 col-form-label">Phone:</label>
                    <div class="col-sm-10">
                        <input type="text" name="txtPhone" value="<%= empInfo.getPhone()%>" readonly class="form-control" id="txtPhone">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="txtName" class="col-sm-2 col-form-label">Name:</label>
                    <div class="col-sm-10">
                        <input type="text" name="txtName" value="<%= empInfo.getName()%>" class="form-control" id="txtName">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="txtEmail" class="col-sm-2 col-form-label">Email:</label>
                    <div class="col-sm-10">
                        <input type="text" name="txtEmail" value="<%= empInfo.getEmail()%>" class="form-control" id="txtEmail">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="txtAddress" class="col-sm-2 col-form-label">Address:</label>
                    <div class="col-sm-10">
                        <textarea name="txtAddress" class="form-control" id="txtAddress" rows="3"><%= empInfo.getAddress()%></textarea>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="txtBirthday" class="col-sm-2 col-form-label">Birthday:</label>
                    <div class="col-sm-10">
                        <input type="date" name="txtBirthday" value="<%= empInfo.getBirthday()%>" class="form-control" id="txtBirthday">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="txtCreateDay" class="col-sm-2 col-form-label">Create Date:</label>
                    <div class="col-sm-10">
                        <input type="date" name="txtCreateDay" value="<%= empInfo.getCreate()%>" class="form-control" id="txtCreateDay" readonly>
                    </div>
                </div>

                <%
                    try {
                        String result = (String) request.getAttribute("result");
                        if (result != null && !result.isEmpty()) {
                %>
                    <div class="alert alert-info text-center" role="alert"><%=result%></div>
                <%
                        }
                    } catch (Exception e) {
                    }
                %>
            <div class="text-center mb-1 mt-2">
                <button type="submit" value="Update" name="btnUpdateProfile" class="btn btn-success" style="height: 40px; width: 100px">Update</button>
                <button type="button" value="Back " class="btn btn-danger" onclick="window.location.href='/employee/orderListEmployees';" style="height: 40px; width: 100px">Back</button>
            </div>
        </form>
    </div>
    <script>
        function validateForm() {
            const nameInput = document.getElementsByName("txtName")[0];
            const emailInput = document.getElementsByName("txtEmail")[0];
            const addressInput = document.getElementsByName("txtAddress")[0];
            const birthdayInput = document.getElementsByName("txtBirthday")[0];
            const createDateInput = document.getElementsByName("txtCreateDay")[0];
            const nameRegex = /^[a-zA-Z\s]+$/;
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const maxAddressLength = 50;
            let error = "";

            if (!nameRegex.test(nameInput.value.trim())) {
                error += 'Name must contain letters and spaces.\n';
            }

            if (!emailRegex.test(emailInput.value.trim())) {
                error += 'Please enter a valid email format.\n';
            }

            if (addressInput.value.trim() === '' || addressInput.value.trim().length > maxAddressLength) {
                error += 'Address must not be empty and must not exceed 50 characters.\n';
            }

            const today = new Date().toISOString().slice(0, 10);
            if (new Date(birthdayInput.value) > new Date(today)) {
                error += 'Birthday must be a date in the past.\n';
            }

            if (new Date(createDateInput.value) > new Date(today)) {
                error += 'Create date must be a date in the past.\n';
            }

            if (error !== "") {
                alert(error);
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
