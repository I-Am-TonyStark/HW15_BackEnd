<%@ page import="com.mamalimomen.domains.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mamalimomen.domains.Account" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; ISO-8859-1; charset=utf-8" pageEncoding="UTF-8" %>
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
    <hr>
    <label id="icon" for="id"><h6>ID:</h6></label>
    <input type="number" name="id" id="id" value="<%=post.getId()%>" readonly="readonly">
    <h6><%=post.toString()%>
    </h6>
    <h6><%=post.getLikes().toString()%>
    </h6>
    <h6><%=post.getComments().toString()%>
    </h6>
    <hr>
    <label id="icon" for="comment"><h6>Comment:</h6></label>
    <textarea type="text" name="comment" id="comment" placeholder="Comment"></textarea>
    <hr>
    <label id="icon" for="like"><h6>Like:</h6></label>
    <input type="checkbox" name="like" id="like">
    <label id="icon" for="save"><h6>Save:</h6></label>
    <input type="checkbox" name="save" id="save">
    <div class="btn-block">
        <button type="submit">Submit</button>
    </div>
</form>
<br/>
<%
        }
    }
%>
</body>
</html>