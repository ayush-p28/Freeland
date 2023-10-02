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