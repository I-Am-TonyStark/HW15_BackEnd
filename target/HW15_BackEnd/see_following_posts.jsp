<%@ page import="com.mamalimomen.domains.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mamalimomen.domains.Account" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; ISO-8859-1; charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>See following posts</title>
</head>
<body>
<%
    Account account = (Account) session.getAttribute("account");
    List<Post> posts = new ArrayList<>();
    for (Account following : account.getFollowings()) {
        posts.addAll(following.getPosts());
    }

    if (posts.isEmpty()) { %>
<p>There is not any post yet!</p>
<% } else {

    for (int i = 1; i <= posts.size(); i++) {
        Post post = posts.get(i - 1);%>
<form name="<%="post" + i%>" method="get" action="/HW15_BackEnd_war/see_following_posts">
    <p><%=post.toString()%>
    </p><br/>
    <p><%=post.getLikes().toString()%>
    </p><br/>
    <p><%=post.getComments().toString()%>
    </p><br/>
    ID : <input type="number" name="id" value="<%=post.getId()%>" readonly="readonly">
    Comment : <input type="text" name="comment">
    Like : <input type="checkbox" name="like">
    Save : <input type="checkbox" name="save">
    <input type="submit" value="do">
</form>
<br/>
<%
        }
    }
%>
</body>
</html>