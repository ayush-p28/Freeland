<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
    <script src="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone-min.js"></script>
    <link href="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone.css" rel="stylesheet" type="text/css" />
    <style>
        .btn-indigo{
            background-color: #6610f2;
        }

        .bg-color {
            background-color: #1A252F;
        }
        #state_list {
            position: absolute;
            top: 68px;
            left: 13px;
            z-index: 1;
            height: 200px;
            border: 2px solid #999;
            background-color: white;
        }

        #state_box {
            position: relative;
        }

        #city_list {
            position: absolute;
            top: 68px;
            left: 40px;
            z-index: 1;
            height: 200px;
            border: 2px solid #999;
            background-color: white;
        }

        #ct_box {
            position: relative;
        }

        .st_rec {
            font-size: 15px;
            /* font-weight: bold; */
            font-family: verdana;
            padding: 6px 15px;
            cursor: pointer; 
        }

        .st_rec:hover {
            background-color: #eee;
        }
    </style>
</head>
<body>
    <%@ include file="header1.jsp" %>

    <div class="alert alert-success text-center d-none" role="alert" id="profile_alert">
        <p class="mb-0">Profile Updated Succesfully... Please SignIn To Countinue</p>
        <hr>
        <h4 class="alert-heading">Redirecting !!</h4>
        <p id="counter"><img src="new_loading.gif" alt="" width="160px"></p>
      </div>

    <!-- Operator LOGO Upload Modal -->
    <div class="modal fade" id="modal_logo">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Upload User's LOGO</h3>
                    <button class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="col">
                        <div class="dropzone border border-secondary rounded-lg" id="logo"></div>                        
                    </div>
                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-primary btn-sm" value="Upload logo" id="upload_logo">
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-8 mx-auto my-5 py-3 bg-light border border-secondary rounded-lg" id="profile_form">
                <div class="row my-5">
                    <div class="col-2"></div>
                    <div class="col-8">
                        <h2>Enter Profile Information: </h2>
                        <form action="#">
                            <div class="form-group">
                                <label for="about">About/Bio</label>
                                <textarea id="about" cols="30" rows="3" class="form-control"></textarea>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-5" id="state_box">
                                    <label for="state">State</label>
                                    <input type="text" class="form-control" id="state">
                                    <div id="state_list" class="overflow-auto d-none"></div>
                                </div>
                                <div class="form-group col-md-5" id="ct_box">
                                    <label for="city">City</label>
                                    <input type="text" class="form-control" id="city">
                                    <div id="city_list" class="overflow-auto d-none"></div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="address">Address</label>
                                <textarea id="address" cols="30" rows="3" class="form-control"></textarea>
                            </div>
                            <button type="button" id="save_btn">Save and Continue</button>
                        </form>
                    </div>
                    <div class="col-2">

                    </div>
                </div>
        </div>

    </div>

    <%@ include file="footer1.jsp" %>


    <script>
        const state = document.querySelector('#state');
        const state_list = document.querySelector('#state_list');
        const city_list = document.querySelector('#city_list');
        const city = document.querySelector('#city');
        const upload_logo = document.querySelector('#upload_logo');
        const save_btn = document.querySelector('#save_btn');
        const profile_form = document.querySelector('#profile_form');
        const profile_alert = document.querySelector('#profile_alert');
        const counter = document.querySelector('#counter');
        const address = document.querySelector('#address');
        const about = document.querySelector('#about');

        let state_id = null;
        let city_id = null;


        let logoupload = new Dropzone('#logo', {
            url: 'upload_logo.do',
            uploadMultiple: false,
            maxFilesize: .5,
            acceptedFiles: 'image/jpg,image/jpeg,image/png',
            autoProcessQueue: false,
            addRemoveLinks: true
        });

        upload_logo.addEventListener('click', () => {
            logoupload.processQueue();
            setTimeout(()=>{
                $('#modal_logo').modal('hide');
            }, 100);

            profile_alert.classList.replace('d-none','d-block');
             
            setTimeout(()=>{
                profile_alert.classList.replace('d-block','d-none');
                // $('#modal_signin').modal('show');
                window.location("login.jsp");
            }, 5000);

        });

        const saveProfile = async () => {
            const url = 'save_profile.do?address='+address.value+'&city_id='+city_id+'&about='+about.value;
            console.log(url);
            let result = await fetch(url);
            let resp = await result.text();

            return resp;
        };


        save_btn.addEventListener('click',()=>{
            saveProfile().then((data)=>{

            }).catch((err)=>{
                console.log(err);
            });
            profile_form.classList.add('d-none');
            $('#modal_logo').modal('show');
            // window.location = "index.jsp";
        });

        // State search
        const wantState = async ()=>{
            let result = await fetch('search_state.do');
            let resp = await result.json();
            return resp;
        }
        
        state.addEventListener('click',()=>{
            state_list.innerHTML = null;
            state_list.classList.replace('d-none','d-block');
            wantState().then((data)=>{
                for(var st of data){
                    let elm = document.createElement('div');
                    elm.className = 'st_rec';
                    elm.innerText = st.name;
                    elm.state_id = st.stateId;
                        elm.addEventListener('click', (e) => {
                            city.value = null;
                            state.value = e.target.innerText;  
                            state_id = e.target.state_id;
                            console.log(state.value+'~'+state_id);
                            state_list.classList.replace('d-block', 'd-none');  
                        });
                        state_list.append(elm);
                }
            }).catch((err)=>{
                console.log(err);
            });
        });

        // Search City
        const cityRequest = async () => {
            let result = await fetch('search_city.do?city='+city.value+'&state_id='+state_id);   
            // let result = await fetch(`search_city.do?city=${city.value}&state_id=${state_id});   
            let tmp = await result.json();
            // console.log(tmp);

            return tmp;
        };

        city.addEventListener('click', (e) => {
            city_list.innerHTML = null;
            city_list.classList.replace('d-none', 'd-block');
                cityRequest().then((data)=>{
                    for(var ct of data) {
                        // console.log(ct);
                        let elm = document.createElement('div');
                        elm.className = 'st_rec';
                        elm.innerText = ct.name;
                        elm.city_id = ct.cityId;
                        elm.addEventListener('click', (e) => {
                            city.value = e.target.innerText;  
                            city_id = e.target.city_id;
                            city_list.classList.replace('d-block', 'd-none');  
                        });
                        city_list.append(elm);
                    }
                }).catch((err)=>{
                    console.log(err);                    
                });
        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>