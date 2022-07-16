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

    <style>
        #collect{
            color: black;
        }
    </style>
</head>

<body>
    <%
      userid = (Integer) session.getAttribute("userId");
    %>
    <div class="container">
        
        <div class="text-center mb-5">
            <a href="collection.jsp?category" class="btn btn-success btn-lg mx-3 w-40" style="background-color: #894E37;">All Category</a>
            <a href="collection.jsp?category=sweets" class="btn btn-success btn-lg mx-3 w-40" style="background-color: #894E37;">Sweets</a>
            <a href="collection.jsp?category=cake" class="btn btn-success btn-lg mx-3 w-40" style="background-color: #894E37;">Cakes</a>
            <a href="collection.jsp?category=pastry" class="btn btn-success btn-lg mx-3 w-40" style="background-color: #894E37;">Pastries</a>
        </div>
        
        <div class="d-flex justify-content-evenly">
            <div class="container">
                <div class="row d-flex justify-content-evenly">
            <!-- LOOPING NARIK DB BUAT KUE -->
            <%
                Connect con = Connect.getConnection();

                PreparedStatement prepst = con.prepareStatement("SELECT * FROM foods"); 
                ResultSet rs = prepst.executeQuery();

                String category = request.getParameter("category");
                if(category != null && category.equals("sweets")){
                    
                    prepst = con.prepareStatement("Select * From foods WHERE category = ?");
                    prepst.setString(1, category);

                    rs = prepst.executeQuery(); 
                }else if(category != null && category.equals("pastry")){
                    
                    prepst = con.prepareStatement("Select * From foods WHERE category = ?");
                    prepst.setString(1, category);

                    rs = prepst.executeQuery(); 
                }else if(category != null && category.equals("cake")){
                    
                    prepst = con.prepareStatement("Select * From foods WHERE category = ?");
                    prepst.setString(1, category);

                    rs = prepst.executeQuery(); 
                }
                while(rs.next()){
            %>
                    <!-- LOOPING DB BUAT HASIL SEARCH -->
                    <div class="col-sm-3 mb-4">
                        <div class="card">
                            <img class="card-img-top img-fluid mb-4" style="min-height: 200px; min-width: 200px;" src="<%=rs.getString("image")%>" alt="Card image cap">
                            <div class="card-block">
                                <!-- INI HREF KE MASING-MASING DETAIL KUENYA SESUAIN AMA NAMA KUE -->
                                <a href="collectionDetail.jsp?page=<%=rs.getString("name")%>">
                                    <h4 class="card-title text-center fw-bold"><%=rs.getString("name")%></h4>
                                </a>
                            </div>
                        </div>
                    </div>
            <%
                }
            %>
                </div>
            </div>
        </div>
    </div>    
</body>

<%@ include file="footer.jsp"%>
</html>