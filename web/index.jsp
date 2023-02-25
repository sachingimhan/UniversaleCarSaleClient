<%-- 
    Document   : index
    Created on : Jan 20, 2023, 9:28:04 AM
    Author     : sachin
--%>

<%@page import="lk.ucs.client.controller.UserModel"%>
<%@page import="lk.ucs.client.vehicle.VehicleDtoArray"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="lk.ucs.client.vehicle.VehicleDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
    <body>
        <% String apiKey = session.getAttribute("data") != null ? ((UserModel) session.getAttribute("data")).getApiKey() : null; %>
        <%
            session.setAttribute("api", apiKey);
            List<VehicleDto> list = null;
            if (request.getParameter("submit") != null) {
                try {
                    lk.ucs.client.vehicle.Vehicle_Service service = new lk.ucs.client.vehicle.Vehicle_Service();
                    lk.ucs.client.vehicle.Vehicle port = service.getVehiclePort();
                    // TODO initialize WS operation arguments here
                    java.lang.String model = request.getParameter("model") == null ? "" : request.getParameter("model");
                    java.lang.String api = apiKey;
                    java.lang.String brand = request.getParameter("brand") == null || request.getParameter("brand").equals("All") ? "" : request.getParameter("brand");
                    java.lang.String location = request.getParameter("location") == null || request.getParameter("usedType").equals("All") ? "" : request.getParameter("location");
                    java.lang.String usedType = request.getParameter("usedType") == null || request.getParameter("usedType").equals("All") ? "" : request.getParameter("usedType");
                    java.lang.String fuelType = request.getParameter("fuelType") == null || request.getParameter("fuelType").equals("All") ? "" : request.getParameter("fuelType");
                    java.lang.String year = request.getParameter("year") == null ? "" : request.getParameter("year");
                    // TODO process result here
                    lk.ucs.client.vehicle.CommonResponse result = port.search(model, api, brand, location, usedType, fuelType, year);
                    //                    out.println("Result = " +result.getMessage()+"<br>");
                    VehicleDtoArray array = (VehicleDtoArray) result.getData();
                    list = array.getItem();
                } catch (Exception ex) {
                    // TODO handle custom exceptions here
//                    out.print(ex);
                }
            }
        %>
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
        <% UserModel model = (UserModel) session.getAttribute("data"); %>
        <div class="m-3">
            <% if (session.getAttribute("data") == null) { %>

            <h3>Hello there,</h3>
            <% } else {%>
            <h3>Hello <%= model.getFName() + " " + model.getLName()%>,</h3>
            <% } %>
        </div>
        <div class="m-3 p-3">
            <form action="/" method="POST">
                <div class="row">
                    <div class="col">
                        <input class="form-control mr-sm-2" type="text" placeholder="Model" name="model">
                    </div>
                    <div class="col">
                        <select class="form-select mr-sm-2" name="brand">
                            <option value="All"> All Brands </option>
                            <option value="Acura">Acura</option>
                            <option value="Alfa-Romeo">Alfa-Romeo</option>
                            <option value="Aprilia">Aprilia</option>
                            <option value="Ashok-Leyland">Ashok-Leyland</option>
                            <option value="Aston">Aston</option>
                            <option value="Atco">Atco</option>
                            <option value="Audi">Audi</option>
                            <option value="Austin">Austin</option>
                            <option value="Bajaj">Bajaj</option>
                            <option value="Bentley">Bentley</option>
                            <option value="BMW">BMW</option>
                            <option value="Cadillac">Cadillac</option>
                            <option value="Cal">Cal</option>
                            <option value="CAT">CAT</option>
                            <option value="Ceygra">Ceygra</option>
                            <option value="Changan">Changan</option>
                            <option value="Chery">Chery</option>
                            <option value="Chevrolet">Chevrolet</option>
                            <option value="Chrysler">Chrysler</option>
                            <option value="Citroen">Citroen</option>
                            <option value="Corvette">Corvette</option>
                            <option value="Daewoo">Daewoo</option>
                            <option value="Daido">Daido</option>
                            <option value="Daihatsu">Daihatsu</option>
                            <option value="Datsun">Datsun</option>
                            <option value="Demak">Demak</option>
                            <option value="Dfac">Dfac</option>
                            <option value="DFSK">DFSK</option>
                            <option value="Ducati">Ducati</option>
                            <option value="Eicher">Eicher</option>
                            <option value="FAW">FAW</option>
                            <option value="Ferrari">Ferrari</option>
                            <option value="Fiat">Fiat</option>
                            <option value="Force">Force</option>
                            <option value="Ford">Ford</option>
                            <option value="Foton">Foton</option>
                            <option value="Hero">Hero</option>
                            <option value="Hero-Honda">Hero-Honda</option>
                            <option value="Higer">Higer</option>
                            <option value="Hillman">Hillman</option>
                            <option value="HINO">HINO</option>
                            <option value="Hitachi">Hitachi</option>
                            <option value="Honda">Honda</option>
                            <option value="Hummer">Hummer</option>
                            <option value="Hyundai">Hyundai</option>
                            <option value="Isuzu">Isuzu</option>
                            <option value="Iveco">Iveco</option>
                            <option value="JAC">JAC</option>
                            <option value="Jaguar">Jaguar</option>
                            <option value="JCB">JCB</option>
                            <option value="Jeep">Jeep</option>
                            <option value="JiaLing">JiaLing</option>
                            <option value="JMC">JMC</option>
                            <option value="John-Deere">John-Deere</option>
                            <option value="Jonway">Jonway</option>
                            <option value="KAPLA">KAPLA</option>
                            <option value="Kawasaki">Kawasaki</option>
                            <option value="Kia">Kia</option>
                            <option value="Kinetic">Kinetic</option>
                            <option value="KMC">KMC</option>
                            <option value="Kobelco">Kobelco</option>
                            <option value="Komatsu">Komatsu</option>
                            <option value="KTM">KTM</option>
                            <option value="Kubota">Kubota</option>
                            <option value="Lamborghini">Lamborghini</option>
                            <option value="Land-Rover">Land-Rover</option>
                            <option value="Lexus">Lexus</option>
                            <option value="Loncin">Loncin</option>
                            <option value="Longjia">Longjia</option>
                            <option value="Lotus">Lotus</option>
                            <option value="Lti">Lti</option>
                            <option value="Mahindra">Mahindra</option>
                            <option value="Maserati">Maserati</option>
                            <option value="Massey-Ferguson">Massey-Ferguson</option>
                            <option value="Mazda">Mazda</option>
                            <option value="Mercedes-Benz">Mercedes-Benz</option>
                            <option value="Metrocab">Metrocab</option>
                            <option value="MG">MG</option>
                            <option value="Mg-Rover">Mg-Rover</option>
                            <option value="Micro">Micro</option>
                            <option value="Mini">Mini</option>
                            <option value="Minnelli">Minnelli</option>
                            <option value="Mitsubishi">Mitsubishi</option>
                            <option value="Morgan">Morgan</option>
                            <option value="Morris">Morris</option>
                            <option value="Nissan">Nissan</option>
                            <option value="Opel">Opel</option>
                            <option value="Other">Other</option>
                            <option value="Perodua">Perodua</option>
                            <option value="Peugeot">Peugeot</option>
                            <option value="Piaggio">Piaggio</option>
                            <option value="Porsche">Porsche</option>
                            <option value="Proton">Proton</option>
                            <option value="Range-Rover">Range-Rover</option>
                            <option value="Ranomoto">Ranomoto</option>
                            <option value="Renault">Renault</option>
                            <option value="Reva">Reva</option>
                            <option value="Rolls-Royce">Rolls-Royce</option>
                            <option value="Saab">Saab</option>
                            <option value="Sakai">Sakai</option>
                            <option value="Seat">Seat</option>
                            <option value="Singer">Singer</option>
                            <option value="Skoda">Skoda</option>
                            <option value="Smart">Smart</option>
                            <option value="Subaru">Subaru</option>
                            <option value="Suzuki">Suzuki</option>
                            <option value="Syuk">Syuk</option>
                            <option value="TAFE">TAFE</option>
                            <option value="Tata">Tata</option>
                            <option value="Tesla">Tesla</option>
                            <option value="Toyota">Toyota</option>
                            <option value="Triumph">Triumph</option>
                            <option value="TVS">TVS</option>
                            <option value="Vauxhall">Vauxhall</option>
                            <option value="Vespa">Vespa</option>
                            <option value="Volkswagen">Volkswagen</option>
                            <option value="Volvo">Volvo</option>
                            <option value="Wave">Wave</option>
                            <option value="Willys">Willys</option>
                            <option value="Yamaha">Yamaha</option>
                            <option value="Yanmar">Yanmar</option>
                            <option value="Yuejin">Yuejin</option>
                            <option value="Zongshen">Zongshen</option>
                            <option value="Zotye">Zotye</option>
                        </select>
                        <!--<input class="form-control mr-sm-2" type="text" placeholder="Brand" name="brand">-->
                    </div>
                    <div class="col">
                        <select class="form-select mr-sm-2" name="location">
                            <option value="All" selected="selected"> All Locations </option>
                            <option value="Ambalangoda">Ambalangoda</option>
                            <option value="Ampara">Ampara</option>
                            <option value="Anuradapura">Anuradapura</option>
                            <option value="Avissawella">Avissawella</option>
                            <option value="Bandaragama">Bandaragama</option>
                            <option value="Badulla">Badulla</option>
                            <option value="Balangoda">Balangoda</option>
                            <option value="Bandarawela">Bandarawela</option>
                            <option value="Battaramulla">Battaramulla</option>
                            <option value="Batticaloa">Batticaloa</option>
                            <option value="Beruwala">Beruwala</option>
                            <option value="Boralesgamuwa">Boralesgamuwa</option>
                            <option value="Chavakacheri">Chavakacheri</option>
                            <option value="Chilaw">Chilaw</option>
                            <option value="Colombo">Colombo</option>
                            <option value="Daluguma">Daluguma</option>
                            <option value="Dambulla">Dambulla</option>
                            <option value="Dehiwala-Mount-Lavinia">Dehiwala-Mount</option>
                            <option value="Divulapitiya">Divulapitiya</option>
                            <option value="Dompe">Dompe</option>
                            <option value="Eheliyagoda">Eheliyagoda</option>
                            <option value="Embilipitiya">Embilipitiya</option>
                            <option value="Eravur">Eravur</option>
                            <option value="Galle">Galle</option>
                            <option value="Gampaha">Gampaha</option>
                            <option value="Gampola">Gampola</option>
                            <option value="Hambantota">Hambantota</option>
                            <option value="Haputale">Haputale</option>
                            <option value="Harispattuwa">Harispattuwa</option>
                            <option value="Hatton">Hatton</option>
                            <option value="Hendala">Hendala</option>
                            <option value="Homagama">Homagama</option>
                            <option value="Horana">Horana</option>
                            <option value="Ja-Ela">Ja-Ela</option>
                            <option value="Jaffna">Jaffna</option>
                            <option value="Kadawatha">Kadawatha</option>
                            <option value="Kadugannawa">Kadugannawa</option>
                            <option value="Kaduwela">Kaduwela</option>
                            <option value="Kalawana">Kalawana</option>
                            <option value="Kalmunai">Kalmunai</option>
                            <option value="Kalutara">Kalutara</option>
                            <option value="Kandana">Kandana</option>
                            <option value="Kandy">Kandy</option>
                            <option value="Kattankudy">Kattankudy</option>
                            <option value="Katunayake">Katunayake</option>
                            <option value="Kegalle">Kegalle</option>
                            <option value="Kelaniya">Kelaniya</option>
                            <option value="Kesbewa">Kesbewa</option>
                            <option value="Keselwatta">Keselwatta</option>
                            <option value="Kilinochchi">Kilinochchi</option>
                            <option value="Kiribathgoda">Kiribathgoda</option>
                            <option value="Kolonnawa">Kolonnawa</option>
                            <option value="Kotikawatta">Kotikawatta</option>
                            <option value="Kotte">Kotte</option>
                            <option value="Kottawa">Kottawa</option>
                            <option value="Kuliyapitiya">Kuliyapitiya</option>
                            <option value="Kurunegala">Kurunegala</option>
                            <option value="Maharagama">Maharagama</option>
                            <option value="Mahiyanganaya">Mahiyanganaya</option>
                            <option value="Malabe">Malabe</option>
                            <option value="Mannar">Mannar</option>
                            <option value="Matale">Matale</option>
                            <option value="Matara">Matara</option>
                            <option value="Matugama">Matugama</option>
                            <option value="Mawanella">Mawanella</option>
                            <option value="Minuwangoda">Minuwangoda</option>
                            <option value="Mirigama">Mirigama</option>
                            <option value="Moneragala">Moneragala</option>
                            <option value="Moratuwa">Moratuwa</option>
                            <option value="Mullaitivu">Mullaitivu</option>
                            <option value="Mulleriyawa">Mulleriyawa</option>
                            <option value="Nawalapitiya">Nawalapitiya</option>
                            <option value="Negombo">Negombo</option>
                            <option value="Nittambuwa">Nittambuwa</option>
                            <option value="Nuwara-Eliya">Nuwara-Eliya</option>
                            <option value="Nugegoda">Nugegoda</option>
                            <option value="Padukka">Padukka</option>
                            <option value="Panadura">Panadura</option>
                            <option value="Pannipitiya">Pannipitiya</option>
                            <option value="Peliyagoda">Peliyagoda</option>
                            <option value="Piliyandala">Piliyandala</option>
                            <option value="Polgahawela">Polgahawela</option>
                            <option value="Polonnaruwa">Polonnaruwa</option>
                            <option value="Puttalam">Puttalam</option>
                            <option value="Ragama">Ragama</option>
                            <option value="Ratnapura">Ratnapura</option>
                            <option value="Seethawakapura">Seethawakapura</option>
                            <option value="Sigiriya">Sigiriya</option>
                            <option value="Talawakele">Talawakele</option>
                            <option value="Tangalle">Tangalle</option>
                            <option value="Trincomalee">Trincomalee</option>
                            <option value="Valvettithurai">Valvettithurai</option>
                            <option value="Vavuniya">Vavuniya</option>
                            <option value="Wattala">Wattala</option>
                            <option value="Wattegama">Wattegama</option>
                            <option value="Warakapola">Warakapola</option>
                            <option value="Weligama">Weligama</option>
                            <option value="Welimada">Welimada</option>
                            <option value="Welisara">Welisara</option>
                        </select>
                    </div>
                    <div class="col">
                        <select class="form-select mr-sm-2" name="usedType">
                            <option value="All" selected>Select...</option> 
                            <option value="New">New</option>
                            <option value="Used">Used</option>
                            <option value="Reconditioned">Reconditioned</option>
                        </select>
                    </div>
                    <div class="col">
                        <select class="form-select mr-sm-2" name="fuelType">
                            <option value="All" selected>Select...</option> 
                            <option value="Petrol">Petrol</option>
                            <option value="Diesel">Diesel</option>
                            <option value="Hybrid">Hybrid</option>
                            <option value="Electric">Electric</option>
                        </select>
                        <!--<input class="form-control mr-sm-2" type="text" placeholder="Fuel Type" name="fuelType">-->
                    </div>
                    <div class="col">
                        <input class="form-control mr-sm-2" type="number" placeholder="Year" name="year">
                    </div>
                    <div class="col">
                        <input class="btn btn-outline-success my-2 my-sm-0" name="submit" type="submit" value="Search">
                    </div>
                </div>
            </form>
        </div>
        <div class="container-fluid">
            <div class="row">
                <% if (list != null) {%>
                <% for (VehicleDto e : list) {%>
                <div class="col-3 mb-4">
                    <div class="card" style="width: 18rem;">
                        <div id="carSlider" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner" style="height: 200px;">
                                <div class="carousel-item active">
                                    <img src="<%= e.getImg1()%>" class="d-block w-100" alt="Car 1">
                                </div>
                                <div class="carousel-item">
                                    <img src="<%= e.getImg2()%>" class="d-block w-100" alt="Car 2">
                                </div>
                                <div class="carousel-item">
                                    <img src="<%= e.getImg3()%>" class="d-block w-100" alt="Car 3">
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carSlider" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carSlider" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </a>
                        </div>
                        <div class="card-body">

                            <h5 class="card-title text-truncate"><%= e.getTitle()%></h5>

                            <p class="card-text">
                                <strong>Model:</strong> <% if(e.getModel() != null) { %> <%= e.getModel()%> <% } else { %> <i>Unknown</i> <% } %> <br>
                                <strong>Year:</strong> <% if(e.getModelYear() != null) { %> <%= e.getModelYear()%> <% } else { %> <i>Unknown</i> <% } %><br>
                                <strong>Price:</strong> <% if(e.getPrice() != null) { %> Rs. <%= e.getPrice()%> <% } else { %> <i>Unknown</i> <% } %><br>
                                <strong>Used Type:</strong> <% if(e.getUsedType() != null) { %> <%= e.getUsedType()%> <% } else { %> <i>Unknown</i> <% } %><br>
                            </p>
                            <a href="<%= e.getUrlLink()%>" target="_blank" class="btn btn-primary">View Ads</a>
                        </div>
                    </div>
                </div>
                <% } %>
                <% } else {%>
                <h2 class="text-center">Search Your Dream Car here!</h2>
                <% }%>
            </div>






        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script data-name="BMC-Widget" data-cfasync="false" src="https://cdnjs.buymeacoffee.com/1.0.0/widget.prod.min.js" data-id="sachingimhan" data-description="Support me on Buy me a coffee!" data-message="Donation" data-color="#5F7FFF" data-position="Right" data-x_margin="18" data-y_margin="18"></script>
        <script>
            $(document).ready(() => {
                $('.carousel').carousel('cycle');
                $('.dropdown-toggle').dropdown();
            });
        </script>
    </body>
</html>
