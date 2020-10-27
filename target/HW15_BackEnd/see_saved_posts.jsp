<%@ page import="com.mamalimomen.domains.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mamalimomen.domains.Account" %>
<%@ page contentType="text/html; ISO-8859-1; charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="See Saved Posts"/>
    <meta name="keywords" content="HTML, CSS, Java, Servlet, Instagram"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>See saved posts</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link href="see_posts.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
<div class="main-block">
    <h1>See Saved Posts</h1>
    <% String result = (String) request.getAttribute("result");
        if (result != null && !result.isEmpty()) { %>
    <hr>
    <h6><%=result%>
    <%}%>
    <%
        Account account = (Account) session.getAttribute("account");
        List<Post> posts = account.getSavedPosts();

        if (posts.isEmpty()) { %>
    <hr>
    <h6>There is not any saved post yet!</h6>
    <% } else {
        for (int i = 1; i <= posts.size(); i++) {
            Post post = posts.get(i - 1);%>
    <hr>
    <form name="<%="post" + i%>" method="get" action="/HW15_BackEnd_war/see_saved_posts">
        <div class="formcontainer">
            <div class="container">
                <input type="number" name="index" id="index" value="<%=i-1%>" hidden readonly>
                <input type="number" name="id" id="id" value="<%=post.getId()%>" hidden readonly>
                <img name="image" src="<%=post.getImagePath()%>" alt="<%=post.getId()%>">
                <h6><%=post.toString()%>
                </h6>
                <h6><%=post.printLikes()%>
                </h6>
                <h6><%=post.printComments()%>
                </h6>
                <label for="comment"><strong>Comment</strong></label>
                <input type="text" name="comment" id="comment" placeholder="Enter comment">
                <label for="like"><strong>Like</strong></label>
                <input type="checkbox" name="like" id="like">
                <label for="un_save"><strong>UnSave</strong></label>
                <input type="checkbox" name="un_save" id="un_save">
            </div>
            <button type="submit"><strong>Submit</strong></button>
        </div>
    </form>
    <%
            }
        }
    %>
</div>
</body>
</html>