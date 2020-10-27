<%@ page contentType="text/html; ISO-8859-1;charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="SignUp"/>
    <meta name="keywords" content="HTML, CSS, Java, Servlet, Instagram"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Simple signup form</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link href="signup_style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
<div class="main-block">
    <h1>SignUp</h1>
    <form name="sign_up" method="post" action="/HW15_BackEnd_war/sign_up">
        <div class="icon">
            <i class="fas fa-user-circle"></i>
        </div>
        <div class="formcontainer">
            <div class="container">
                <label for="first_name"><strong>First Name</strong></label>
                <input type="text" placeholder="Enter firstname" name="first_name" id="first_name" required>
                <label for="last_name"><strong>Last Name</strong></label>
                <input type="text" placeholder="Enter lastname" name="last_name" id="last_name" required>
                <label for="about_me"><strong>About you</strong></label>
                <input type="text" placeholder="Enter about you" name="about_me" id="about_me" required>
                <label for="username"><strong>Username</strong></label>
                <input type="text" placeholder="Enter username" name="username" id="username" required>
                <label for="password"><strong>Password</strong></label>
                <input type="password" placeholder="Enter Password" name="password" id="password" required>
            </div>
            <% String message = (String) request.getAttribute("message");
                if (message != null) { %>
            <hr>
            <h6><%=message%>
            </h6>
            <hr>
            <%}%>
            <button type="submit"><strong>Submit</strong></button>
        </div>
    </form>
</div>
</body>
</html>