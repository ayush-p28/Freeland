<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <title>Document</title>
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/08050841b9.js" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
            integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <style>
            .btn-indigo {
                background-color: #6610f2;
            }

            .bg-color {
                background-color: #1A252F;
            }

            #cd-title {
                /* font-size:4vw; */

            }

            #banner-bg {
                margin-top: -70px;
            }

            .bb {
                /* border: 3px solid red; */
                height: 40px;
            }

            .freelancer-heading {
                font-size: 30px;
                background: linear-gradient(to right, #AA076B 0%, #61045F 51%, #AA076B 100%);
            }

            #banner-bg {
                font: 1em/1.618 Inter, sans-serif;

                display: flex;
                align-items: center;
                justify-content: center;
                /* margin-bottom: 20px; */

                min-height: 90vh;
                /* height: 800px; */
                /* padding: 30px; */

                color: #224;
                background:
                    /* url(https://source.unsplash.com/E8Ufcyxz514/2400x1823) */
                    url(static/images/index-bn.jpeg) center / cover no-repeat;
            }

            .card1 {
                /* max-width: 1140px; */
                /* min-height: 200px; */
                display: flex;
                flex-direction: column;
                justify-content: space-between;

                /* max-width: 1140px; */
                /* height: 400px; */
                padding: 35px;

                border: 1px solid rgba(255, 255, 255, .25);
                border-radius: 20px;
                background-color: rgba(255, 255, 255, 0.45);
                box-shadow: 0 0 10px 1px rgba(0, 0, 0, 0.25);

                backdrop-filter: blur(15px);
            }



            .profile-card-2 {
                /* max-width: 300px; */

                background-color: #FFF;
                box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.1);
                background-position: center;
                overflow: hidden;
                position: relative;
                margin: 10px auto;
                cursor: pointer;
                border-radius: 10px;
            }

            .profile-card-2 img {
                object-fit: cover;
                /* height: 345px; */
                width: 100%;
                transition: all linear 0.25s;
            }

            .profile-card-2:hover img {
                transform: rotate(5deg) scale(1.1, 1.1);
                filter: brightness(110%);
            }

            .profile-name {
                position: absolute;
                left: 30px;
                top: 50px;
                font-size: 30px;
                color: #FFF;
                text-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5);
                font-weight: bold;
                transition: all linear 0.25s;
            }

            .profile-name-2 {
                position: absolute;
                left: 30px;
                top: 30px;
                font-size: 20px;
                color: #FFF;
                text-shadow: 0px 0px 20px rgba(0, 0, 0, 0.5);
                /* font-weight: bold; */
                transition: all linear 0.25s;
            }
        </style>
    </head>

    <body>
        <%@ include file="header1.jsp" %>

            <div class='alert alert-primary alert-dismissible fade show d-none' role='alert' id='email_alert'>
                <strong>Activate Email!</strong> account created successfully check your mail.
                <button type='button' class='close' data-dismiss='alert' aria-label='Close'>
                    <span aria-hidden='true'>&times;</span>
                </button>
            </div>


            <div class="container-fluid mt-5">
                <div class="row" id="banner-bg">
                    <div class="card1 m-5 col-md-10">
                        <div class="row">
                            <div class="col-md-5">
                                <p class="h2 pl-2 font-weight-bold text-uppercase">Hire Top <br>
                                <h2
                                    class="btn btn-lg freelancer-heading text-white font-weight-bold px-5 text-uppercase">
                                    Freelancers</h2>
                                </p>
                                <p class="mb-4">Access the top 1% of talent on <strong>FreeWala</strong>, and a full
                                    suite of hybrid workforce management tools. This is how innovation works now.</p>
                                <div class="btn btn-outline-dark btn-lg mt-1">Get Started</div>
                            </div>
                            <div class="col-md-1"></div>
                            <div class="col-md-5 order-first order-md-last pb-4 pb-md-0 d-md-block">
                                <!-- <img src="static/images/Picture1.png" height="400px" alt=""> -->
                                <!-- <img src="static/images/output-onlinegiftools.gif" height="400px" alt=""> -->
                                <img src="static/images/banner_img.gif" class="img-fluid" style="border-radius: 20px;"
                                    alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <section class="pt-4">
                <div class="container px-lg-5">
                    <h4 class="text-center"><strong>Popular professional services</strong></h4>
                    <hr>
                    <div class="row gx-lg-5">
                        <div class="col-md-3">
                            <div class="profile-card-2"><img
                                    src="https://fiverr-res.cloudinary.com/q_auto,f_auto,w_255,dpr_2.0/v1/attachments/generic_asset/asset/055f758c1f5b3a1ab38c047dce553860-1598561741678/logo-design-2x.png"
                                    class="img img-responsive">
                                <div class="profile-name-2">Build Your Brand</div>
                                <div class="profile-name uppercase">Logo design</div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="profile-card-2"><img
                                    src="https://fiverr-res.cloudinary.com/q_auto,f_auto,w_255,dpr_2.0/v1/attachments/generic_asset/asset/ae11e2d45410b0eded7fba0e46b09dbd-1598561917003/wordpress-2x.png"
                                    class="img img-responsive">
                                <div class="profile-name-2">Customize Your Site</div>
                                <div class="profile-name uppercase">Web design</div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="profile-card-2"><img
                                    src="https://fiverr-res.cloudinary.com/q_auto,f_auto,w_255,dpr_2.0/v1/attachments/generic_asset/asset/055f758c1f5b3a1ab38c047dce553860-1598561741663/animated-explainer-2x.png"
                                    class="img img-responsive">
                                <div class="profile-name-2">Colour Your Dreams</div>
                                <div class="profile-name uppercase">Illustration</div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="profile-card-2"><img
                                    src="https://fiverr-res.cloudinary.com/q_auto,f_auto,w_255,dpr_2.0/v1/attachments/generic_asset/asset/055f758c1f5b3a1ab38c047dce553860-1598561741678/book-covers-2x.png"
                                    class="img img-responsive">
                                <div class="profile-name-2">Showcase Your Story</div>
                                <div class="profile-name uppercase">Book Covers</div>
                            </div>
                        </div>
                    </div>
                    <!-- <div class="row gx-lg-5"> -->
                    <!-- </div> -->
                </div>
            </section>


            <section class="pt-4">
                <div class="container px-lg-5">
                    <div class="row gx-lg-5 py-3 my-3 alert alert-success">
                        <div class="col-md-6">
                            <div class="col-15-xs col-7-md selling-text">
                                <h2>A whole world of freelance talent at your fingertips</h2>
                                <ul>
                                    <li>
                                        <h6><span class="mr-1"
                                                style="width: 24px; height: 24px; fill: rgb(122, 125, 133);"><svg
                                                    width="16" height="16" viewBox="0 0 16 16"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                        d="M8 1.75C4.54822 1.75 1.75 4.54822 1.75 8C1.75 11.4518 4.54822 14.25 8 14.25C11.4518 14.25 14.25 11.4518 14.25 8C14.25 4.54822 11.4518 1.75 8 1.75ZM0.25 8C0.25 3.71979 3.71979 0.25 8 0.25C12.2802 0.25 15.75 3.71979 15.75 8C15.75 12.2802 12.2802 15.75 8 15.75C3.71979 15.75 0.25 12.2802 0.25 8Z">
                                                    </path>
                                                    <path
                                                        d="M11.5303 5.46967C11.8232 5.76256 11.8232 6.23744 11.5303 6.53033L7.53033 10.5303C7.23744 10.8232 6.76256 10.8232 6.46967 10.5303L4.46967 8.53033C4.17678 8.23744 4.17678 7.76256 4.46967 7.46967C4.76256 7.17678 5.23744 7.17678 5.53033 7.46967L7 8.93934L10.4697 5.46967C10.7626 5.17678 11.2374 5.17678 11.5303 5.46967Z">
                                                    </path>
                                                </svg></span>The best for every budget</h6>
                                        <p class="tbody-4">Find high-quality services at every price point. No hourly
                                            rates, just project-based pricing.</p>
                                    </li>
                                    <li>
                                        <h6><span class="mr-1"
                                                style="width: 24px; height: 24px; fill: rgb(122, 125, 133);"><svg
                                                    width="16" height="16" viewBox="0 0 16 16"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                        d="M8 1.75C4.54822 1.75 1.75 4.54822 1.75 8C1.75 11.4518 4.54822 14.25 8 14.25C11.4518 14.25 14.25 11.4518 14.25 8C14.25 4.54822 11.4518 1.75 8 1.75ZM0.25 8C0.25 3.71979 3.71979 0.25 8 0.25C12.2802 0.25 15.75 3.71979 15.75 8C15.75 12.2802 12.2802 15.75 8 15.75C3.71979 15.75 0.25 12.2802 0.25 8Z">
                                                    </path>
                                                    <path
                                                        d="M11.5303 5.46967C11.8232 5.76256 11.8232 6.23744 11.5303 6.53033L7.53033 10.5303C7.23744 10.8232 6.76256 10.8232 6.46967 10.5303L4.46967 8.53033C4.17678 8.23744 4.17678 7.76256 4.46967 7.46967C4.76256 7.17678 5.23744 7.17678 5.53033 7.46967L7 8.93934L10.4697 5.46967C10.7626 5.17678 11.2374 5.17678 11.5303 5.46967Z">
                                                    </path>
                                                </svg></span>Quality work done quickly</h6>
                                        <p class="tbody-4">Find the right freelancer to begin working on your project
                                            within minutes.</p>
                                    </li>
                                    <li>
                                        <h6><span class="mr-1"
                                                style="width: 24px; height: 24px; fill: rgb(122, 125, 133);"><svg
                                                    width="16" height="16" viewBox="0 0 16 16"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                        d="M8 1.75C4.54822 1.75 1.75 4.54822 1.75 8C1.75 11.4518 4.54822 14.25 8 14.25C11.4518 14.25 14.25 11.4518 14.25 8C14.25 4.54822 11.4518 1.75 8 1.75ZM0.25 8C0.25 3.71979 3.71979 0.25 8 0.25C12.2802 0.25 15.75 3.71979 15.75 8C15.75 12.2802 12.2802 15.75 8 15.75C3.71979 15.75 0.25 12.2802 0.25 8Z">
                                                    </path>
                                                    <path
                                                        d="M11.5303 5.46967C11.8232 5.76256 11.8232 6.23744 11.5303 6.53033L7.53033 10.5303C7.23744 10.8232 6.76256 10.8232 6.46967 10.5303L4.46967 8.53033C4.17678 8.23744 4.17678 7.76256 4.46967 7.46967C4.76256 7.17678 5.23744 7.17678 5.53033 7.46967L7 8.93934L10.4697 5.46967C10.7626 5.17678 11.2374 5.17678 11.5303 5.46967Z">
                                                    </path>
                                                </svg></span>Protected payments, every time</h6>
                                        <p class="tbody-4">Always know what you'll pay upfront. Your payment isn't
                                            released until you approve the work.</p>
                                    </li>
                                    <li>
                                        <h6><span class="mr-1"
                                                style="width: 24px; height: 24px; fill: rgb(122, 125, 133);"><svg
                                                    width="16" height="16" viewBox="0 0 16 16"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                        d="M8 1.75C4.54822 1.75 1.75 4.54822 1.75 8C1.75 11.4518 4.54822 14.25 8 14.25C11.4518 14.25 14.25 11.4518 14.25 8C14.25 4.54822 11.4518 1.75 8 1.75ZM0.25 8C0.25 3.71979 3.71979 0.25 8 0.25C12.2802 0.25 15.75 3.71979 15.75 8C15.75 12.2802 12.2802 15.75 8 15.75C3.71979 15.75 0.25 12.2802 0.25 8Z">
                                                    </path>
                                                    <path
                                                        d="M11.5303 5.46967C11.8232 5.76256 11.8232 6.23744 11.5303 6.53033L7.53033 10.5303C7.23744 10.8232 6.76256 10.8232 6.46967 10.5303L4.46967 8.53033C4.17678 8.23744 4.17678 7.76256 4.46967 7.46967C4.76256 7.17678 5.23744 7.17678 5.53033 7.46967L7 8.93934L10.4697 5.46967C10.7626 5.17678 11.2374 5.17678 11.5303 5.46967Z">
                                                    </path>
                                                </svg></span>24/7 support</h6>
                                        <p class="tbody-4">Questions? Our round-the-clock support team is available to
                                            help anytime, anywhere.</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6 my-auto">
                            <img src="static/images/undraw_working_re_ddwy.svg" class="w-100" alt="">
                        </div>

                    </div>
                </div>
            </section>

            <!-- index page featurings-->
            <section class="pt-4">
                <div class="container px-lg-5">
                    <!-- Cards -->
                    <div class="row gx-lg-5">
                        <div class="col-lg-4 col-xxl-4 mb-4">
                            <div class="card bg-light border-0 h-100">
                                <div class="card-body text-center p-4 p-lg-5 py-2 pt-lg-0">
                                    <!-- <div class="d-inline-flex p-4 justify-content-center align-items-center bg-primary bg-gradient text-white border border-secondary rounded-lg"
                                        ><i class="fa-solid fa-rocket" style="font-size: 20px;"></i></div> -->
                                    <h2 class="fs-3 fw-bold">Responsive Design</h2>
                                    <p class="mb-0">Lorem ipsum dolor sinatus quod sunt repudiandae, dolores dicta? Non,
                                        natus? Sequi quae eum non soluta.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-xxl-4 mb-4">
                            <div class="card bg-light border-0 h-100">
                                <div class="card-body text-center  p-4 p-lg-5 py-2 pt-lg-0">
                                    <!-- <div class="d-inline-flex p-4 justify-content-center align-items-center bg-primary bg-gradient text-white border border-secondary rounded-lg"
                                        ><i class="fa-regular fa-object-group" style="font-size: 30px;"></i></div> -->
                                    <h2 class="fs-4 fw-bold">Fresh Easy Layout</h2>
                                    <p class="mb-0">Lorem ipsum dolor sinatus quod sunt repudiandae, dolores dicta? Non,
                                        natus? Sequi quae eum non soluta.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-xxl-4 mb-4">
                            <div class="card bg-light border-0 h-100">
                                <div class="card-body text-center  p-2 p-lg-5 py-2 pt-lg-0">
                                    <!-- <div class="d-inline-flex p-4 justify-content-center align-items-center bg-primary bg-gradient text-white border border-secondary rounded-lg"
                                        ><i class="fa-solid fa-code" style="font-size: 30px;"></i></div> -->
                                    <h2 class="fs-4 fw-bold">Simple Clean Code</h2>
                                    <p class="mb-0">Lorem ipsum dolor sinatus quod sunt repudiandae, dolores dicta? Non,
                                        natus? Sequi quae eum non soluta.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>


            <%@ include file="footer1.jsp" %>

                <script>
                    const emailAlert = document.querySelector('#email_alert');
                    if ("${requestScope.email_activation}" == "Ayush") {
                        emailAlert.classList.replace('d-none', 'd-block');
                        console.log("Ayush");
                    }
                </script>

                <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                    integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
                    integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
                    crossorigin="anonymous"></script>
    </body>

    </html>