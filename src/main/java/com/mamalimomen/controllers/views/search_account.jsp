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
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
            crossorigin="anonymous"></script>
</head>
<body>
<div class="main-block">
    <h1>Search an account</h1>
    <form name="search" method="post" action="/HW15_BackEnd_war/search_account">
        <hr>
        <label id="icon" for="account_username"><i class="fas fa-user"></i></label>
        <input type="text" name="account_username" id="account_username" placeholder="Account Username" required/>
        <hr>
        <% String message = (String) request.getAttribute("message");
            if (message != null) { %>
        <h6>Message : <%=message%>
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
        <label id="icon" for="follow"><h6>Follow:</h6></label>
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