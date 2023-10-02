const category = document.querySelector('#category');
        const category_list = document.querySelector('#category_list');
        const subcategory = document.querySelector('#subcategory');
        const subcategory_list = document.querySelector('#subcategory_list');
        const tag = document.querySelector('#tag');
        const tag_list = document.querySelector('#tag_list');

        let tag_id=null;
        let category_id=null;
        let subcategory_id=null;

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

        // search tags
        const tagRequest = async () => {
            let result = await fetch('search_tag.do?tag='+tag.value);   
                    
            let tmp = await result.json();

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
                            tag_id = e.target.tag_id;
                            tag_list.classList.replace('d-block', 'd-none');  
                        });
                        tag_list.append(elm);
                    }
                }).catch((err)=>{
                    console.log(err);                    
                });
            }
        });