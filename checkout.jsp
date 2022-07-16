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
    <div class="d-flex">
        <div class="col-sm-6 mb-6 mx-5">
            <h4 class="h4"><u>Billing Details</u></h4>
    
            <div class="row">
                <div class="col-sm-6 mb-6">
                    <input class="form-rounded" type="text" name="" value="Name" style="border-radius: 1rem; width: 20pc;">
                </div>
    
                <div class="col-sm-6 mb-6">
                    <input class="form-rounded" type="text" name="" value="Email" style="border-radius: 1rem; width: 20pc;">
                </div>
    
                <div class="col-sm-6 mb-6">
                    <input class="form-rounded" type="text" name="" value="Address" style="border-radius: 1rem; width: 20pc;">
                </div>
    
                <div class="col-sm-6 mb-6">
                    <input class="form-rounded" type="text" name="" value="Phone Number" style="border-radius: 1rem; width: 20pc;">
                </div>
    
                <div class="col-sm-6 mb-6">
                    <input class="form-rounded" type="text" name="" value="Town/City" style="border-radius: 1rem; width: 20pc;">
                </div>
    
                <div class="col-sm-6 mb-6">
                    <input class="form-rounded" type="text" name="" value="ZIP Code" style="border-radius: 1rem; width: 20pc;">
                </div>
            </div>

            <p><b>Payment Methods</b></p>
            <div>
                <input class="me-1" type="radio" name="payment" value="card">
                <label class="me-4" for="">Debit/Credit Card</label>
                <input class="me-1" type="radio" name="payment" value="emoney">
                <label class="me-4" for="">E-Money (Gopay, OVO, DANA)</label>
            </div>
        </div>
    
        <div class="col-sm-6 mb-6">
            <div class="col-sm-8 mb-8" style="border: solid black;">
                <h3 class="h3 text-center mb-3"><u>Your Order</u></h3>
            </div>
        </div>
    </div>
</body>

<%@ include file="footer.jsp"%>
</html>