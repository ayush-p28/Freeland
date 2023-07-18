<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Document</title>
    <script src="https://kit.fontawesome.com/08050841b9.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <style>
        @import url(//fonts.googleapis.com/css?family=Lato:300:400);

        body {
        margin:0;
        }
        .bg-color{
            background-color: #1A252F;
        }

        /* #modal_signin{
            position: relative;
            top: 50%;
            left: 50%;
            z-index: 1;
            
        } */

        h1 {
        font-family: 'Lato', sans-serif;
        font-weight:300;
        letter-spacing: 2px;
        font-size:48px;
        }
        p {
        font-family: 'Lato', sans-serif;
        letter-spacing: 1px;
        font-size:14px;
        color: #333333;
        }

        .header {
        position:relative;
        text-align:center;
        background: linear-gradient(60deg, rgba(84,58,183,1) 0%, rgba(0,172,193,1) 100%);
        color:white;
        }
        .logo {
        width:50px;
        fill:white;
        padding-right:15px;
        display:inline-block;
        vertical-align: middle;
        }

        .inner-header {
        height:65vh;
        width:100%;
        margin: 0;
        padding: 0;
        }

        .flex { /*Flexbox for containers*/
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        }

        .waves {
        position:relative;
        width: 100%;
        height:15vh;
        margin-bottom:-7px; /*Fix for safari gap*/
        min-height:100px;
        max-height:150px;
        }

        .content {
        position:relative;
        height:20vh;
        text-align:center;
        background-color: white;
        }

        /* Animation */

        .parallax > use {
        animation: move-forever 25s cubic-bezier(.55,.5,.45,.5)     infinite;
        }
        
        /*Shrinking for mobile*/
        @media (max-width: 768px) {
        .waves {
            height:40px;
            min-height:40px;
        }
        .content {
            height:30vh;
        }
        h1 {
            font-size:24px;
        }
        }
    </style>
</head>
<body>
    <%@ include file="header1.jsp" %>

    <!--Hey! This is the original version
of Simple CSS Waves-->

<div class="header">

    <!--Content before waves-->
    <div class="inner-header flex">
        
    
            <div class="row mt-5">
                <div class="card shadow px-5 pb-5 mb-3 text-dark mt-5" style="border-radius: 1rem;" id="modal_signin">
                    <form action="login.do" method="post">
                        <h2 class="font-weight-bold">SigIn</h2>

                        <div class="text-center my-2">
                            <p>Sign in with:</p>
                            <button type="button" class="btn btn-floating">
                                <i class="fa-brands fa-facebook"></i>
                            </button>
                    
                            <button type="button" class="btn btn-floating">
                              <i class="fab fa-google"></i>
                            </button>
                    
                            <button type="button" class="btn btn-floating">
                              <i class="fab fa-twitter"></i>
                            </button>
                    
                            <button type="button" class="btn btn-floating">
                              <i class="fab fa-github"></i>
                            </button>
                          </div>

                        <div class="form-group">
                            <input type="email" class="form-control form-control-lg" name="email" id="email" placeholder="Email">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control form-control-lg" name="password" id="pwd" placeholder="Password">
                        </div>
                        <button type="submit" class="btn btn-dark btn-lg btn-block">SignIn</button>
                    </form>
                    <a href="#" class="my-2">Forgot your password</a>
                    <p class="my-2">Not a member ? <a href="signup.jsp">create account</a></p>
                </div>
            </div>        
    </div>
    
    
    <!--Waves Container-->
    <div>
    <svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
    viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
    
    <g class="parallax">
    <use xlink:href="#gentle-wave" x="48" y="0" fill="rgba(255,255,255,0.7" />
    <use xlink:href="#gentle-wave" x="48" y="3" fill="rgba(255,255,255,0.5)" />
    <use xlink:href="#gentle-wave" x="48" y="5" fill="rgba(255,255,255,0.3)" />
    <use xlink:href="#gentle-wave" x="48" y="7" fill="#fff" />
    </g>
    </svg>
    </div>
    
    <!--Waves end-->
    
    </div>
    <!--Header ends-->
    
    <!--Content starts-->
    <div class="content flex">
    </div>
    <!--Content ends-->

    
    
    <%@ include file="footer1.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>