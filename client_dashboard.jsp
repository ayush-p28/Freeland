<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <!-- <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://kit.fontawesome.com/08050841b9.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous"> -->

        <!-- <link href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/toasty.css" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
         -->
        <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
            integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous"> -->
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
            <script src="https://kit.fontawesome.com/08050841b9.js" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        
            <link href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/toasty.css" rel="stylesheet" />
            
            <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
            
        
    </head>

    <body>

        <%@ include file="header1.jsp" %>

        <input type="hidden" name="current_post" id="current_post">


            <div class="container-fluid bg-light">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div class="row m-4 bg-white border border-black" style="border-radius: 20px;">
                            <div class="col">
                                <button class="btn btn-dark shadow float-right px-4 my-4" id="create_post">Post A
                                    Job</button>
                                <div class="p-3 my-2 clearfix">
                                    <h3>Hello,</h3>
                                    <p class="lead text-uppercase font-weight-bold">GoodEvening, ${user.name} </p>
                                </div>
                            </div>
                        </div>
                        <div class="row justify-content-center m-4 bg-white p-4 border border-black" id="posts_block" style="border-radius: 20px;">
                            <div class="col mt-2 p-2 d-none">
                                <h2 class="">Your Postings.</h2>
                                <!-- <p class="text-muted p-2">This helps your job post stand out to the right candidates. It’s the first thing they’ll see, so make it count!</p> -->
                            </div>
                            
                            <c:forEach var="all_post" items="${posts}" varStatus="x">

                                <div class="col-md-10 my-2 card">

                                    <input type="hidden" class="so" name="count" value="${x.count}">
                                    <input type="hidden" class="so" id="post_id_${x.count}" value="${all_post.postId}">
                                    <input type="hidden" class="so" id="subcategory_id_${x.count}" value="${all_post.subcategory.subcategoryId}">
                                    <input type="hidden" class="so" id="category_id_${x.count}" value="${all_post.subcategory.category.categoryId}">
                                    <input type="hidden" class="so" id="name_${x.count}" value="${all_post.name}">
                                    <input type="hidden" class="so" id="description_${x.count}" value="${all_post.description}">
                                    <input type="hidden" class="so" id="date_${x.count}" value="${all_post.date}">
                                    <input type="hidden" class="so" id="deadline_${x.count}" value="${all_post.deadline}">
                                    <input type="hidden" class="so" id="user_id_${x.count}" value="${all_post.user.userId}">
                                    <input type="hidden" class="so" id="post_status_id_${x.count}" value="${all_post.postStatus.postStatusId}">
                                    
                                    <div class="card-body">
                                      <h5 class="card-title">${all_post.name}
                                          <button class="btn float-right" id="butn_${x.count}" onclick="edit('${x.count}')"><i class="fa-solid fa-pen-to-square"></i></button>
                                      </h5>
                                      
                                      <p class="card-text mini_desc">${all_post.description}</p>
                                    </div>
                                </div>

                            </c:forEach>
                            

                        </div>
                            

                        <div class="row m-4 bg-white p-5 border border-black d-none" id="step1"
                            style="border-radius: 20px;">
                            <div class="col-md-5 mr-2 p-4" id="side_border">
                                <h2 class="m-2">Let's start with a strong title.</h2>
                                <p class="text-muted p-2">This helps your job post stand out to the right candidates.
                                    It’s the first thing they’ll see, so make it count!</p>
                            </div>
                            <div class="col-md-6 ml-2 p-4">
                                <div class="form-group">
                                    <label for="title" class="font-weight-bold">Write a title for your job post
                                    </label>
                                    <input type="text" class="form-control form-control-lg" name="title" id="title">
                                    <small class="form-text text-muted p-2">Some good example titles: <br>

                                        &#x2022; Build responsive WordPress site with booking/payment functionality <br>
                                        &#x2022; Graphic designer needed to design ad creative for multiple campaigns
                                        <br>
                                        &#x2022; Facebook ad specialist needed for product launch <br>
                                    </small>
                                </div>
                                <div class="form-group">
                                    <label for="description" class="font-weight-bold">Describe your Job
                                    </label>
                                    <!-- <input type="text" class="form-control form-control-lg" name="title" id="title"> -->
                                    <textarea class="form-control" name="description" id="description" rows="5"></textarea>
                                    <small>This is how talent figures out what you need and why your great to work with!</small>
                                </div>
                                <div class="row mt-5">
                                    <div class="form-group col-md-5" id="category_box">
                                        <label for="category">Category</label>
                                        <input type="text" class="form-control" name="category" id="category">
                                        <div id="category_list" class="overflow-auto d-none"></div>
                                    </div>
                                    <div class="form-group col-md-5" id="subcategory_box">
                                        <label for="subcategory">Subcategory</label>
                                        <input type="text" class="form-control" id="subcategory">
                                        <div id="subcategory_list" class="overflow-auto d-none"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="ml-auto">
                                <button type="button" class="btn btn-outline-dark mt-auto">Back</button>
                                <button type="button" class="btn btn-outline-success mt-auto px-5"
                                    id="step1_btn">Next</button>
                            </div>
                        </div>

                        <div class="row m-4 bg-white p-5 border border-black d-none" id="step2"
                            style="border-radius: 20px;">
                            <div class="col-md-5 mr-2 p-4" id="side_border">
                                <h2 class="m-2">What are the main skills required for your work?</h2>
                                <p class="text-muted p-2">This helps your job post stand out to the right candidates.
                                    With these tags your projects reaches to the relevat freelancers. It’s the first
                                    thing they’ll see, so make it count!</p>
                            </div>
                            <div class="col-md-6 ml-2 p-4">

                                <div class="form-group">
                                    <label for="tag" class="font-weight-bold">Search or add up to 10 skills
                                    </label>
                                    <input type="text" class="form-control form-control-lg" id="tag">
                                    <div id="tag_list" class="overflow-auto d-none"></div>
                                    <div id="tag_box"></div>
                                    <small class="form-text text-muted p-2">For the best results, add 3-5 skills
                                    </small>
                                </div>

                            </div>

                            <div class="ml-auto">
                                <button type="button" class="btn btn-outline-dark mt-auto">Back</button>
                                <button type="button" class="btn btn-outline-success mt-auto px-5"
                                    id="step2_btn">Next</button>
                            </div>
                        </div>

                        <div class="row m-4 bg-white p-5 border border-black d-none" id="step3"
                            style="border-radius: 20px;">
                            <div class="col-md-5 mr-2 p-4" id="side_border">
                                <h2 class="m-2">Next, estimate the scope of your work?</h2>
                                <p class="text-muted p-2">These aren’t final answers, but this information helps us
                                    recommend the right talent for what you need!</p>
                            </div>
                            <div class="col-md-6 ml-2 p-4">


                                <div>
                                    <p class="font-weight-bold">How long will your work take?</p>
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="mth_six" name="rdos"
                                            class="custom-control-input text-right">
                                        <label class="custom-control-label" for="mth_six">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3 to 6 months</label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="mth_three" name="rdos"
                                            class="custom-control-input text-right">
                                        <label class="custom-control-label" for="mth_three">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1 to 3 months</label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="mth_one" name="rdos"
                                            class="custom-control-input text-right">
                                        <label class="custom-control-label" for="mth_one">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1 or less than 1 month</label>
                                    </div>
                                </div>

                                <div class="mt-4">
                                    <p class="font-weight-bold">What level of experience will it need?</p>
                                    <div class="custom-control custom-radio mb-1">
                                        <input type="radio" id="beginner" name="experience"
                                            class="custom-control-input text-right">
                                        <label class="custom-control-label" for="beginner">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Beginner<br>
                                            <small class="text-muted">Looking for someone relatively new to this
                                                field</small>
                                        </label>
                                    </div>
                                    <div class="custom-control custom-radio mb-1">
                                        <input type="radio" id="intermediate" name="experience"
                                            class="custom-control-input text-right">
                                        <label class="custom-control-label" for="intermediate">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Intermediate <br>
                                            <small class="text-muted">Looking for substantial experience in this
                                                field</small>
                                        </label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="advanced" name="experience"
                                            class="custom-control-input text-right">
                                        <label class="custom-control-label" for="advanced">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Advanced<br>
                                            <small class="text-muted">Looking for comprehensive and deep expertise in
                                                this field</small>
                                        </label>
                                    </div>
                                </div>
                                <div class="mt-4">
                                    <p class="font-weight-bold">Is this job a contract-to-hire opportunity?</p>
                                    <small class="text-muted">This means you'll start with a contract, and may later
                                        explore a full-time option with the talent. Your answer helps us better support
                                        your hiring needs.</small>
                                    <div class="custom-control custom-radio mb-1">
                                        <input type="radio" id="yes" name="contra-to-hire"
                                            class="custom-control-input text-right">
                                        <label class="custom-control-label" for="yes"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Yes <br>
                                        </label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <input type="radio" id="no" name="contra-to-hire"
                                            class="custom-control-input text-right">
                                        <label class="custom-control-label" for="no">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;No<br>
                                        </label>
                                    </div>
                                </div>

                            </div>

                            <div class="ml-auto">
                                <button type="button" class="btn btn-outline-dark mt-auto">Back</button>
                                <button type="button" class="btn btn-outline-success mt-auto px-5"
                                    id="step3_btn">Next</button>
                            </div>
                        </div>

                        <div class="row m-4 bg-white p-5 border border-black d-none" id="step4"
                            style="border-radius: 20px;">
                            <div class="col-md-5 mr-2 p-4" id="side_border">
                                <h2 class="m-2">Tell us about your budget.?</h2>
                                <p class="text-muted p-2">This will help us match you to talent within your range.</p>
                            </div>
                            <div class="col-md-6 ml-2 p-4">
                                <div>
                                    <div class="row form-inline form-group">
                                        <div class="col-sm-4 my-1">
                                            <label for="" style="margin-left: -50px;">From:-</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend" id="gg">
                                                    <div class="input-group-text">&#8377</div>
                                                </div>
                                                <input type="text" class="form-control" id="budget-to" placeholder="">
                                                <span class="ml-1 col-form-label input-group-addon">/hour</span>
                                            </div>
                                        </div>
                                        <div class="col-sm-4 my-1">
                                            <label for="budget-to" style="margin-left: -50px;">To:-</label>
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <div class="input-group-text">&#8377</div>
                                                </div>
                                                <input type="text" class="form-control" id="budget-to" placeholder="">
                                                <span class="ml-1 col-form-label input-group-addon">/hour</span>
                                            </div>
                                        </div>
                                    </div>
                                    <small class="form-text text-muted p-2">Professionals tend to charge $10.00 - $25.00
                                        /hour (USD) for graphic design projects like yours. Experts may charge higher
                                        rates. </small>
                                </div>
                            </div>

                            <div class="ml-auto">
                                <button type="button" class="btn btn-outline-dark mt-auto">Back</button>
                                <button type="button" class="btn btn-outline-success mt-auto px-5"
                                    id="step4_btn">Next</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
            <!-- data-role="tagsinput" -->
        <%@ page import="java.util.ArrayList" %>
        <% ArrayList<Integer> updateTags = new ArrayList<Integer>(); %>
        <% session.setAttribute("post_tagz",updateTags); %>
        <!-- <select multiple /> -->

            <%@ include file="footer1.jsp" %>
            
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
            <script src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/toasty.js"></script>
             
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    </body>
    </html>