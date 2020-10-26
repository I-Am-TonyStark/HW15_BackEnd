<%@ page contentType="text/html; ISO-8859-1;charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Delete Account"/>
    <meta name="keywords" content="HTML, CSS, Java, Servlet, Instagram"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Delete your account</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"/>
    <link rel="stylesheet" href="login_style.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
</head>
<body>
<div class="main-block">
    <h1>Delete Your Account</h1>

    <form name="delete_account" method="post" action="/HW15_BackEnd_war/delete_account">
        <hr>
        <label id="icon" for="delete"><h6>Delete my account:</h6></label>
        <input type="checkbox" name="delete" id="delete">
        <div class="btn-block">
            <button type="submit">Delete</button>
        </div>
    </form>
    <br/>
</div>
</body>
</html>