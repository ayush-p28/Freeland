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



