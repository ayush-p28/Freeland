<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
    <%@ include file="header.jsp" %>

    <div class="container-fluid">
        <div class="row">
            <div class="col justify-content-center">
                <div class="alert alert-success w-75 mt-5" id="mobile_otp_block">
                    <h3 class="mb-5">First step of Signup is completed<br>An OTP is sent to your mobile...</h3>
                    
                    <div>
                        <span class="text-weight-bold">Enter OTP: </span> <input class="form-control" type="text" id="otp">
                        <br>
                        <input type="button" class="btn btn-primary" id="otp_btn" value="Verify Your Mobile">
                    </div>
                </div>

                <div class="alert alert-success w-75 mt-5 d-none" id="email_otp_block">
                    <h3 class="text-weight-bold">Please Check your inbox... A verification mail is sent to your registered email address...</h3> 
                </div>
            </div>
        </div>

    </div>

    <%@ include file="footer.jsp" %>
    
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

    <script>
        const otp_btn = document.querySelector('#otp_btn');
        const otp = document.querySelector('#otp');
        const mobile_otp_block = document.querySelector('#mobile_otp_block');
        const email_otp_block = document.querySelector('#email_otp_block');

        

        
    </script>
</body>
</html>