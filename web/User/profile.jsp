<%-- 
    Document   : profile
    Created on : Feb 17, 2023, 12:30:37 AM
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
                        <a class="dropdown-item" href="#">Profile</a>
                        <a class="dropdown-item" href="/dashboard">History</a>
                    </div>
                </div>
                <a href="/logout" class="btn btn-danger me-1 my-2 my-sm-0">Logout</a>
            </div>
            <% } %>
        </nav>
        <% UserModel model = (UserModel) session.getAttribute("data");%>
        <div>
            <div class="container mx-5 my-5">
                <div class="row">
                    <div class="col-md-4">
                        <img src="https://via.placeholder.com/150" alt="Profile Picture" class="img-fluid rounded-circle mb-3">
                        <h3><%= model.getFName() + " " + model.getLName()%></h3>
                        Api Key:<p class="text-muted"><%= model.getApiKey()%></p>
                        <ul class="list-unstyled">
                            Email:<li><i class="bi bi-envelope"></i> <%= model.getEmail()%></li>
                            Contact No:<li><i class="bi bi-phone"></i> <%= model.getContact()%></li>
                        </ul>
                    </div>
                    <div class="col-md-8">
                        <h2>Update Profile</h2>
                        <form>
                            <div class="form-group my-2">
                                <label for="firstName">First Name:</label>
                                <input type="text" class="form-control" id="firstName" placeholder="Enter First Name">
                            </div>
                            <div class="form-group my-2">
                                <label for="lastName">Last Name:</label>
                                <input type="text" class="form-control" id="lastName" placeholder="Enter Last Name">
                            </div>
                            <div class="form-group my-2">
                                <label for="email">Email:</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter Email">
                            </div>
                            <div class="form-group my-2">
                                <label for="contact">Contact:</label>
                                <input type="text" class="form-control" id="contact" placeholder="Enter Contact">
                            </div>
                            <div class="my-2">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </form>

                        <hr>
                        <h2>Update Password</h2>
                        <form>
                            <div class="form-group my-2">
                                <label for="oldPassword">Old Password:</label>
                                <input type="password" class="form-control" id="oldPassword" placeholder="Enter Old Password">
                            </div>
                            <div class="form-group my-2">
                                <label for="newPassword">New Password:</label>
                                <input type="password" class="form-control" id="newPassword" placeholder="Enter New Password">
                            </div>
                            <div class="form-group my-2">
                                <label for="confPassword">Confirm Password</label>
                                <input type="password" class="form-control" id="confPassword" placeholder="Enter Confirm Password">
                            </div>
                            <div class="my-2">
                                <button type="submit" class="btn btn-primary">Set Password</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
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
