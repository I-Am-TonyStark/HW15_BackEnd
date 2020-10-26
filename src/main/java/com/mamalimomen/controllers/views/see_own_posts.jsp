<%@ page import="com.mamalimomen.domains.Account" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mamalimomen.domains.Post" %>
<%@ page contentType="text/html; ISO-8859-1; charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="See own posts"/>
    <meta name="keywords" content="HTML, CSS, Java, Servlet, Instagram"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>See own posts</title>
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
    <h1>See Own Posts</h1>
    <% String result = (String) request.getAttribute("result");
        if (result != null) { %>
    <hr>
    <h6>Result : <%=result%>
    </h6>
    <%}%>
    <%
        Account account = (Account) session.getAttribute("account");
        List<Post> posts = account.getPosts();

        if (posts.isEmpty()) { %>
    <p>You have no post yet!</p>
    <% } else {

        for (int i = 1; i <= posts.size(); i++) {
            Post post = posts.get(i - 1);%>
    <form name="<%="post" + i%>" method="get" action="/HW15_BackEnd_war/see_own_posts">
        <hr>
        <label id="icon" for="index"><h6>Index:</h6></label>
        <input type="number" name="index" id="index" value="<%=i%>" readonly="readonly">
        <h6><%=post.toString()%>
        </h6>
        <h6><%=post.getLikes().toString()%>
        </h6>
        <h6><%=post.getComments().toString()%>
        </h6>
        <hr>
        <label id="icon" for="comment"><h6>Comment:</h6></label>
        <textarea name="comment" id="comment" placeholder="Comment"></textarea>
        <hr>
        <label id="icon" for="like"><h6>Like:</h6></label>
        <input type="checkbox" name="like" id="like">
        <label id="icon" for="delete"><h6>Delete:</h6></label>
        <input type="checkbox" name="delete" id="delete">
        <div class="btn-block">
            <button type="submit">Submit</button>
        </div>
    </form>
    <br/>
    <%
            }
        }
    %>
</div>
</body>
</html>