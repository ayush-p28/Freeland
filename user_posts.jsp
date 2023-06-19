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

    
    
    <%@ include file="footer1.jsp" %>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/toasty.js"></script>
     
    
    <script>
        const category_box = document.querySelector('#category_box');
        const category = document.querySelector('#category');
        const category_list = document.querySelector('#category_list');
        const subcategory_box = document.querySelector('#subcategory_box');
        const subcategory = document.querySelector('#subcategory');
        const subcategory_list = document.querySelector('#subcategory_list');
        const tag = document.querySelector('#tag');
        const tag_list = document.querySelector('#tag_list');
        const tag_box = document.querySelector('#tag_box');
        const create_project = document.querySelector('#create_project');
        const image_upload = document.querySelector('#image_upload');
        const media_box = document.querySelector('#media_box');
        const slide_img = document.querySelector('#slide_img');
        const img_slider = document.querySelector('#img_slider');

        const step_1_btn = document.querySelector('#step_1_btn');
        const step_2_btn = document.querySelector('#step_2_btn');
        const step_3_btn = document.querySelector('#step_3_btn');
        const step_3i_btn = document.querySelector('#step_3i_btn');
        const thumbnail_img = document.querySelector('#thumbnail_img');
        
        const title = document.querySelector('#title');
        const description = document.querySelector('#description');
        const ptitle = document.querySelector('#ptitle');
        const pdescription = document.querySelector('#pdescription');
        const delivery = document.querySelector('#delivery');
        const revisions = document.querySelector('#revisions');
        const price = document.querySelector('#price');
        const step_1 = document.querySelector('#step_1');
        const step_2 = document.querySelector('#step_2');
        const step_3 = document.querySelector('#step_3');
        const project_steps = document.querySelector('#project_steps');
        // const forExc = document.getElementsByTagName('c:forEach');
        
        const dtitle = document.querySelector('#dtitle');
        const ddescription = document.querySelector('#ddescription');
        const edit_btn = document.querySelector('.edit_btn');
        const current_project = document.querySelector('#current_project');
        
        let category_id = null;
        let subcategory_id = null;
        let postStatus_id = 1;
        let tag_id = null;

        let class_title = null;
        let class_description = null;
        
        let class_ptitle = null;
        let class_pdescription = null;
        let class_delivery = null;
        let class_revisions = null;
        let class_price = null;


        
        // console.log(forExc+'count val');

        

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

        console.log("++++"+current_project.value+"~~~");
        
        create_project.addEventListener('click',()=>{
            show_projects.classList.add('d-none');
            create_project_div.classList.replace('d-none','d-block');
            
            title.value = null;
            description.value = null;
            ptitle.value = null;
            pdescription.value = null;
            revisions.value = null;
            delivery.value = null;
            price.value = null;
        });
        
        step_1_btn.addEventListener('click',()=>{
            step_1.classList.replace('d-block','d-none');
            step_2.classList.replace('d-none','d-block');
            class_title = title.value
            class_description = description.value;
        });

        step_2_btn.addEventListener('click',()=>{
            step_2.classList.replace('d-block','d-none');
            step_3.classList.replace('d-none','d-block');
            class_ptitle = ptitle.value;
            class_pdescription = pdescription.value; 
            class_delivery = delivery.value;
            class_revisions = revisions.value;
            class_price = price.value;

            saveProject().then((data)=>{
                console.log(data);
            }).catch((error)=>{
                console.log(error);
            });
        });

        const saveProject =  async () => {
            console.log(category_id+'ready to fire');
            // let resp = await fetch('save_project.do?title='+class_title+'&description='+class_description+'&subcategory_id='+subcategory_id+'&ptitle='+class_ptitle+'&pdescription='+class_pdescription+'&delivery='+class_delivery+'&revisions='+class_revisions+'&price='+class_price);
            const obj = {title: class_title, description: class_description, subcategory: {subcategoryId: subcategory_id, category: {categoryId: category_id}}, ptitle: class_ptitle, pdescription: class_pdescription,delivery: class_delivery, revisions: class_revisions, price:class_price, postStatus: {postStatusId: postStatus_id}};          
            var str = JSON.stringify(obj);
            let resp = await fetch('save_project.do?project_data='+encodeURIComponent(str)+'&project_id='+current_project.value);

            let result = resp.text();
            return result;
        }

        step_3_btn.addEventListener('click',()=>{
            step_3.classList.replace('d-block','d-none');
            window.location.reload();
        });
        step_3i_btn.addEventListener('click',()=>{
            // step_3.classList.replace('d-block','d-none');
            window.location.reload();
        });

        // upload_image.addEventListener()

        // upload images
        new Dropzone('#image_upload', {
            url: 'upload_images.do',
            uploadMultiple: true,
            maxFilesize: 2,
            acceptedFiles: 'image/jpg,image/jpeg,image/png',
            autoProcessQueue: true,
            addRemoveLinks: true
        });
        
        
        // video upload
        new Dropzone('#video_upload', {
            url: 'upload_video.do',
            uploadMultiple: true,
            maxFilesize: 1,
            acceptedFiles: 'image/mp4',
            autoProcessQueue: true,
            addRemoveLinks: true
        });


         // Category search
        const wantCategory = async ()=>{
            let result = await fetch('search_category.do');
            let resp = await result.json();
            return resp;
        }
        
        category.addEventListener('click',()=>{
            category_list.innerHTML = null;
            category_list.classList.replace('d-none','d-block');
            wantCategory().then((data)=>{
                for(var st of data){
                    let elm = document.createElement('div');
                    elm.className = 'cat_rec';
                    elm.innerText = st.name;
                    // console.log(st.name+"-"+st.categoryId);
                    elm.category_id = st.categoryId;
                        elm.addEventListener('click', (e) => {
                            tag.value = null;
                            category.value = e.target.innerText;  
                            category_id = e.target.category_id;
                            console.log(category.value+'~'+category_id);
                            category_list.classList.replace('d-block', 'd-none');  
                        });
                        category_list.append(elm);
                }
            }).catch((err)=>{
                console.log(err);
            });
        });

        // Search SubCategory
        const citySubcategory = async () => {
            let result = await fetch('search_subcategory.do?category_id='+category_id);   
            let tmp = await result.json();
            console.log(tmp);

            return tmp;
        };

        subcategory.addEventListener('click', (e) => {
            subcategory_list.innerHTML = null;
            subcategory_list.classList.replace('d-none', 'd-block');
                citySubcategory().then((data)=>{
                    for(var ct of data) {
                        console.log(ct);
                        let elm = document.createElement('div');
                        elm.className = 'cat_rec';
                        elm.innerText = ct.name;
                        elm.subcategory_id = ct.subcategoryId;
                        elm.addEventListener('click', (e) => {
                            subcategory.value = e.target.innerText;  
                            subcategory_id = e.target.subcategory_id;
                            subcategory_list.classList.replace('d-block', 'd-none');  
                        });
                        subcategory_list.append(elm);
                    }
                }).catch((err)=>{
                    console.log(err);                    
                });
        });

        const delete_project = async(val_id)=>{
            let result = await fetch('delet_project.do?project_id='+val_id);   
            console.log(result);
            return result.text();
        }

        deletefunc = (val_id,card_id)=>{
            delete_project(val_id).then((data)=>{
                console.log(data+'ye data aahe');
                let dlt_alert = document.querySelector('#dlt_alert');
                let card_id_num = document.querySelector('#card_id_'+card_id);
                if(data == 'true'){
                    card_id_num.classList.add('d-none');
                    console.log(card_id+'card---id');
                    dlt_alert.classList.remove('d-none');
                    setTimeout(function() {
                        // $('#dlt_alert').fadeOut('fast');
                    }, 2000); // <-- time in milliseconds
                    dlt_alert.classList.add('d-none');
                }
            }).catch((err)={

            });
        }

        display = (val)=>{
            show_projects.classList.add('d-none');
            create_project_div.classList.replace('d-none','d-block');
            // console.log(val);
            title.value = document.querySelector('#title_'+val).value;
            description.value = document.querySelector('#description_'+val).value;
            ptitle.value = document.querySelector('#ptitle_'+val).value;
            pdescription.value = document.querySelector('#pdescription_'+val).value;
            revisions.value = document.querySelector('#revisions_'+val).value;
            delivery.value = document.querySelector('#delivery_'+val).value;
            price.value = document.querySelector('#price_'+val).value;
            current_project.value = document.querySelector('#project_id_'+val).value;
            search_subcat = document.querySelector('#subcategory_id_'+val).value;
            category_id = document.querySelector('#category_id_'+val).value;
            // console.log(search_subcat);
            // console.log(category_id+"-category-");
            wantCategory().then((data)=>{
                category.value = data[category_id].name;
            }).catch((err)=>{
                console.log(err);
            })
            citySubcategory().then((data)=>{
                // subcategory.value = data[search_subcat].name;
            }).catch((err)=>{
                console.log(err);
            });
            // category.value = document.querySelector('#category_id_'+val).value;
            // console.log(subcategory.value);
            media_box.classList.add('d-none');
            console.log("++++"+current_project.value+"~~~");
            allImageReq(); 
            
            // const price = document.querySelector('#user_id_');
            // const price = document.querySelector('#post_status_id_');
        }

        // search tags
        const tagRequest = async () => {
            let result = await fetch('search_tag.do?tag='+tag.value);   
            let tmp = await result.json();
            return tmp;
        };

        
        const updateTags = async (tag_id) => {
            console.log(tag_id);
            let result = await fetch('update_project_tags.do?tag_id='+tag_id);   
            let tmp = await result.text();
            return tmp;
        };

        tag.addEventListener('keyup', (e) => {
            var input = e.target.value;
            // console.log(input);
            if(input.length > 2) {
                tagRequest().then((data)=>{
                    tag_list.innerHTML = null;
                    tag_list.classList.replace('d-none', 'd-block');
                    for(var ct of data) {
                        // console.log(ct);
                    
                        let elm = document.createElement('div');
                        elm.className = 'cat_rec';
                        elm.innerText = ct.name;
                        elm.tag_id = ct.tagId;
                        elm.addEventListener('click', (e) => {
                            tag.value = e.target.innerText;
                            let tagin = document.createElement('small');
                            let tagin_btn = document.createElement('a');
                            let tagin_span = document.createElement('p');
                            
                            tagin.innerText = e.target.innerText;
                            tagin_span.innerHTML = '&times;';
                            tagin.classList.add('alert','alert-warning','alert-dismissible','alert-link','fade','show','d-inline-block','m-1','py-1',);
                            tagin_btn.classList.add('close');
                            tagin_btn.setAttribute('data-dismiss','alert');
                            tagin_span.classList.add('close','py-1','m-0');
                            
                            tagin_btn.append(tagin_span);
                            tagin.append(tagin_btn);
                            tag_box.append(tagin);
                            tag_id = e.target.tag_id;
                            updateTags(tag_id).then((data)=>{
                                console.log(data);
                            }).catch((error)=>{
                                console.log(error);
                            });
                            tagin_span.addEventListener('click',()=>{
                                // tag_array.pop(tag_id);
                                // console.log(e.target.tag_id);
                                // console.log(tag_array);
                            });

                            tag.value = null;
                            tag_list.classList.replace('d-block', 'd-none');

                            // console.log(tag_id);
                            // console.log(tag_array);
                        });
                        tag_list.append(elm);
                    }
                }).catch((err)=>{
                    console.log(err);                    
                });
            }
        });

        $(document).ready(function() {
   
   var options = {
       autoClose: true,
       progressBar: true,
       enableSounds: true,
       sounds: {
       success: "https://res.cloudinary.com/dxfq3iotg/video/upload/v1557233524/success.mp3",
       error: "https://res.cloudinary.com/dxfq3iotg/video/upload/v1557233524/success.mp3",
       }, 
   };
   var toast = new Toasty(options);
   toast.configure(options);
   
   $('#step4_btn').click(function() {
       toast.success("Congratulations!! Project applied succesfully");
   });
   $('.btn-danger').click(function() {
       toast.error("Warning!! Project Deleted succesfully");
   });
       
   });

    </script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/08050841b9.js" crossorigin="anonymous"></script>
</body>
</html>