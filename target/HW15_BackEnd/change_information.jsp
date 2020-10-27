<%@ page contentType="text/html; ISO-8859-1;charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Change Information"/>
    <meta name="keywords" content="HTML, CSS, Java, Servlet, Instagram"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Change information</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link href="signup_style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
<div class="main-block">
    <h1>Change Information</h1>
    <form name="change_information" method="post" action="/HW15_BackEnd_war/change_information">
        <div class="formcontainer">
            <div class="container">
                <label for="new_first_name"><strong>New First Name</strong></label>
                <input type="text" placeholder="Enter new firstname" name="new_first_name" id="new_first_name">
                <label for="new_last_name"><strong>New Last Name</strong></label>
                <input type="text" placeholder="Enter new lastname" name="new_last_name" id="new_last_name">
                <label for="new_about_me"><strong>New About you</strong></label>
                <input type="text" placeholder="Enter new about you" name="new_about_me" id="new_about_me">
            </div>
            <% String message = (String) request.getAttribute("message");
                if (message != null) { %>
            <hr>
            <h6><%=message%>
            </h6>
            <hr>
            <%}%>
            <button type="submit"><strong>Change</strong></button>
        </div>
    </form>
</div>
</body>
</html>