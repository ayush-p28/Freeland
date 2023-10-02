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