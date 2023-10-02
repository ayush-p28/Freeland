<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Document</title>
    <link rel="stylesheet" href="static/css/edit_project.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
</head>

<body>
    <%@ include file="header1.jsp" %>

    <div class="container-fluid" id="create_project_div">
        <div class="row">
            <div class="col-md-8 mx-auto my-5 py-3 bg-light border border-secondary rounded-lg">
                <div class="row">
                    <div class="col-md-1"></div>
                    <div class="col-md-10">
                        <div>
                            <div id="step_1" class="d-block">
                                <form>
                                    <div class="form-title">
                                        <h3>Create Project</h3>
                                    </div>
                                    <input type="hidden" name="project_id" value="${param.project_id}">
                                    <div class="form-group">
                                        <label for="title">Title</label>
                                        <input type="text" class="form-control w-85" value="${param.title}" id="title" name="title">
                                        <small class="form-text text-muted">Some good example titles: <br>
                
                                            &#x2022; You will get an amazing logo designed for your business <br>
                                            &#x2022; You will get 3 hours of social media marketing consultation <br>
                                            &#x2022; You will get a revamped resume tailored to your next job <br>
                                            </small>
                                    </div>
                                    <div class="form-group">
                                        <label for="description">Project Description</label>
                                            <div class="row ml-1">
                                                <textarea name="description" id="description" cols="80" rows="5">${param.description}</textarea>
                                            </div>
                                        <small class="form-text text-muted">Enter your valid email id...</small>
                                    </div>
                                    <div class="row">
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
                                    <div class="form-group" id="tag_box">
                                        <label for="city">Tags</label>
                                        <input type="text" class="form-control" id="tag">
                                        <div id="tag_list" class="overflow-auto d-none"></div>
                
                                        <!-- <div class="chip chip-outline btn-outline-secondary" data-mdb-ripple-color="dark">
                                            Secondary
                                            <i class="close fas fa-times"></i>
                                        </div> -->
                                    </div>
                                    <input type="button" class="btn btn-secondary btn-sm" value="Save and Countinue" id="step_1_btn">
                                </form>
                            </div>
                            <div id="step_2" class="d-none">
                                <div class="form-title">
                                    <h3>Project & pricing</h3>
                                </div>
                                <form>
                                    <div class="form-group">
                                        <label for="title">Title</label>
                                        <input type="text" value="${param.ptitle}" class="form-control" id="ptitle" name="title">
                                        <small class="form-text text-muted">Enter your valid email id...</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="pdescription">Description</label>
                                        <textarea name="pdescription" value="${param.pdescription}" id="pdescription" cols="30" rows="10"></textarea>
                                        <small class="form-text text-muted">Enter your valid email id...</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="delivery">Delivery days</label>
                                        <input type="number" class="form-control" value="${param.delivery}" id="delivery" name="delivery">
                                        <small class="form-text text-muted">Enter your valid email id...</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="revisions">Number Of Revisions</label>
                                        <input type="number" class="form-control" value="${param.revisions}" id="revisions" name="revisions">
                                        <small class="form-text text-muted">Enter your valid email id...</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="price">Price</label>
                                        <input type="number" class="form-control" value="${param.price}" id="price" name="price">
                                        <small class="form-text text-muted">Enter your valid email id...</small>
                                    </div>
                                    <input type="button" class="btn btn-secondary btn-sm" value="Save and Countinue" id="step_2_btn">
                                </form>
                            </div>
                            <div id="step_3" class="d-none">
                                <form>
                                    <h3>Media</h3>
                                    <div>
                                        <label for="image_upload">Project Images</label>
                                        <small class="form-text text-muted">Upload up to 5 images (.jpg or .png), up to 1MB each</small>
                                        <div class="dropzone border border-secondary rounded-lg" id="image_upload">
                                            <div class="dz-message" data-dz-message><span>Your Custo Message</span></div>
                                        </div>                        
                                    </div>
                                    
                                    <div>
                                        <label for="image_upload">Project Demo Videos</label>
                                        <small class="form-text text-muted">Upload a 30sec mp4 video, up to 10MB</small>
                                        <div class="dropzone border border-secondary rounded-lg" id="video_upload">
                                            <div class="dz-message" data-dz-message><span>Your Custo Message</span></div>
                                        </div>                        
                                    </div>  
                                    <input type="button" class="btn btn-secondary btn-sm" value="Save and Countinue" id="step_3_btn">
                                </form>
                            </div>
                            <div id="step_4" class="d-none">
                                <h3>Review</h3>
                                <input type="button" class="btn btn-secondary btn-sm" value="Review" id="step_4_btn">
                            </div>
                            <div class="d-none" id="review">
                                <h3 id="dtitle"></h3>
                                <p>Project Details</p>
                                <p id="ddescription"></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-1"></div>
                </div>
            </div>
        </div>
    </div>
    
    
    <%@ include file="footer1.jsp" %>
    <script src="static/js/edit_poject.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>