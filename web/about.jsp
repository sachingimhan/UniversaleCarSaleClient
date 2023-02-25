<%-- 
    Document   : about
    Created on : Feb 25, 2023, 1:53:40 PM
    Author     : sachin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>About - Universal Car Sale</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
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
        <div class="container my-4">
      <h1>About Universal Car Sale</h1>
      <hr>
      <p>
        At Universal Car Sale, we are dedicated to providing a one-stop solution for all your car buying needs. Our online web portal aggregates ads from various websites and brings them together in one place, allowing you to easily browse and compare cars from a variety of sources.
      </p>
      <p>
        Our mission is to simplify the car buying process by providing a user-friendly platform that makes it easy to find the car of your dreams. We understand that buying a car can be a daunting task, and that's why we are committed to providing you with a stress-free experience.
      </p>
      <p>
        Our team of experts works tirelessly to ensure that our platform is always up-to-date with the latest listings, so you can be sure that you are getting the most comprehensive and accurate information. Whether you are looking for a brand new car or a used car, we have got you covered.
      </p>
      <p>
          We believe that everyone deserves to own the car of their dreams, and we are here to make that a reality. So why wait? Browse our listings today and find the car you have always wanted!
      </p>
      <h2>Our Team</h2>
      <hr>
      <div class="row">
        <div class="col-md-4 mb-4">
          <div class="card">
            <img src="https://i.ibb.co/kDRTt8q/wells-chan-l3hwxn-GJXn8-unsplash.jpg" alt="wells-chan-l3hwxn-GJXn8-unsplash" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">Cuong Le</h5>
              <p class="card-text">CEO</p>
            </div>
          </div>
        </div>
        <div class="col-md-4 mb-4">
          <div class="card">
            <img src="https://i.ibb.co/jryryBC/ph-m-duy-quang-QGr6-H7pri-Q-unsplash.jpg" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">Amilia Smith</h5>
              <p class="card-text">Sales Manager</p>
            </div>
          </div>
        </div>
          <div class="col-md-4 mb-4">
          <div class="card">
            <img src="https://i.ibb.co/FkQD7BW/dan-cornilov-eh-UYU820lc-A-unsplash.jpg" class="card-img-top" alt="...">
            <div class="card-body">
              <h5 class="card-title">John Smith</h5>
              <p class="card-text">Head of Operation</p>
            </div>
          </div>
        </div>
      </div>
    </body>
</html>
