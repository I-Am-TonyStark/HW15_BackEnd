<%@ page contentType="text/html; ISO-8859-1;charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Change Password"/>
    <meta name="keywords" content="HTML, CSS, Java, Servlet, Instagram"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Change password</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"/>
    <link rel="stylesheet" href="login_style.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
<div class="main-block">
    <h1>Change Password</h1>
    <form name="change_password" method="post" action="/HW15_BackEnd_war/change_password">
        <hr>
        <label id="icon" for="old_password"><i class="fas fa-unlock-alt"></i></label>
        <input type="password" name="old_password" id="old_password" placeholder="Old password" required/>
        <label id="icon" for="new_password"><i class="fas fa-unlock-alt"></i></label>
        <input type="password" name="new_password" id="new_password" placeholder="New password" required/>
        <hr>
        <% String message = (String) request.getAttribute("message");
            if (message != null) { %>
        <h6><%=message%>
        </h6>
        <hr>
        <%}%>
        <div class="btn-block">
            <button type="submit">Change</button>
        </div>
    </form>
</div>
</body>
</html>