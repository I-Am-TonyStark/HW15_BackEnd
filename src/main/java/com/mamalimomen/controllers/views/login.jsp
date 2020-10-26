<%@ page contentType="text/html; ISO-8859-1;charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Login"/>
    <meta name="keywords" content="HTML, CSS, Java, Servlet, Instagram"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Simple login form</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"/>
    <link rel="stylesheet" href="login_style.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
    <script type="text/javascript"
            src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
</head>
<body>
<div class="main-block">
    <h1>Login</h1>
    <form name="login" method="post" action="/HW15_BackEnd_war/login">
        <hr>
        <label id="icon" for="username"><i class="fas fa-user"></i></label>
        <input type="text" name="username" id="username" placeholder="Username" required/>
        <label id="icon" for="password"><i class="fas fa-unlock-alt"></i></label>
        <input type="password" name="password" id="password" placeholder="Password" required/>
        <hr>
        <% String message = (String) request.getAttribute("message");
            if (message != null) { %>
        <h6>Message : <%=message%>
        </h6>
        <hr>
        <%}%>
        <div class="btn-block">
            <p>If you didn't Register already, Please <a href="signup.html">SignUp</a> first!</p>
            <button type="submit">Submit</button>
        </div>
    </form>
</div>
</body>
<script type="text/javascript">
    $(document).ready(function () {
        $("#loginForm").validate({
            rules: {
                username: {
                    required: true,
                    username: true
                },
                password: "required",
            },
            messages: {
                username: {
                    required: "Please enter username",
                    password: "Please enter a valid username"
                },
                password: "Please enter password"
            }
        });
    });
</script>
</html>