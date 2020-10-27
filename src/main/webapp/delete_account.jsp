<%@ page contentType="text/html; ISO-8859-1;charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Delete Account"/>
    <meta name="keywords" content="HTML, CSS, Java, Servlet, Instagram"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Delete your account</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link href="signup_style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
<div class="main-block">
    <h1>Delete Your Account</h1>
    <hr>
    <form name="delete_account" method="post" action="/HW15_BackEnd_war/delete_account">
        <div class="formcontainer">
            <div class="container">
                <label for="delete"><strong>Delete my account</strong></label>
                <input type="checkbox" name="delete" id="delete" required>
            </div>
            <button type="submit"><strong>Insert</strong></button>
        </div>
    </form>
</div>
</body>
</html>