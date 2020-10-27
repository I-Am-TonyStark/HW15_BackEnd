<%@ page import="com.mamalimomen.domains.Account" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; ISO-8859-1;charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="UnFollow Account"/>
    <meta name="keywords" content="HTML, CSS, Java, Servlet, Instagram"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>UnFollow an account</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link href="see_posts.css" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
<div class="main-block">
    <h1>UnFollow An Account</h1>
    <% String result = (String) request.getAttribute("result");
        if (result != null && !result.isEmpty()) { %>
    <hr>
    <h6><%=result%>
    </h6>
    <%}%>
    <%
        Account account = (Account) session.getAttribute("account");
        List<Account> followings = account.getFollowings();

        if (followings.isEmpty()) { %>
    <hr>
    <h6>You do not follow anyone yet!</h6>
    <% } else {
        for (int i = 1; i <= followings.size(); i++) {
            Account following = followings.get(i - 1);%>
    <hr>
    <form name="<%="following" + i%>" method="get" action="/HW15_BackEnd_war/unfollow_account">
        <div class="formcontainer">
            <div class="container">
                <input type="number" name="index" id="index" value="<%=i-1%>" hidden readonly>
                <h6><%=following.toString()%>
                </h6>
                <label for="unfollow"><strong>UnFollow</strong></label>
                <input type="checkbox" name="unfollow" id="unfollow">
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