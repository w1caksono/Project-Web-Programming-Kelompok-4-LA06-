<%@ include file="./Controller/connect.jsp"%>

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
</head>

<body>
    <%
      userid = (Integer) session.getAttribute("userId");
    %>
    <div class="container-fluid">
        <div class="text-center mb-6">
            <a href="collection.jsp" class="btn btn-success btn-lg mx-3 w-40" style="background-color: #894E37;">All Category</a>
            <a href="collection.jsp?category=sweets" class="btn btn-success btn-lg mx-3 w-40" style="background-color: #894E37;">Sweets</a>
            <a href="collection.jsp?category=cake" class="btn btn-success btn-lg mx-3 w-40" style="background-color: #894E37;">Cakes</a>
            <a href="collection.jsp?category=pastry" class="btn btn-success btn-lg mx-3 w-40" style="background-color: #894E37;">Pastries</a>
        </div>
        
        <div class="d-flex align-items-center flex-column">
            <!-- LOOPING NARIK DB BUAT KUE -->
            <div class="card mb-3" style="max-width: 800px;">
                <div class="row g-0">
                    <%
                        Connect con = Connect.getConnection();

                        String name = request.getParameter("page");
                        PreparedStatement prepst = con.prepareStatement("SELECT * FROM foods WHERE name = ?");
                        prepst.setString(1, name); 
                        
                        ResultSet rs = prepst.executeQuery();

                        if(rs.next()){
                    %>

                    <div class="col-md-4">
                        <img src="<%=rs.getString("image")%>" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                        <form action="Controller/collectionDetail.jsp?page<%=name%>" method="POST" >
                            <div class="card-body">
                                <h5 class="card-title"><u><%=name%></u></h5>
                                <p class="card-text mb-3"><%=rs.getString("description")%></p>
                                <label for="">Quantity</label>
                                <input type="number" name="qty" class="mb-3" style="width: 70px;" required>
                                <div class="d-flex align-items-center">
                                    <button class="btn text-white me-3" style="background-color: #894E37;">Add to Cart</button>
                                    <input type="hidden" name="user_id" value="<%= userid %>">
                                    <input type="hidden" name="page" value="<%= name %>">
                                    <h2><b>Rp. <%=rs.getInt("price")%></b></h2>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>    
</body>

<%@ include file="footer.jsp"%>
</html>