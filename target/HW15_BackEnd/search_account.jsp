<%@ page import="com.mamalimomen.domains.Account" %>
<%@ page contentType="text/html; ISO-8859-1;charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Search Account"/>
    <meta name="keywords" content="HTML, CSS, Java, Servlet, Instagram"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Search an account</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"/>
    <link rel="stylesheet" href="login_style.css"/>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
          integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
</head>
<body>
<div class="main-block">
    <h1>Search an account</h1>
    <form name="search" method="post" action="/HW15_BackEnd_war/search_account">
        <hr>
        <label id="icon" for="username"><i class="fas fa-user"></i></label>
        <input type="text" name="username" id="username" placeholder="Account Username" required/>
        <hr>
        <% String message = (String) request.getAttribute("message");
            if (message != null && !message.isEmpty()) { %>
        <h6><%=message%>
        </h6>
        <hr>
        <%}%>
        <div class="btn-block">
            <button type="submit">Search</button>
        </div>
    </form>
    <% Account searchedAccount = (Account) request.getSession().getAttribute("searched_account");
        if (searchedAccount != null) { %>
    <hr>
    <h6><%=searchedAccount.toString()%>
    </h6>
    <form name="follow" method="get" action="/HW15_BackEnd_war/search_account">
        <label for="follow"><strong>Follow</strong></label>
        <input type="checkbox" name="follow" id="follow">
        <hr>
        <div class="btn-block">
            <button type="submit">Follow</button>
        </div>
    </form>
    <%}%>
</div>
</body>
</html>