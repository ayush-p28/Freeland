const step1 = document.querySelector('#step1');
                    const step1_btn = document.querySelector('#step1_btn');
                    const step2 = document.querySelector('#step2');
                    const step2_btn = document.querySelector('#step2_btn');
                    const step3 = document.querySelector('#step3');
                    const step3_btn = document.querySelector('#step3_btn');
                    const step4 = document.querySelector('#step4');
                    const create_post = document.querySelector('#create_post');
                    const posts_block = document.querySelector('#posts_block');
                    
                    const title = document.querySelector('#title');
                    const description = document.querySelector('#description');
                    const category_box = document.querySelector('#category_box');
                    const category_list = document.querySelector('#category_list');
                    const category = document.querySelector('#category');
                    const subcategory_box = document.querySelector('#subcategory_box');
                    const subcategory_list = document.querySelector('#subcategory_list');
                    const subcategory = document.querySelector('#subcategory');
                    const tag_box = document.querySelector('#tag_box');
                    const tag_list = document.querySelector('#tag_list');
                    const tag = document.querySelector('#tag');
                    const mth6 = document.querySelector('#mth_six');
                    const mth3 = document.querySelector('#mth_three');
                    const mth1 = document.querySelector('#mth_one');
                    const beginner = document.querySelector('#beginner');
                    const advanced = document.querySelector('#advanced');
                    const intermediate = document.querySelector('#intermediate');
                    const current_post = document.querySelector('#current_post');



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
                    // let  = '';

                    var dead_line = new Date();
                    var dt = new Date();
                    dt = dt.toLocaleDateString();
                    console.log(dead_line);


                    create_post.addEventListener('click', () => {
                        posts_block.classList.add('d-none');
                        step1.classList.remove('d-none');
                    });

                    step1_btn.addEventListener('click', () => {
                        step1.classList.add('d-none');
                        step2.classList.remove('d-none');
                        class_title = title.value
                        class_description = description.value;
                    });
                    step2_btn.addEventListener('click', () => {
                        step2.classList.add('d-none');
                        step3.classList.remove('d-none');
                    });
                    step3_btn.addEventListener('click', () => {
                        step3.classList.add('d-none');
                        step4.classList.remove('d-none');
                        if(mth6.checked){
                            console.log('6 mahine');
                            dead_line.setMonth(dead_line.getMonth() + 6);
                        }
                        if(mth3.checked){
                            console.log('3 mahine');
                            dead_line.setMonth(dead_line.getMonth() + 3);
                        }
                        if(mth1.checked){
                            console.log('1 mahine');
                            dead_line.setMonth(dead_line.getMonth() + 1);
                        }
                        
                        console.log(dt);
                        dead_line = dead_line.toLocaleDateString();
                        // d = new Date(d).toISOString().slice(0, 19).replace('T', ' ');
                        console.log(dead_line);
                    });
                    step4_btn.addEventListener('click', () => {
                        step4.classList.add('d-none');
                        posts_block.classList.remove('d-none');
                        
                        // code save to be written
                        savePost().then((data)=>{
                            console.log(data);
                        }).catch((error)=>{
                            console.log(error);
                        });

                        setTimeout(function(){
                            window.location.reload();
                        }, 5000);
                        
                    });

                    function edit(val){
                        posts_block.classList.add('d-none')
                        step1.classList.remove('d-none');

                        title.value = document.querySelector('#name_'+val).value;
                        description.value = document.querySelector('#description_'+val).value; 


                    }

                    const savePost =  async () => {
                        console.log(category_id+'ready to fire');
                        // let resp = await fetch('save_project.do?title='+class_title+'&description='+class_description+'&subcategory_id='+subcategory_id+'&ptitle='+class_ptitle+'&pdescription='+class_pdescription+'&delivery='+class_delivery+'&revisions='+class_revisions+'&price='+class_price);
                        const obj = {name: class_title, description: class_description, subcategory: {subcategoryId: subcategory_id, category: {categoryId: category_id}}, date: dt, deadline: dead_line, postStatus: {postStatusId: postStatus_id}};          
                        var str = JSON.stringify(obj);
                        let resp = await fetch('save_post.do?project_data='+encodeURIComponent(str)+'&post_id='+current_post.value);

                        let result = resp.text();
                        console.log(result);
                        return result;
                    }


                    const wantCategory = async () => {
                        let result = await fetch('search_category.do');
                        let resp = await result.json();
                        return resp;
                    }

                    category.addEventListener('click', () => {
                        category_list.innerHTML = null;
                        category_list.classList.replace('d-none', 'd-block');
                        wantCategory().then((data) => {
                            for (var st of data) {
                                let elm = document.createElement('div');
                                elm.className = 'cat_rec';
                                elm.innerText = st.name;
                                // console.log(st.name+"-"+st.categoryId);
                                elm.category_id = st.categoryId;
                                elm.addEventListener('click', (e) => {
                                    tag.value = null;
                                    category.value = e.target.innerText;
                                    category_id = e.target.category_id;
                                    console.log(category.value + '~' + category_id);
                                    category_list.classList.replace('d-block', 'd-none');
                                });
                                category_list.append(elm);
                            }
                        }).catch((err) => {
                            console.log(err);
                        });
                    });

                    // Search SubCategory
                    const citySubcategory = async () => {
                        let result = await fetch('search_subcategory.do?category_id=' + category_id);
                        let tmp = await result.json();
                        console.log(tmp);

                        return tmp;
                    };

                    subcategory.addEventListener('click', (e) => {
                        subcategory_list.innerHTML = null;
                        subcategory_list.classList.replace('d-none', 'd-block');
                        citySubcategory().then((data) => {
                            for (var ct of data) {
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
                        }).catch((err) => {
                            console.log(err);
                        });
                    });

                    const tagRequest = async () => {
                        let result = await fetch('search_tag.do?tag='+tag.value);   
                        let tmp = await result.json();
                        return tmp;
                    };

                    
                    const updateTags = async (tag_id) => {
                        console.log(tag_id);
                        let result = await fetch('update_post_tags.do?tag_id='+tag_id);   
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
                        }, 
                    };
                    var toast = new Toasty(options);
                    toast.configure(options);
                    
                    $('#step4_btn').click(function() {
                        toast.success("Congratulations!! Post applied succesfully");
                    });
                        
                    });