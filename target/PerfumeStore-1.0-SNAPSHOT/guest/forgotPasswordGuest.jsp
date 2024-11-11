<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <title>Perfume Store - Forgot Password</title>
    <link href="css/Gregister.css" rel="stylesheet" type="text/css"/>
    <style>
        /* Styling improvements */
        .submit:hover {
            background-color: #0056b3; /* Darken button on hover */
        }
        .submit {
            cursor: pointer;
        }
        .error-message {
            color: red;
            margin-top: 10px;
            text-align: center;
            background: rgba(255, 255, 255, 0.7);
            padding: 10px;
            border-radius: 5px;
        }
    </style>
</head>

<body>
    <div class="box">
        <div class="container">
            <div class="top-header">
                <header>Forgot Password</header>
            </div>

            <div class="input-field">
                <input type="text" id="email" name="email" class="input" placeholder="Enter your email..." required aria-label="Email">
                <i class='bx bx-envelope'></i>
            </div>

            <div class="error-message" id="error-message" style="display: none;">
                <!-- Dynamic error messages will be shown here -->
            </div>

            <div class="input-field">
                <input type="button" class="submit" value="Submit" id="submitBtn">
            </div>
            <div class="input-field" style="margin-top: 20px">
                <input type="button" class="submit" value="Back to Login" onclick="window.location.href = '/guest/loginGuest';">
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        document.getElementById('submitBtn').addEventListener('click', function (event) {
            const email = document.getElementById('email').value.trim();
            const errorMessage = document.getElementById('error-message');
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            errorMessage.style.display = 'none';

            if (!email) {
                errorMessage.innerHTML = 'Please enter your email!';
                errorMessage.style.display = 'block';
                return;
            } else if (!emailRegex.test(email)) {
                errorMessage.innerHTML = 'Please enter a valid email address!';
                errorMessage.style.display = 'block';
                return;
            }

            // Disable submit button to prevent multiple submissions
            document.getElementById('submitBtn').disabled = true;

            // Proceed with sending email if validation passes
            sendEmail();
        });

        function sendEmail() {
            const email = document.getElementById("email").value;

            $.ajax({
                url: "/guest/forgotPasswordGuest",
                type: "post",
                data: { email: email },
                success: function (data) {
                  
                    Swal.fire({
                        icon: 'success',
                        text: 'New password is sent. Click OK to redirect to login page',
                        showCancelButton: true,
                        confirmButtonColor: '#3085d6',
                        confirmButtonText: 'OK',
                        cancelButtonColor: '#d33',
                        cancelButtonText: 'Cancel'
                    }).then((result) => {
                        if (result.value) {
                            window.location.href = "/guest/loginGuest";
                        }
                    });
                },
                error: function (xhr) {
                    Swal.fire({
                        title: 'Error',
                        text: "The email does not exist",
                        icon: 'error'
                    });
                },
                complete: function () {
                    // Re-enable submit button after request completes
                    document.getElementById('submitBtn').disabled = false;
                }
            });
        }
    </script>
</body>

</html>
