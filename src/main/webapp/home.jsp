<%@ page import="com.mamalimomen.domains.Account" %>
<%@ page contentType="text/html; ISO-8859-1; charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Home"/>
    <meta name="keywords" content="HTML, CSS, Java, Servlet, Instagram"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Home page</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"/>
    <link rel="stylesheet" href="login_style.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
<div class="main-block">
    <% Account account = (Account) session.getAttribute("account");%>
    <h1>Welcome <b><%= account.getUser().getFullName()%>
    </b> to your Home Page</h1>
    <form action="change_password.jsp">
        <div class="btn-block">
            <button type="submit">Change my password</button>
        </div>
    </form>
    <form action="change_information.jsp">
        <div class="btn-block">
            <button type="submit">Change my information</button>
        </div>
    </form>
    <form action="insert_post.jsp">
        <div class="btn-block">
            <button type="submit">Insert new post</button>
        </div>
    </form>
    <form action="see_own_posts.jsp">
        <div class="btn-block">
            <button type="submit">See own posts</button>
        </div>
    </form>
    <form action="see_others_posts.jsp">
        <div class="btn-block">
            <button type="submit">See all posts</button>
        </div>
    </form>
    <form action="see_following_posts.jsp">
        <div class="btn-block">
            <button type="submit">See followings posts</button>
        </div>
    </form>
    <form action="see_saved_posts.jsp">
        <div class="btn-block">
            <button type="submit">See saved posts</button>
        </div>
    </form>
    <form action="search_account.jsp">
        <div class="btn-block">
            <button type="submit">Search an account</button>
        </div>
    </form>
    <form action="unfollow_account.jsp">
        <div class="btn-block">
            <button type="submit">UnFollow an account</button>
        </div>
    </form>
    <form action="delete_account.jsp">
        <div class="btn-block">
            <button type="submit">Delete account</button>
        </div>
    </form>
    <form method="get" action="/HW15_BackEnd_war/logout">
        <div class="btn-block">
            <button type="submit">Logout account</button>
        </div>
    </form>
</div>
</body>
</html>