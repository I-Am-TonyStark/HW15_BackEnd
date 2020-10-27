<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Insert Post"/>
    <meta name="keywords" content="HTML, CSS, Java, Servlet, Instagram"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Insert post</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link href="signup_style.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
<div class="main-block">
    <h1>Insert New Post</h1>
    <form name="insert_post" method="post" action="/HW15_BackEnd_war/insert_post" enctype="multipart/form-data">
        <div class="formcontainer">
            <div class="container">
                <label for="post_text"><strong>Post Text</strong></label>
                <input type="text" placeholder="Enter post text" name="post_text" id="post_text" required>
                <input type="file" placeholder="Choose post image" name="img_path" size="50" id="img_path" required/>
            </div>
            <% String message = (String) request.getAttribute("message");
                if (message != null) { %>
            <hr>
            <h6><%=message%>
            </h6>
            <hr>
            <%}%>
            <button type="submit"><strong>Insert</strong></button>
        </div>
    </form>
</div>
</body>
</html>