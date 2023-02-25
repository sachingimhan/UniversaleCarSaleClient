<%-- 
    Document   : dashboard
    Created on : Jan 22, 2023, 12:56:43 PM
    Author     : sachin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="lk.ucs.client.controller.HistoryModel"%>
<%@page import="java.util.List"%>
<%@page import="lk.ucs.client.controller.HistoryModelArray"%>
<%@page import="lk.ucs.client.controller.UserModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            if (session.getAttribute("data") == null) {
                response.sendRedirect("/");
                return;
            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <!--        <style>
                    .list-group-item:hover{
                        background-color: #009aff;
                        color: white;
                    }
                </style>-->
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark bg-dark p-3">
            <a class="navbar-brand" href="#">
                <img src="https://i.ibb.co/1v80Jyr/universal-car-logo-removebg-preview.png" width="80" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" target="_blank" href="https://www.buymeacoffee.com/sachingimhan">Donation</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/about">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/contact">Contact</a>
                    </li>
                </ul>
            </div>
            <% if (session.getAttribute("data") == null) { %>
            <div class="form-inline">
                <a href="/login" class="btn btn-warning me-1 my-2 my-sm-0">Sign in</a>
                <a href="/singin" class="btn btn-warning me-1 my-2 my-sm-0">Sign up</a>
            </div>
            <% } else { %>
            <div class="form-inline">
                <!-- Example single danger button -->
                <div class="btn-group">
                    <button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        Dashboard
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="/profile">Profile</a>
                        <a class="dropdown-item" href="/dashboard">History</a>
                    </div>
                </div>
                <a href="/logout" class="btn btn-danger me-1 my-2 my-sm-0">Logout</a>
            </div>
            <% } %>
        </nav>
        <% UserModel model = (UserModel) session.getAttribute("data"); %>
        <div class="m-3">
            <% if (session.getAttribute("data") == null) { %>

            <h3>Hello there,</h3>
            <% } else {%>
            <h3>Hello <%= model.getFName() + " " + model.getLName()%>,</h3>
            <% }%>
        </div>
        <%
            List<HistoryModel> list = null;
            try {
                lk.ucs.client.controller.User_Service service = new lk.ucs.client.controller.User_Service();
                lk.ucs.client.controller.User port = service.getUserPort();

                java.lang.String api = session.getAttribute("api").toString();

                lk.ucs.client.controller.CommonResponse result = port.userHistory(api);
                HistoryModelArray array = (HistoryModelArray) result.getData();
                list = array.getItem();
            } catch (Exception ex) {

            }
        %>
        <div>
            <h5 class="mx-3">Search History</h5>
            <hr>
            <% SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); %>
            <ul class="list-group list-group-flush">
                <% for (HistoryModel e : list) {%>
                <div class="alert alert-primary" role="alert">
                    <%= e.getCreatedAt()%>
                </div>
                <div class="alert alert-light" role="alert">
                    <%= e.getSearch()%>
                </div>
                <% }%>
            </ul>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script data-name="BMC-Widget" data-cfasync="false" src="https://cdnjs.buymeacoffee.com/1.0.0/widget.prod.min.js" data-id="sachingimhan" data-description="Support me on Buy me a coffee!" data-message="Donation" data-color="#5F7FFF" data-position="Right" data-x_margin="18" data-y_margin="18"></script>
        <script>
            $(document).ready(() => {
                $('.dropdown-toggle').dropdown();
            });
        </script>
    </body>
</html>
