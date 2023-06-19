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
        .btn-indigo {
                background-color: #6610f2;
            }

        .bg-color {
            background-color: #1A252F;
        }

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

        .inner-header {
        height:95vh;
        width:100%;
        margin: 0;
        padding: 0;
        /* z-index: -1; */
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
        z-index: 1;
        }

        /* Animation */

        .parallax > use {
        animation: move-forever 25s cubic-bezier(.55,.5,.45,.5)     infinite;
        }
        .parallax > use:nth-child(1) {
        animation-delay: -2s;
        animation-duration: 7s;
        }
        .parallax > use:nth-child(2) {
        animation-delay: -3s;
        animation-duration: 10s;
        }
        .parallax > use:nth-child(3) {
        animation-delay: -4s;
        animation-duration: 13s;
        }
        .parallax > use:nth-child(4) {
        animation-delay: -5s;
        animation-duration: 20s;
        }
        @keyframes move-forever {
        0% {
        transform: translate3d(-90px,0,0);
        }
        100% { 
            transform: translate3d(85px,0,0);
        }
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
        .rdocheck{ 
            background-color: rgb(191, 229, 191);
            border: 4px solid rgb(4, 168, 4);
        }
    </style>
</head>
<body>
    <%@ include file="header1.jsp" %>

    <!--Hey! This is the original version
of Simple CSS Waves-->

<div class="container-fluid" id="join-t">
    <div class="row mt-5 text-md-center">
        <div class="col-md-3"></div>
        <div class="col-md-6 m-5 p-4 border border-dark" style="border-radius: 20px;">
            <h2 class="p-4">Join as a client or freelancer</h2>
            <div class="row justify-content-center text-left mb-2" id="rdo_btns">
                <div class="col-md-5 border border-dark mx-2 p-4" style="border-radius: 10px;" id="client_box">
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="client" name="rdo" class="custom-control-input text-right">
                        <label class="custom-control-label" for="client">
                            <h5>
                                I&#39;m a client,
                                hiring <br>for a project
                            </h5>
                        </label>
                    </div>
                </div>
                <div class="col-md-5 border border-dark mx-2 p-4" style="border-radius: 10px;" id="free_box">
                    <div class="custom-control custom-radio custom-control-inline">
                        <input type="radio" id="free" name="rdo" class="custom-control-input text-right">
                        <label class="custom-control-label" for="free">
                            <h5>
                                I&#39;m a freelancer,<br>
                            looking for work  
                            </h5>
                        </label>
                    </div>
                </div>
            </div>

            <button class="btn btn-success m-4 px-5" id="join-type">Join Now</button>
            <p>Already have an account ? <a href="#">Login</a></p>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>

<div class="header d-none" id="join-form">

    <!--Content before waves-->
    <div class="inner-header flex" >

        
    
            <div class="row mt-5">
                <div class="card shadow px-5 pb-5 mb-3 text-dark mt-5" style="border-radius: 1rem;" id="modal_signin">
                    <form action="signup_step_1.do" method="POST" class="needs-validation">
                        <h2 class="font-weight-bold">SignUp</h2>

                        <div class="text-center my-2">
                            <p>SignUp with:</p>
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

                        <input type="hidden" name="user_type" id="user_type">

                        <div class="form-group row">
                            <label for="name" class="col-sm-4 col-form-label">Name <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control col-sm-6" id="name" name="name" required>
                        </div>
                        <div class="form-group row">
                            <label for="email" class="col-sm-4 col-form-label">Email <span class="text-danger">*</span></label>
                            <input type="email" class="form-control form-control col-sm-6" id="email" name="email" required>
                        </div>
                        <div class="form-group row">
                            <label for="password" class="col-sm-4 col-form-label">Password <span class="text-danger">*</span></label>
                            <input type="password" class="form-control form-control col-sm-6" id="password" name="password" required>
                        </div>
                        <div class="form-group row">
                            <label for="contact" class="col-sm-4 col-form-label">Contact <span class="text-danger">*</span></label>
                            <input type="text" class="form-control form-control col-sm-5" id="contact" name="contact">
                            <small type="button" class="col-sm-3 form-text text-dark d-block ml-auto" id="send_otp">Send-OTP</small>
                        </div>
                        <div class="d-none" id="input_otp_div">
                            <div class="row">
                                <label for="input_otp" class="col-md-3 col-form-label d-block">Enter-OTP:</label>
                                <div class="col-md-5 d-block">
                                    <input type="text" class="form-control" id="input_otp">
                                </div>
                                <div class="col-md-3 my-2 mt-md-0 d-block">
                                    <a class="btn btn-success btn-sm mb-md-2" id="validate_otp">validate</a>
                                </div>
                            </div>
                        </div>
                        
    
                        <small class="form-text text-success mb-3 d-none" id="otp_success">OTP Verified Successfully </small>
                        
                        <div class="g-recaptcha col mb-3" data-sitekey="6LeOkeMiAAAAADJ1HYPAUV-V_zlpYhvEP4pxBare"></div>
    
                        <button type="submit" class="btn btn-dark btn-block" id="signup_submit">Save and Continue...</button>
                    </form>
                    <a href="#" class="my-2">Forgot your password</a>
                    <p class="my-2">Already have account ? <a href="login.jsp">Login</a></p>
                </div>
            </div>        
    </div>
    
    
    <!--Waves Container-->
    <div>
    <svg class="waves" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
    viewBox="0 24 150 28" preserveAspectRatio="none" shape-rendering="auto">
    <defs>
    <path id="gentle-wave" d="M-160 44c30 0 58-18 88-18s 58 18 88 18 58-18 88-18 58 18 88 18 v44h-352z" />
    </defs>
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
    
    
    <%@ include file="footer1.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

    <script>
        const name = document.querySelector('#name');
        const email = document.querySelector('#email');
        const password = document.querySelector('#password');
        const input_otp_div = document.querySelector('#input_otp_div');
        const input_otp = document.querySelector('#input_otp');
        const send_otp = document.querySelector('#send_otp');
        const contact = document.querySelector('#contact');
        const validate_otp = document.querySelector('#validate_otp');
        const otp_success = document.querySelector('#otp_success');
        const signup_submit = document.querySelector('#signup_submit');
        const email_alert = document.querySelector('#email_alert');

        const join_type = document.querySelector('#join-type');
        const join_t = document.querySelector('#join-t');
        const join_form = document.querySelector('#join-form');
        const user_type = document.querySelector('#user_type');

        let rdo_btns = document.querySelector('#rdo_btns');
        let client = document.querySelector('#client');
        let free = document.querySelector('#free');
        let client_box = document.querySelector('#client_box');
        let free_box = document.querySelector('#free_box');

        rdo_btns.addEventListener('click',()=>{
            if(client.checked){
                free_box.classList.remove('rdocheck');
                client_box.classList.add('rdocheck');
            }
            if(free.checked){
                client_box.classList.remove('rdocheck');
                free_box.classList.add('rdocheck');
            }
            
        });
        join_type.addEventListener('click',()=>{
            join_t.classList.add('d-none');
            join_form.classList.replace('d-none','d-block');
            if(client.checked){
                user_type.value = 1;
            } else{
                user_type.value = 2;
            }
        });
    
        
        // Client Side Validation
            // mobile verification
            contact.addEventListener('keyup',()=> {
                contact.classList.add('is-invalid');
                var reg = /^[0-9]{10}$/;
                if(reg.test(contact.value)){
                    contact.classList.replace('is-invalid','is-valid');
                }
            });
    
            // email verification
            email.addEventListener('keyup',(e)=> {
                email.classList.add('is-invalid');
                var reg = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
                if(reg.test(email.value)){
                    email.classList.replace('is-invalid','is-valid');
                }
            });
    
            // password verification
            password.addEventListener('keyup',() => {
                password.classList.add('is-invalid');
                var reg = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;
                if(reg.test(password.value)){
                    password.classList.replace('is-invalid','is-valid');
                }
            });
    
    
        // OTP Validation
        const checkOTP = async () => {
            let result = await fetch('check_otp.do?otp='+input_otp.value);
            console.log("chal-gaya");
    
            return result.text();
        }
    
        validate_otp.addEventListener('click', () => {
            checkOTP().then((data)=>{
                if(data == 'true') {
                    console.log("ayush");
                    input_otp_div.classList.replace('d-block', 'd-none');
                    contact.setAttribute('readonly','readonly');
                    send_otp.classList.replace('d-block', 'd-none');
                    otp_success.classList.replace('d-none', 'd-block');
                }
            }).catch((err)=>{
                console.log(err);
            });
        });
    
        // OTP sending
        const sendOTP = async ()=>{
            console.log(contact.value);
            let result = await fetch('send_otp.do?contact='+contact.value);
            return result;
        }
    
        send_otp.addEventListener('click',()=>{
            sendOTP().then((data)=>{
                    console.log('working');
                }).catch((err)=>{
                    console.log('error');
                });
            input_otp_div.classList.replace('d-none', 'd-block');
        });
    
        // form submission
        signup_submit.addEventListener('click',()=>{
            console.log("prashu");
            email_alert.classList.replace('d-none','d-block');
        });
    </script>
</body>
</html>