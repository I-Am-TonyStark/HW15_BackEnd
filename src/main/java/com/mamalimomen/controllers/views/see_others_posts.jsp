<%@ page import="com.mamalimomen.services.PostService" %>
<%@ page import="com.mamalimomen.controllers.utilities.AppManager" %>
<%@ page import="com.mamalimomen.controllers.utilities.Services" %>
<%@ page import="com.mamalimomen.domains.Post" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; ISO-8859-1; charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="See posts"/>
    <meta name="keywords" content="HTML, CSS, Java, Servlet, Instagram"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>See others posts</title>
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
    <h1>See New Posts</h1>
    <% String result = (String) request.getAttribute("result");
        if (result != null) { %>
    <hr>
    <h6>Result : <%=result%>
    </h6>
    <%}%>
    <%
        PostService postService = AppManager.getService(Services.POST_SERVICE);
        List<Post> posts = postService.retrieveAllExistPostsOrderByLike();

        if (posts.isEmpty()) { %>
    <p>There is not any post yet!</p>
    <% } else {

        for (int i = 1; i <= posts.size(); i++) {
            Post post = posts.get(i - 1);%>
    <form name="<%="post" + i%>" method="get" action="/HW15_BackEnd_war/see_others_posts">
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
</div>
</body>
</html>