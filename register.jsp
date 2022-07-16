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
    <div class="container py-5">
        <div class="row d-flex justify-content-center align-items-center">
            <div class="col-12 col-md-8 col-lg-6 col-xl-4">
                <div class="card text-black" style="border-radius: 1rem; border: solid #894E37;">
                    <div class="card-body p-5 text-center">
                        <form class="md-5 mt-md-4 pb-5" action="Controller/registerController.jsp" method="POST" >
                            <h2 class="fs-2 mb-4 text-uppercase text-white" style="background-color: #894E37;">Register</h2>

                            <div class="form-outline mb-4">
                                <input type="email" id="name" class="form-control form-control-lg" placeholder="Name" style="border-radius: 1rem"/>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="email" id="email" class="form-control form-control-lg" placeholder="Email" style="border-radius: 1rem"/>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="password" id="password" class="form-control form-control-lg" placeholder="Password" style="border-radius: 1rem"/>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="password" id="confirm-password" class="form-control form-control-lg" placeholder="Verify Password" style="border-radius: 1rem"/>
                            </div>
                            <% 
                                String param = request.getParameter("err");
                                if(param != null){
                                    int errCode = Integer.parseInt(param);
                            %>
                            <div style="color: red; text-align: center; margin-top: 1rem;">
                            <%    
                                    switch(errCode){
                                        case 1:
                                            out.print("Name must be filled");
                                            break;
                                        case 2:
                                            out.print("Name must at least 3 characters");
                                            break;
                                        case 3:
                                            out.print("Email must be filled");
                                            break;
                                        case 4:
                                            out.print("Email must contain \'@\' and \'.\'");
                                            break;
                                        case 5:
                                            out.print("Email must only contain 1 \'@\'");
                                            break;
                                        case 6:
                                            out.print("\'@\' and \'.\' must not be side by side");
                                            break;
                                        case 7:
                                            out.print("Email already used");
                                            break;
                                        case 8:
                                            out.print("Password must be filled");
                                            break;
                                        case 9:
                                            out.print("Password must at least 6 characters");
                                            break;
                                        case 10:
                                            out.print("Password must contain at least 1 alphabet");
                                            break;
                                        case 11:
                                            out.print("Password must contain at least 1 number");
                                            break;
                                        case 12:
                                            out.print("Password must be the same as confirm password");
                                            break;
                                    }
                                }
                            %>
                            </div>

                            <button class="btn btn-outline-light btn-lg px-5" type="submit" style="background-color: #894E37;">Submit</button>      
                        </form>

                        <div>
                            <p class="mb-0">Already have an account? <a href="login.jsp" class="fw-bold">Log in</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<%@ include file="footer.jsp"%>
</html>