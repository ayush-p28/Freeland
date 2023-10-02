<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Document</title>
    <script src="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone-min.js"></script>
    <!-- <script src="user_posts1.js"></script> -->
    <script src="https://kit.fontawesome.com/08050841b9.js" crossorigin="anonymous"></script>
    <link href="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <!-- for tags -->
    <link rel="https://cdn.jsdelivr.net/bootstrap.tagsinput/0.8.0/bootstrap-tagsinput.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bootstrap.tagsinput/0.8.0/bootstrap-tagsinput.min.js"></script>

    <link href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/toasty.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
           
    
<style>
        .btn-indigo{
            background-color: #6610f2;
        }
        .bg-color{
            background-color: #1A252F;
        }
        #category_list {
            position: absolute;
            top: 68px;
            left: 13px;
            z-index: 1;
            height: 200px;
            border: 2px solid #999;
            background-color: white;
        }

        #category_box {
            position: relative;
        }

        #subcategory_list {
            position: absolute;
            top: 68px;
            left: 40px;
            z-index: 1;
            height: 200px;
            border: 2px solid #999;
            background-color: white;
        }

        #subcategory_box {
            position: relative;
        }

        .cat_rec {
            font-size: 15px;
            /* font-weight: bold; */
            font-family: verdana;
            padding: 6px 15px;
            cursor: pointer; 
        }

        .cat_rec:hover {
            background-color: #eee;
        }

        .label-info{
            background-color: #6610f2;
            color:#eee;
        }
        .toast{transition: 0.32s all ease-in-out}
        .toast-container--fade{right: 0;top: 0}
        .toast-container--fade 
        .toast-wrapper{display: inline-block}
        .toast
        .fade-init{opacity: 0}
        .toast
        .fade-show{opacity: 1}
        .toast
        .fade-hide{opacity: 0}
        /* body{
            background-color: #E9ECEF;
        }
        .gpbtn{
            background-color: #386BC0;
        } */
    </style>
</head>

<body>
    <%@ include file="header1.jsp" %>


    <nav>
        <div id="dlt_alert" class="alert alert-danger d-none">
            This alert will automatically 
            close in 5 seconds.
        </div>
        <ol class="breadcrumb bg-white">
          <li class="breadcrumb-item"><a href="http://localhost:8080/FreeLand/index.jsp">Home</a></li>
          <li class="breadcrumb-item"><a href="user_dashboard.jsp">DashBoard</a></li>
          <li class="breadcrumb-item active">projects</li>
        </ol>
        <hr>
      </nav>
      

    <div class="container-fluid">

        <div class="row">
            <div class="col-md">
                <nav class="nav">
                    

                    <a class="btn btn-dark shadow ml-auto text-light" id="create_project">Create Project</a>
                </nav>
            </div>
        </div> 

        <input type="hidden" name="current_project" id="current_project">
        
        <div class="container-fluid py-3" id="show_projects">
            <div class="row">
                    <c:forEach var="pros" items="${projects}" varStatus="x">
                        <div class="col-md-3" id="card_id_${x.count}">
                        <!-- <div class="col-xl-3 col-lg-4 col-md-6 mb-4" id="card_id_${x.count}"> -->
                        <div class="card shadow mb-3 d-inline-block" >
                        <!-- <div class="bg-white rounded shadow-sm" > -->
                                

                                <img src="" class="card-img-top" alt="..." id="thumbnail_img_${x.count}">
                                <!-- <img src="" class="img-fluid card-img-top" alt="..." id="thumbnail_img_${x.count}"> -->
                                <div class="card-body">
                                  <h5 class="card-title">${pros.title}</h5>
                                  <!-- <p class="card-text">${pros.description}</p> -->
                                  
                                  <div class="d-none">
                                    <input type="hidden" class="so" name="count" value="${x.count}">
                                    <input type="hidden" class="so" id="project_id_${x.count}" value="${pros.projectId}">
                                    <input type="hidden" class="so" id="subcategory_id_${x.count}" value="${pros.subcategory.subcategoryId}">
                                    <input type="hidden" class="so" id="category_id_${x.count}" value="${pros.subcategory.category.categoryId}">
                                    <input type="hidden" class="so" id="title_${x.count}" value="${pros.title}">
                                    <input type="hidden" class="so" id="description_${x.count}" value="${pros.description}">
                                    <input type="hidden" class="so" id="ptitle_${x.count}" value="${pros.ptitle}">
                                    <input type="hidden" class="so" id="pdescription_${x.count}" value="${pros.pdescription}">
                                    <input type="hidden" class="so" id="revisions_${x.count}" value="${pros.revisions}">
                                    <input type="hidden" class="so" id="delivery_${x.count}" value="${pros.delivery}">
                                    <input type="hidden" class="so" id="price_${x.count}" value="${pros.price}">
                                    <input type="hidden" class="so" id="user_id_${x.count}" value="${pros.user.userId}">
                                    <input type="hidden" class="so" id="post_status_id_${x.count}" value="${pros.postStatus.postStatusId}">
                                    
                                  </div>
                                  <button class="btn btn-primary btn-sm edit_btn" onclick="display('${x.count}')"><i class="fa-solid fa-pen-to-square mr-2"></i>Edit</button>  
                                  <button class="btn btn-danger btn-sm float-right" onclick="deletefunc('${pros.projectId}','${x.count}')"><i class="fa-solid fa-trash-can"></i></button>  
                                </div>
                            </div>
                        </div>
                    </c:forEach>
            </div>
        </div>

        <div class="container-fluid d-none" id="create_project_div">
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
                                        <div class="form-group">
                                            <label for="title">Title</label>
                                            <input type="text" class="form-control w-85" id="title" name="title">
                                            <small class="form-text text-muted">Some good example titles: <br>
                    
                                                &#x2022; You will get an amazing logo designed for your business <br>
                                                &#x2022; You will get 3 hours of social media marketing consultation <br>
                                                &#x2022; You will get a revamped resume tailored to your next job <br>
                                                </small>
                                        </div>
                                        <div class="form-group">
                                            <label for="description">Project Description</label>
                                                <div class="row ml-1">
                                                    <textarea name="description" id="description" cols="80" rows="5"></textarea>
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
                                        
                                        <div class="form-group">
                                            <input type="text" id="tag">
                                            <div id="tag_list" class="overflow-auto d-none"></div>
                                            <div id="tag_box"></div>
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
                                            <input type="text" class="form-control" id="ptitle" name="title">
                                            <small class="form-text text-muted">Enter your valid email id...</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="pdescription">Description</label>
                                            <textarea name="pdescription" id="pdescription" cols="30" rows="10"></textarea>
                                            <small class="form-text text-muted">Enter your valid email id...</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="delivery">Delivery days</label>
                                            <input type="number" class="form-control" id="delivery" name="delivery">
                                            <small class="form-text text-muted">Enter your valid email id...</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="revisions">Number Of Revisions</label>
                                            <input type="number" class="form-control" id="revisions" name="revisions">
                                            <small class="form-text text-muted">Enter your valid email id...</small>
                                        </div>
                                        <div class="form-group">
                                            <label for="price">Price</label>
                                            <input type="number" class="form-control" id="price" name="price">
                                            <small class="form-text text-muted">Enter your valid email id...</small>
                                        </div>
                                        <input type="button" class="btn btn-secondary btn-sm" value="Save and Countinue" id="step_2_btn">
                                    </form>
                                </div>
                                <div id="step_3" class="d-none">
                                    <form id="media_box">
                                        <h3>Media</h3>
                                        <div>
                                            <label for="image_upload">Project Images</label>
                                            <small class="form-text text-muted">Upload up to 4 images (.jpg or .png), up to 1MB each</small>
                                            <div class="dropzone border border-secondary rounded-lg" id="image_upload">
                                                <div class="dz-message" data-dz-message><img src="static/images/upload_i.png" height="50px"><br><span>Upload your images</span></div>
                                            </div>  
                                        </div>

                                        <hr>
                                        
                                        <div>
                                            <label for="video_upload">Project Demo Videos</label>
                                            <small class="form-text text-muted">Upload a 30sec mp4 video, up to 10MB</small>
                                            <div class="dropzone border border-secondary rounded-lg" id="video_upload">
                                                <div class="dz-message" data-dz-message><img src="static/images/upload_v.png" height="50px"><br><span>upload your Project Demo</span></div>
                                            </div>                        
                                        </div>  
                                        <input type="button" class="btn btn-secondary btn-sm" value="Save and Countinue" id="step_3_btn">
                                    </form>
                                    <div class="row p-2 mt-5">
                                        <div class="card-columns" id="slide_img">

                                        </div>
                                    </div>
                                    <input type="button" class="btn btn-secondary btn-sm" value="Save" id="step_3i_btn">
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
        
        <!-- data-role="tagsinput" -->
        <%@ page import="java.util.ArrayList" %>
        <% ArrayList<Integer> updateTags = new ArrayList<Integer>(); %>
        <% session.setAttribute("tagz",updateTags); %>
        <!-- <select multiple /> -->
    </div>

    <script>
        const fetchImages = async (cpv) => {
            console.log("++++"+cpv);
            let resp = await fetch('fetch_all_images.do?project_id='+cpv);
            let result = await resp.json();

            return result;
        };

        const allImageReq = () => {
            fetchImages(current_project.value).then((data)=>{
                slide_img.innerHTML = null;
                let img_activate = true;

                for(let imagePath of data) {
                    let div = document.createElement('div');
                    let innerdiv = document.createElement('div');
                     
                    // div.classList.add('col-md-6','mb-);
                    innerdiv.classList.add('card','shadow');
                    slide_img.append(div);
                    div.append(innerdiv);
                    
                    let img = document.createElement('img');
                    img.src = 'download_image.do?img_path='+imagePath;
                    img.classList.add('w-100','card-img');
                    
                    innerdiv.append(img);
                }
            }).catch((err)=>{
                console.log(err);
            });
        };

        var items = "${projects}";
        let arr = items.split(',');
        let count = 1;
        console.log(arr);
        console.log(arr.length+'arr');
        // if(arr.length != 1){
            for(var i=1; i<=arr.length; i++){
            let thumb_pro_id = document.querySelector('#project_id_'+i).value;
            console.log(thumb_pro_id);
            display1(thumb_pro_id);
            console.log(items);
            }
        // }

        function display1(val1){
            console.log(val1+'hehehehe');
            let thumb_c = document.querySelector('#thumbnail_img_'+count);
            console.log(count+'hohohoho');
            count++;
            fetchImages(val1).then((data)=>{
                console.log(data[0]+'hehehehe');
                thumb_c.src = 'download_image.do?img_path='+data[0];
            }).catch((err)=>{
                console.log(err);
            });
        }
    </script>
    <script type="text/javascript" src="static/js/user_posts.js"></script>
    
    
    
    <%@ include file="footer1.jsp" %>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/toasty.js"></script>
     
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/08050841b9.js" crossorigin="anonymous"></script>
</body>
</html>