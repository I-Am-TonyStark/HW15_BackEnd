<%@ page import="com.mamalimomen.domains.Account" %>
<%@ page language="java" contentType="text/html; ISO-8859-1; charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Home"/>
    <meta name="keywords" content="HTML, CSS, Java, Servlet, Instagram"/>
    <meta http-equiv="refresh" content="60"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>${account.user.username}'s Home page</title>
</head>
<body>
<div style="text-align: center">
    <% Account account = (Account) session.getAttribute("account");%>
    <h1>Welcome <%= account.getUser().getFullName()%> to your home page</h1>
    <a href="change_password.html">Change your password</a><br/>
    <a href="change_information.html">Change your information</a><br/>
    <a href="see_own_posts.jsp">See your posts</a><br/>
    <a href="insert_post.html">Insert new post</a><br/>
    <a href="see_others_posts.jsp">See all new posts</a><br/>
    <a href="see_following_posts.jsp">See followings new posts</a><br/>
    <a href="see_saved_posts.jsp">See saved posts</a><br/>
    <a href="search_account.html">Search an account</a><br/>
    <a href="un_follow_account.jsp">unFollow an account</a><br/>
    <a href="/HW15_BackEnd_war/delete_account">UnFollow an account</a><br/>
    <a href="/HW15_BackEnd_war/logout">Logout account</a><br/>
</div>
</body>
</html>