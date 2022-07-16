<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bread Pat's</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <%@ include file="header.jsp"%>

    <style>
        #home{
            color: black;
        }
    </style>
</head>

<body>
    <%
      userid = (Integer) session.getAttribute("userId");
    %>
    <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="10000">
                <img src="src/Logo & Tagline/Carousel 1.jpg" class="d-block w-100" alt="..." style="max-height: 600px;">
            </div>
            <div class="carousel-item" data-bs-interval="2000">
                <img src="src/Logo & Tagline/Carousel 2.jpeg" class="d-block w-100" alt="..." style="max-height: 600px;">
            </div>
            <!-- <div class="carousel-item">
                <img src="..." class="d-block w-100" alt="...">
            </div> -->
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <img class="img-fluid mx-auto" src="src/Logo & Tagline/Day/Day_FlowerLine.png" alt="" style="max-width: 35%;">

    <div class="mb-5">
        <div class="text-center mb-4">
            <h2 class="h2"><u>Featured Product</u></h2>
        </div>

        <div class="container">
            <div class="row d-flex justify-content-evenly">
                <!-- LOOPING DB BUAT HASIL SEARCH -->
                <div class="col-sm-4">
                    <div class="card">
                        <img class="card-img-top img-fluid mx-auto d-block mb-3" src="src/Product/Kue/Cake/ChocoVanillaCake.png" alt="Card image cap" style="max-width: 300px;">
                        <div class="card-block">
                            <h4 class="card-title text-center h4">Choco Vanilla Cake</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div>
        <div class="text-center mb-4">
            <h2 class="h2"><u>Collection</u></h2>
        </div>

        <div class="container mb-5">
            <div class="row d-flex justify-content-evenly">
                <!-- LOOPING DB BUAT HASIL SEARCH -->
                <div class="col-sm-4">
                    <div class="card">
                        <img class="card-img-top img-fluid mx-auto d-block mb-3" src="src/Product/Kue/Sweet/SweetandSour.png" alt="Card image cap" style="max-width: 300px;">
                        <div class="card-block">
                            <a href="collection.jsp?category=sweets">
                                <h4 class="card-title text-center h4">Sweets</h4>
                            </a>
                        </div>
                    </div>
                </div>
                
                <div class="col-sm-4">
                    <div class="card">
                        <img class="card-img-top img-fluid mx-auto d-block mb-3" src="src/Product/Kue/Cake/RoseCake.png" alt="Card image cap" style="max-width: 300px;">
                        <div class="card-block">
                            <a href="collection.jsp?category=cake">
                                <h4 class="card-title text-center h4">Cake</h4>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="card">
                        <img class="card-img-top img-fluid mx-auto d-block mb-3" src="src/Product/Kue/Pastry/BerryMuffin.png" alt="Card image cap" style="max-width: 300px;">
                        <div class="card-block">
                            <a href="collection.jsp?category=pastry">
                                <h4 class="card-title text-center h4">Pastry</h4>
                            </a>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</body>

<%@ include file="footer.jsp"%>
</html>