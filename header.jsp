<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>

<body>
    <%
      Integer userid = (Integer) session.getAttribute("userId");
    %>
  <nav class="navbar navbar-expand-lg navbar-light">
    <div class="container-fluid fs-4">
      <a class="navbar-brand" href="#">
        <img src="src/Logo & Tagline/LogoBG.png" alt="" style="max-width: 100px;">
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
          <a class="nav-link" id="home" aria-current="page" href="home.jsp">Home</a>
          <a class="nav-link" id="collect" aria-current="page" href="collection.jsp">Collection</a>
          <a class="nav-link" id="partyware" aria-current="page" href="cards.jsp">Cards & Partyware</a>
          <a class="nav-link" id="contact" aria-current="page" href="#">Contact Us</a>
        </div>
      </div>
    </div>

    <div class="container-fluid d-flex justify-content-end me-2">
      <form class="me-4">
        <input class="form-control" type="search" placeholder="Search" aria-label="Search" style="border-radius: 1rem;">
      </form>
      <%
        if(userid == null){
      %>
      <a href="login.jsp">
        <img class="me-4" src="src/Icon/Person.png" alt="" style="max-width: 50px;" >
      </a>
      <%
        }else{
          %>
            <a href="home.jsp#">
              <img class="me-4" src="src/Icon/Person.png" alt="" style="max-width: 50px;" >
            </a>
          <%
        }
      %>
      <a href="cart.jsp">
        <img class="me-4" src="src/Icon/Bag.jpg" alt="" style="max-width: 30px;">
      </a>
    </div>
  </nav>
</body>
</html>