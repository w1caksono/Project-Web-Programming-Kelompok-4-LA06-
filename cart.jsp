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
    <nav class="container-fluid" style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="home.jsp">Home</a></li>
          <li class="breadcrumb-item active" aria-current="page">Cart</li>
        </ol>
      </nav>

    <div class="container-fluid d-flex justify-content-center mb-2">
        <div class="col-sm-8 mb-8" style="border: solid black;">
            <h2 class="h2 text-center mb-3"><u>Cart</u></h2>

            <table class="table">
                <thead>
                    <th></th>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Subtotal</th>
                </thead>
                <!-- LOOPING DB BUAT CART SESUAI USERNAMENYA -->
                <%
                    Connect con = Connect.getConnection();
                    int sum = 0;
                    String name = "";
                    int price = 0, qty = 0;

                    PreparedStatement prepst = con.prepareStatement("SELECT * FROM foods"
                    + " INNER JOIN cart ON foods.id = cart.food_id WHERE user_id = ?");
                    prepst.setInt(1, userid);

                    ResultSet rs = prepst.executeQuery();
                    while(rs.next()){
                        sum += rs.getInt("foods.price") * rs.getInt("cart.quantity");
                %>
                <tbody>
                    <tr>
                        <td><img src="<%=rs.getString("image")%>" alt="" style="max-width: 200px;"></td>
                        <td><%=rs.getString("foods.name")%></td>
                        <td><%=rs.getString("foods.price")%></td>
                        <td><%=rs.getString("cart.quantity")%></td>
                        <td><%=rs.getInt("foods.price") * rs.getInt("cart.quantity")%></td>
                    </tr>
                <%
                    }
                    prepst = con.prepareStatement("SELECT * FROM partywares"
                    + " INNER JOIN cart ON partywares.id = cart.card_id WHERE user_id = ?");
                    prepst.setInt(1, userid);

                    rs = prepst.executeQuery();
                    while(rs.next()){
                        sum += rs.getInt("partywares.price") * rs.getInt("cart.quantity");
                %>  
                    <tr>
                        <td><img src="<%=rs.getString("image")%>" alt="" style="max-width: 200px;"></td>
                        <td><%=rs.getString("partywares.name")%></td>
                        <td><%=rs.getString("partywares.price")%></td>
                        <td><%=rs.getString("cart.quantity")%></td>
                        <td><%=rs.getInt("partywares.price") * rs.getInt("cart.quantity")%></td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
            <div class="d-flex justify-content-end mb-5 align-items-center me-3">
                <!-- AMBIL TOTAL DARI SUM SUBTOTAL -->

                <p class="me-3"><b><%=sum%></b></p>
                <a style="background-color: #894E37;" class="btn text-white" href="checkout.jsp">Checkout</a>
            </div>
        </div>
    </div>
</body>

<%@ include file="footer.jsp"%>
</html>