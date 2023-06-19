<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        #side_border{
            border-right: 1px solid rgb(74, 72, 72);
        }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>

    <div class="container-fluid bg-light">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10">
                <div class="row m-4 bg-white p-5 border border-black" id="step1" style="border-radius: 20px;">
                    <div class="col-md-5 mr-2 p-4" id="side_border">
                        <h2 class="m-2">Let's start with a strong title.</h2>
                        <p class="text-muted p-2">This helps your job post stand out to the right candidates. It’s the first thing they’ll see, so make it count!</p>
                    </div>
                    <div class="col-md-6 ml-2 p-4">
                        <div class="form-group">
                            <label for="title" class="font-weight-bold">Write a title for your job post
                            </label>
                            <input type="text" class="form-control form-control-lg" name="title" id="title">
                            <small class="form-text text-muted p-2">Some good example titles: <br>
                            
                                &#x2022; Build responsive WordPress site with booking/payment functionality <br>
                                &#x2022; Graphic designer needed to design ad creative for multiple campaigns <br>
                                &#x2022; Facebook ad specialist needed for product launch <br>
                                </small>
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
                    </div>
                    <div class="ml-auto">
                        <button type="button" class="btn btn-outline-dark mt-auto">Back</button>
                        <button type="button" class="btn btn-outline-success mt-auto px-5" id="step1_btn">Next</button>
                    </div>
                </div>

                <div class="row m-4 bg-white p-5 border border-black d-none" id="step2" style="border-radius: 20px;">
                    <div class="col-md-5 mr-2 p-4" id="side_border">
                        <h2 class="m-2">What are the main skills required for your work?</h2>
                        <p class="text-muted p-2">This helps your job post stand out to the right candidates. With these tags your projects reaches to the relevat freelancers. It’s the first thing they’ll see, so make it count!</p>
                    </div>
                    <div class="col-md-6 ml-2 p-4">
                            
                        <div class="form-group">
                            <label for="tag" class="font-weight-bold">Search or add up to 10 skills
                            </label>
                            <input type="text" class="form-control form-control-lg" id="tag">
                            <div id="tag_list" class="overflow-auto d-none"></div>
                            <div id="tag_box"></div>
                            <small class="form-text text-muted p-2">For the best results, add 3-5 skills </small>
                        </div>
                        
                    </div>
                    
                    <div class="ml-auto">
                        <button type="button" class="btn btn-outline-dark mt-auto">Back</button>
                        <button type="button" class="btn btn-outline-success mt-auto px-5" id="step2_btn">Next</button>
                    </div>
                </div>

                <div class="row m-4 bg-white p-5 border border-black d-none" id="step3" style="border-radius: 20px;">
                    <div class="col-md-5 mr-2 p-4" id="side_border">
                        <h2 class="m-2">Next, estimate the scope of your work?</h2>
                        <p class="text-muted p-2">These aren’t final answers, but this information helps us recommend the right talent for what you need!</p>
                    </div>
                    <div class="col-md-6 ml-2 p-4">
                            
                        
                            <div>
                                <p class="font-weight-bold">How long will your work take?</p>
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="6mth" name="rdo" class="custom-control-input text-right">
                                    <label class="custom-control-label" for="6mth">3 to 6 months</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="3mth" name="rdo" class="custom-control-input text-right">
                                    <label class="custom-control-label" for="3mth">1 to 3 months</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="1mth" name="rdo" class="custom-control-input text-right">
                                    <label class="custom-control-label" for="1mth">1 or less than 1 month</label>
                                </div>
                            </div>
                            
                            <div class="mt-4">
                                <p class="font-weight-bold">What level of experience will it need?</p>
                                <div class="custom-control custom-radio mb-1">
                                    <input type="radio" id="beginner" name="experience" class="custom-control-input text-right">
                                    <label class="custom-control-label" for="beginner">Beginner<br>
                                        <small class="text-muted">Looking for someone relatively new to this field</small>
                                    </label>
                                </div>
                                <div class="custom-control custom-radio mb-1">
                                    <input type="radio" id="intermediate" name="experience" class="custom-control-input text-right">
                                    <label class="custom-control-label" for="intermediate">Intermediate <br>
                                        <small class="text-muted">Looking for substantial experience in this field</small>
                                    </label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="advanced" name="experience" class="custom-control-input text-right">
                                    <label class="custom-control-label" for="advanced">Advanced<br>
                                        <small class="text-muted">Looking for comprehensive and deep expertise in this field</small>
                                    </label>
                                </div>
                            </div>
                            <div class="mt-4">
                                <p class="font-weight-bold">Is this job a contract-to-hire opportunity?</p>
                                <small class="text-muted">This means you'll start with a contract, and may later explore a full-time option with the talent. Your answer helps us better support your hiring needs.</small>
                                <div class="custom-control custom-radio mb-1">
                                    <input type="radio" id="yes" name="contra-to-hire" class="custom-control-input text-right">
                                    <label class="custom-control-label" for="yes">Yes <br>
                                    </label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="no" name="contra-to-hire" class="custom-control-input text-right">
                                    <label class="custom-control-label" for="no">No<br>
                                    </label>
                                </div>
                            </div>
                        
                    </div>
                    
                    <div class="ml-auto">
                        <button type="button" class="btn btn-outline-dark mt-auto">Back</button>
                        <button type="button" class="btn btn-outline-success mt-auto px-5" id="step3_btn">Next</button>
                    </div>
                </div>

                <div class="row m-4 bg-white p-5 border border-black d-none" id="step4" style="border-radius: 20px;">
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
                            <small class="form-text text-muted p-2">Professionals tend to charge $10.00 - $25.00 /hour (USD) for graphic design projects like yours. Experts may charge higher rates. </small>
                        </div>
                    </div>
                    
                    <div class="ml-auto">
                        <button type="button" class="btn btn-outline-dark mt-auto">Back</button>
                        <button type="button" class="btn btn-outline-success mt-auto px-5" id="step4_btn">Next</button>
                    </div>
                </div>
            </div>
            <div class="col-md-1"></div>
        </div>
    </div>

    <script>
        const step1 = document.querySelector('#step1');
        const step1_btn = document.querySelector('#step1_btn');
        const step2 = document.querySelector('#step2');
        const step2_btn = document.querySelector('#step2_btn');
        const step3 = document.querySelector('#step3');
        const step3_btn = document.querySelector('#step3_btn');
        const step4 = document.querySelector('#step4');

        step1_btn.addEventListener('click',()=>{
            step1.classList.add('d-none');
            step2.classList.remove('d-none');
        });
        step2_btn.addEventListener('click',()=>{
            step2.classList.add('d-none');
            step3.classList.remove('d-none');
        });
        step3_btn.addEventListener('click',()=>{
            step3.classList.add('d-none');
            step4.classList.remove('d-none');
        });
        step4_btn.addEventListener('click',()=>{
            step4.classList.add('d-none');
            // code save to be written
        });

        
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
    </script>
</body>
</html>