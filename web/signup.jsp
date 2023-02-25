<%-- 
    Document   : signup
    Created on : Jan 22, 2023, 12:48:52 PM
    Author     : sachin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            html,body { 
                height: 100%; 
            }

            .global-container{
                height:100%;
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: #f5f5f5;
            }

            form{
                padding-top: 10px;
                font-size: 14px;
                margin-top: 30px;
            }

            .card-title{ font-weight:300; }

            .btn{
                font-size: 14px;
                margin-top:20px;
            }


            .login-form{ 
                width:330px;
                margin:20px;
            }

            .sign-up{
                text-align:center;
                padding:20px 0 0;
            }

            .alert{
                margin-bottom:-30px;
                font-size: 13px;
                margin-top:20px;
            }
        </style>
    </head>
    <body>
        <div class="global-container">
            <div class="card login-form">
                <div class="card-body">
                    <h3 class="card-title text-center">Sign in to Universal Car</h3>
                    <div class="card-text">
                        <% if (request.getAttribute("message") != null && request.getAttribute("status").toString().equals("400")) {%>
                        <div class="alert alert-danger alert-dismissible fade show" role="alert"><%= request.getAttribute("message").toString()%></div> 
                        <% } %>
                        <% if (request.getAttribute("message") != null && request.getAttribute("status").toString().equals("200")) {%>
                        <div class="alert alert-success alert-dismissible fade show" role="alert"><%= request.getAttribute("message").toString()%></div> 
                        <% } %>

                        <form action="/login" method="POST">
                            <!-- to error: add class "has-danger" -->
                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input name="email" type="email" class="form-control form-control" id="email" aria-describedby="emailHelp">
                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input name="password" type="password" class="form-control form-control" id="password">
                            </div>
                            <button type="submit" name="submit" class="btn btn-primary btn-block">Sign in</button>

                            <div class="sign-up">
                                Don't have an account? <a href="/singin">Create One</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%-- start web service invocation --%>
        <%
            if (request.getParameter("submit") != null) {
                try {
                    lk.ucs.client.controller.User_Service service = new lk.ucs.client.controller.User_Service();
                    lk.ucs.client.controller.User port = service.getUserPort();
                    
                    java.lang.String email = request.getParameter("email");
                    java.lang.String password = request.getParameter("password");
                    
                    lk.ucs.client.controller.CommonResponse result = port.login(email, password);
                    if (result.getStatus() == 200) {
                        session.setAttribute("data", result.getData());
                        session.setAttribute("status", result.getStatus());
                        session.setAttribute("message", result.getMessage());
                        request.getRequestDispatcher("/").forward(request, response);
                    } else {
                        request.setAttribute("status", result.getStatus());
                        request.setAttribute("data", result.getData());
                        request.setAttribute("message", result.getMessage());
                        request.getRequestDispatcher("/login").forward(request, response);
                    }

                } catch (Exception ex) {
                    // TODO handle custom exceptions here
                }
            }

        %>
        <%-- end web service invocation --%>
    </body>
</html>
