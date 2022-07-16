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
    <img class="img-fluid mx-auto" src="src/Logo & Tagline/Day/Day_FlowerLine.png" alt="" style="max-width: 35%;">

    <div class="mx-5">
        <div class="text-center mb-4">
            <h2 class="h2"><u>Search Result</u></h2>
            <p><small>Show result of "DB buat searching keyword"</small></p>
        </div>

        <div class="container">
            <div class="row d-flex justify-content-evenly">
                <!-- LOOPING DB BUAT HASIL SEARCH -->
                <div class="col-sm-3">
                    <div class="card">
                        <img class="card-img-top img-fluid" src="src/Product/Kue/Cake/ChocoVanillaCake.png" alt="Card image cap">
                        <div class="card-block">
                            <h4 class="card-title text-center">Nama Kue</h4>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
</body>

<%@ include file="footer.jsp"%>
</html>