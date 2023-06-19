<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<!-- Header -->
<nav class="navbar navbar-expand-lg navbar-dark bg-color shadow sticky-top py-2" id="mainNav">
    <a href="#" class="navbar-brand text-uppercase font-weight-bold">
        <img src="static/images/logo.png" height="50" alt="" class="mr-1">
        
    </a>

    <button class="navbar-toggler" data-toggle="collapse" data-target="#header_options">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="header_options">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a href="http://localhost:8080/FreeLand/index.jsp" class="nav-link text-uppercase font-weight-bold">Home</a>
            </li>
            <c:choose>
                <c:when test="${user.userType.userTypeId == 2}">
                    <li class="nav-item">
                        <a href="user_dashboard.jsp" class="nav-link text-uppercase font-weight-bold">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a href="user_project.do" class="nav-link text-uppercase font-weight-bold">Projects</a>
                    </li>
                    <li class="nav-item">
                        <a href="" class="nav-link text-uppercase font-weight-bold">Orders</a>
                    </li>
                </c:when>
                <c:when test="${user.userType.userTypeId == 1}">
                    <li class="nav-item">
                        <a href="user_dashboard.jsp" class="nav-link text-uppercase font-weight-bold">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a href="#" class="nav-link text-uppercase font-weight-bold">Bidings</a>
                    </li>
                    <!-- <li class="nav-item">
                        <a href="" class="nav-link text-uppercase font-weight-bold">Orders</a>
                    </li> -->
                </c:when>
                <c:otherwise>
                    <li class="nav-item">
                        <a href="" class="nav-link text-uppercase font-weight-bold">&nbsp;Hire</a>
                    </li>
                    <li class="nav-item">
                        <a href="" class="nav-link text-uppercase font-weight-bold">&nbsp;Work</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
            
        <c:choose>
            <c:when test="${user == null}">
                <a href="login.jsp" class="btn btn-indigo text-white mr-2"><i class="fa-solid fa-right-to-bracket"></i> SignIn</a>
            </c:when>
            <c:otherwise>
                <a href="signout.do" class="btn btn-indigo text-white mr-2"><i class="fa-solid fa-right-from-bracket"></i>&nbsp;Sign-Out</a>
            </c:otherwise>
        </c:choose>
    </div>
</nav>

<script>
    console.log("${user.userType.userTypeId}"+"boroplus");
</script>




<!-- Second header -->


<!-- <script>
    const name = document.querySelector('#name');
    const email = document.querySelector('#email');
    const password = document.querySelector('#password');
    const create_account_btn = document.querySelector('#create_account_btn');
    const input_otp_div = document.querySelector('#input_otp_div');
    const input_otp = document.querySelector('#input_otp');
    const send_otp = document.querySelector('#send_otp');
    const contact = document.querySelector('#contact');
    const validate_otp = document.querySelector('#validate_otp');
    const otp_success = document.querySelector('#otp_success');
    const signup_submit = document.querySelector('#signup_submit');
    const email_alert = document.querySelector('#email_alert');
    

    create_account_btn.addEventListener('click', () => {        
        $('#modal_signin').modal('hide');
        $('#modal_signup').modal('show');
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
        $('#modal_signup').modal('hide');
        console.log("prashu");
        email_alert.classList.replace('d-none','d-block');
    });
</script> -->