const name = document.querySelector('#name');
        const email = document.querySelector('#email');
        const password = document.querySelector('#password');
        const input_otp_div = document.querySelector('#input_otp_div');
        const input_otp = document.querySelector('#input_otp');
        const send_otp = document.querySelector('#send_otp');
        const contact = document.querySelector('#contact');
        const validate_otp = document.querySelector('#validate_otp');
        const otp_success = document.querySelector('#otp_success');
        const signup_submit = document.querySelector('#signup_submit');
        const email_alert = document.querySelector('#email_alert');

        const join_type = document.querySelector('#join-type');
        const join_t = document.querySelector('#join-t');
        const join_form = document.querySelector('#join-form');
        const user_type = document.querySelector('#user_type');

        let rdo_btns = document.querySelector('#rdo_btns');
        let client = document.querySelector('#client');
        let free = document.querySelector('#free');
        let client_box = document.querySelector('#client_box');
        let free_box = document.querySelector('#free_box');

        rdo_btns.addEventListener('click',()=>{
            if(client.checked){
                free_box.classList.remove('rdocheck');
                client_box.classList.add('rdocheck');
            }
            if(free.checked){
                client_box.classList.remove('rdocheck');
                free_box.classList.add('rdocheck');
            }
            
        });
        join_type.addEventListener('click',()=>{
            join_t.classList.add('d-none');
            join_form.classList.replace('d-none','d-block');
            if(client.checked){
                user_type.value = 1;
            } else{
                user_type.value = 2;
            }
        });
    
        
        // Client Side Validation
            // mobile verification
            contact.addEventListener('keyup',()=> {
                contact.classList.add('is-invalid');
                var reg = /^[0-9]{10}$/;
                if(reg.test(contact.value)){
                    contact.classList.replace('is-invalid','is-valid');
                }
            });
    
            // email verification
            email.addEventListener('keyup',(e)=> {
                email.classList.add('is-invalid');
                var reg = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/;
                if(reg.test(email.value)){
                    email.classList.replace('is-invalid','is-valid');
                }
            });
    
            // password verification
            password.addEventListener('keyup',() => {
                password.classList.add('is-invalid');
                var reg = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$/;
                if(reg.test(password.value)){
                    password.classList.replace('is-invalid','is-valid');
                }
            });
    
    
        // OTP Validation
        const checkOTP = async () => {
            let result = await fetch('check_otp.do?otp='+input_otp.value);
            console.log("chal-gaya");
    
            return result.text();
        }
    
        validate_otp.addEventListener('click', () => {
            checkOTP().then((data)=>{
                if(data == 'true') {
                    console.log("ayush");
                    input_otp_div.classList.replace('d-block', 'd-none');
                    contact.setAttribute('readonly','readonly');
                    send_otp.classList.replace('d-block', 'd-none');
                    otp_success.classList.replace('d-none', 'd-block');
                }
            }).catch((err)=>{
                console.log(err);
            });
        });
    
        // OTP sending
        const sendOTP = async ()=>{
            console.log(contact.value);
            let result = await fetch('send_otp.do?contact='+contact.value);
            return result;
        }
    
        send_otp.addEventListener('click',()=>{
            sendOTP().then((data)=>{
                    console.log('working');
                }).catch((err)=>{
                    console.log('error');
                });
            input_otp_div.classList.replace('d-none', 'd-block');
        });
    
        // form submission
        signup_submit.addEventListener('click',()=>{
            console.log("prashu");
            email_alert.classList.replace('d-none','d-block');
        });