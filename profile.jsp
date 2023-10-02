<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/08050841b9.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="static/css/common.css">


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <style>
        #avatar {
            width: 220px;
            border-radius: 50%;
            
        }
    </style>
</head>
<body>
    <%@ include file="header1.jsp" %>

    <div class="container-fluid">
        <input type="hidden" id="userI" value="${user.logo}">

        <div class="row my-5">
            <div class="col-md-4">
                <div class="row flex-column">
                    <div class="col mb-4">
                        <div class="border border-black shadow text-center" style="border-radius: 10px;">
                            <div class="">
                                <img src="" alt="Avatar" height="200" width="200" id="avatar">
                            </div>
                            <h4 class="mt-2">Name: <Strong>${user.name}</Strong></h4>
                            <p class="mt-2">Contact: <Strong>${user.contact}</Strong></p>
                            <h5 class="mt-2">Rating: <Strong>${user.rating}</Strong></h5>
                        </div>
                    </div>
                    <div class="col">
                        <div class="border border-black shadow p-3" style="border-radius: 10px;">
                            <h4 class="mt-2">Skills</h4>
                            <div id="skillz"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="border border-black shadow p-4" style="border-radius: 10px;">
                    <fieldset class="border border-dark p-2 mb-2">
                        <legend class="w-auto"> Personal Info: </legend>
                            <p class="mt-2"><b>Address:</b> ${user.address}</p>
                            <p class="mt-2"><b>Email:</b> ${user.email}</p>
                    </fieldset>
                    <fieldset class="border border-dark p-2 mb-2">
                        <legend class="w-auto"> About Me: </legend>
                            <p class="mt-2">${user.aboutMe}</p>
                    </fieldset>
                    <fieldset class="border border-dark p-2 mb-2">
                        <legend class="w-auto"> Skills: </legend>
                        <div class="form-group">
                            <label for="tag" class="font-weight-bold">Search or add up to 10 skills
                            </label>
                            <input type="text" class="form-control form-control-lg" id="tag">
                            <div id="tag_list" class="overflow-auto d-none"></div>
                            <div id="tag_box"></div>
                            <small class="form-text text-muted p-2">For the best results, add 3-5 skills </small>
                        </div>
                    </fieldset>

                    <div class="text-right mt-5">
                        <button type="button" class="btn btn-success mt-auto px-5" id="save_profile"> Save </button>
                    </div>
                </div>
            </div>
        </div>        

    </div>
    <!-- <script src="static/js/client_create_post.js"></script> -->
    <!-- <script src="static/js/client_dashboard.js"></script> -->
<!-- data-role="tagsinput" -->
<%@ page import="java.util.ArrayList" %>
<% ArrayList<Integer> updateSkillz = new ArrayList<Integer>(); %>
<% session.setAttribute("free_skillz",updateSkillz); %>
<!-- <select multiple /> -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/toasty.js"></script>
    
    <%@ include file="footer1.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>


<script>
    const u_id = document.querySelector('#userI').value;
    const avatar = document.querySelector('#avatar');
    console.log(u_id);
    
    avatar.src = 'download_image.do?img_path='+u_id;

    const save_profile = document.querySelector('#save_profile');
    const skillz = document.querySelector('#skillz');
    const tag_box = document.querySelector('#tag_box');
    const tag_list = document.querySelector('#tag_list');
    const tag = document.querySelector('#tag');
    let tag_id = null;

    const collectSkillz = async () => {
        let result = await fetch('update_free_skills.do');   
        let tmp = await result.json();
        return tmp;
    };

    collectSkillz().then((data)=>{
        skillz.innerHTML = null;
        for(var ct of data) {
            let tagin = document.createElement('small');
            let tagin_btn = document.createElement('a');
            let tagin_span = document.createElement('p');
            
            tagin.innerText = ct;
            tagin_span.innerHTML = '&times;';
            tagin.classList.add('alert','alert-warning','alert-dismissible','alert-link','fade','show','d-inline-block','m-1','py-1',);
            tagin_btn.classList.add('close');
            tagin_btn.setAttribute('data-dismiss','alert');
            tagin_span.classList.add('close','py-1','m-0');
            
            tagin_btn.append(tagin_span);
            tagin.append(tagin_btn);
            skillz.append(tagin);
        }
        }).catch((error)=>{
            console.log(error);
        });

    const tagRequest = async () => {
        let result = await fetch('search_tag.do?tag='+tag.value);   
        let tmp = await result.json();
        return tmp;
    };

    
    const updateTags = async (tag_id) => {
        console.log(tag_id);
        let result = await fetch('update_free_skills.do?tag_id='+tag_id);   
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

    const saveProfile =  async () => {
        const options = {
            method: 'POST',
            headers: {
            'Content-Type': 'application/json'
            }
        };
        let resp = await fetch('update_free_skills.do',options);

        let result = resp.text();
        return result;
    }

    save_profile.addEventListener('click',()=>{
        saveProfile().then((data)=>{
            console.log(data);
        }).catch((error)=>{
            console.log(error);
        });

        setTimeout(function(){
            window.location.reload();
        }, 3000);
    });

    $(document).ready(function() {
   
   var options = {
       autoClose: true,
       progressBar: true,
       enableSounds: true,
       sounds: {
       success: "https://res.cloudinary.com/dxfq3iotg/video/upload/v1557233524/success.mp3",
       }, 
   };
   var toast = new Toasty(options);
   toast.configure(options);
   
   $('#save_profile').click(function() {
       toast.success("Congratulations!! Profile Updated Successfully");
   });
       
   });

    
</script>

