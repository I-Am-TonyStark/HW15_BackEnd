<%@ page import="com.mamalimomen.domains.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mamalimomen.domains.Post" %>
<%@ page language="java" contentType="text/html; ISO-8859-1; charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>See own posts</title>
</head>
<body>
<%
    Account account = (Account) session.getAttribute("account");
    List<Post> posts = account.getPosts();

    if (posts.isEmpty()) { %>
        <p>You have no post yet!</p>
        <% } else{

    for (int i = 1; i <= posts.size(); i++) {%>
        <p><%=posts.get(i-1)%></p><br/>
    <%}}%>
</body>
</html>