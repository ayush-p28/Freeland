<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>DashBoard</title>
    <link rel="stylesheet" href="static/css/user_dashboard.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://kit.fontawesome.com/08050841b9.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <link href="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/toasty.css" rel="stylesheet" />
    
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" />
    
  
</head>
<body>
    <%@ include file="header1.jsp" %>
    
    <nav>
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="http://localhost:8080/Freewala_Copy/">Home</a></li>
        <li class="breadcrumb-item active">DashBoard</li>
      </ol>
    </nav>

    <input type="hidden" id="freelancer_id" value="${user.userId}">

<!-- Modal -->
<div class="modal fade" id="view_post_modal" tabindex="-1"aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Job Description</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-4" >
        <h4 id="view_post_modal_title"></h4>
        <div>
          <p class="font-weight-bold pb-0 mb-0">Description</p>
          <p class="pb-2 mb-1" id="view_post_modal_desc"></p>
          
          <p class="font-weight-bold pb-0 mb-0">Date Posted</p>
          <p class="pb-2 mb-1" id="view_post_modal_date"></p>

          <p class="font-weight-bold pb-0 mb-0">Deadline</p>
          <p class="pb-2 mb-1" id="view_post_modal_deadline"></p>
        </div>
        <div id="view_post_modal_tags"></div>

        <div class="row form-inline form-group">
          <div class="col-sm-4 my-1">
              <label for="" style="margin-left: -50px;">Enter:-</label>
              <div class="input-group">
                  <div class="input-group-prepend" id="gg">
                      <div class="input-group-text">&#8377</div>
                  </div>
                  <input type="number" class="form-control" id="amt" value="">
                  <span class="ml-1 col-form-label input-group-addon">/hour</span>
              </div>
          </div>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="apply_btn">Apply Now</button>
      </div>
    </div>
  </div>
</div>

    <div class="container-fluid">
        <div class="row content bg-light py-3">
         <div class="col-sm-1"></div>
          <div class="col-sm-10">
            <div class="card p-3 my-2">
              <h3>Hello,</h3>
              
              <p class="lead text-uppercase font-weight-bold">GoodEvening, ${user.name} </p>
            </div>
            <div class="row">
              <div class="col-sm-6 col-md-3">
                <div class="card bg-c-blue shadow-sm">
                  <div class="card-statistic-3 p-4">
                      <div class="card-icon card-icon-large"><i class="fas fa-shopping-cart"></i></div>
                      <div class="mb-3">
                          <h5 class="card-title mb-0"><i class="fas fa-shopping-cart"></i> &nbsp;New Orders</h5>
                      </div>
                      <div class="row align-items-center mb-2 d-flex">
                        <div class="col-8">
                              <h2 class="d-flex align-items-center mb-0">
                                  3,243
                              </h2>
                          </div>
                          <!-- <div class="col-4 text-right">
                              <span>12.5% <i class="fa fa-arrow-up"></i></span>
                          </div> -->
                      </div>
                      <!-- <div class="progress mt-1 " data-height="8" style="height: 8px;">
                          <div class="progress-bar l-bg-cyan" role="progressbar" data-width="25%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%;"></div>
                      </div> -->
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-3">
                <div class="card l-bg-cherry shadow-sm">
                  <div class="card-statistic-3 p-4">
                      <div class="card-icon card-icon-large"><i class="fas fa-solid fa-grip"></i></div>
                      <div class="mb-3">
                          <h5 class="card-title mb-0"><i class="fas fa-solid fa-grip"></i> &nbsp;Projects</h5>
                      </div>
                      <div class="row align-items-center mb-2 d-flex">
                          <div class="col-8">
                              <h2 class="d-flex align-items-center mb-0">
                                  3,243
                              </h2>
                          </div>
                        </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-3">
                <div class="card bg-c-green shadow-sm">
                  <div class="card-statistic-3 p-4">
                      <div class="card-icon card-icon-large"><i class="fas fa-solid fa-chart-simple"></i></div>
                      <div class="mb-3">
                          <h5 class="card-title mb-0"><i class="fas fa-solid fa-chart-simple"></i> &nbsp; Analytics</h5>
                      </div>
                      <div class="row align-items-center mb-2 d-flex">
                        <div class="col-8">
                          <h2 class="d-flex align-items-center mb-0">
                                  3,243
                              </h2>
                          </div>
                      </div>
                  </div>
                </div>
              </div>
              <div class="col-sm-6 col-md-3">
                <div class="card bg-c-yellow shadow-sm">
                  <div class="card-statistic-3 p-4">
                      <div class="card-icon card-icon-large"><i class="fas fa-dollar-sign"></i></div>
                      <div class="mb-3">
                          <h5 class="card-title mb-0"><i class="fas fa-dollar-sign"></i> &nbsp;Revenue</h5>
                      </div>
                      <div class="row align-items-center mb-2 d-flex">
                        <div class="col-8">
                          <h2 class="d-flex align-items-center mb-0">
                                  3,243
                              </h2>
                          </div>
                      </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="card p-3 my-4">
              <h3 class="mt-2">Jobs you might like</h3><hr>
              <c:forEach var="all_post" items="${free_posts}" varStatus="x">

                  <div class="col-md-12 my-2 card">

                      <input type="hidden" class="so" name="count" value="${x.count}">
                      <input type="hidden" class="so" id="post_id_${x.count}" value="${all_post.postId}">
                      <input type="hidden" class="so" id="subcategory_id_${x.count}" value="${all_post.subcategory.subcategoryId}">
                      <input type="hidden" class="so" id="category_id_${x.count}" value="${all_post.subcategory.category.categoryId}">
                      <input type="hidden" class="so" id="name_${x.count}" value="${all_post.name}">
                      <input type="hidden" class="so" id="description_${x.count}" value="${all_post.description}">
                      <input type="hidden" class="so" id="date_${x.count}" value="${all_post.date}">
                      <input type="hidden" class="so" id="deadline_${x.count}" value="${all_post.deadline}">
                      <input type="hidden" class="so" id="user_id_${x.count}" value="${all_post.user.userId}">
                      <input type="hidden" class="so" id="post_status_id_${x.count}" value="${all_post.postStatus.postStatusId}">
                      
                      <div class="card-body">
                        <h5 class="card-title">${all_post.name} 
                            <button class="btn btn-info float-right" id="butn_${x.count}" onclick="view('${x.count}')"><i class="fa-solid fa-eye"></i>&nbsp;View</button>
                        </h5>
                        
                        <p class="card-text mini_desc">${all_post.description}</p>
                      </div>
                  </div>

              </c:forEach>
            </div>
            <div class="row">
              <div class="col-sm-4">
                <div class="card p-3 my-2">
                  <p>Text</p> 
                  <p>Text</p> 
                  <p>Text</p> 
                </div>
              </div>
              <div class="col-sm-4">
                <div class="card p-3 my-2">
                  <p>Text</p> 
                  <p>Text</p> 
                  <p>Text</p> 
                </div>
              </div>
              <div class="col-sm-4">
                <div class="card p-3 my-2">
                  <p>Text</p> 
                  <p>Text</p> 
                  <p>Text</p> 
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-sm-8">
                <div class="card p-3 my-2">
                  <p>Text</p> 
                </div>
              </div>
              <div class="col-sm-4">
                <div class="card p-3 my-2">
                  <p>Text</p> 
                </div>
              </div>
            </div>
          </div>
         <div class="col-sm-1"></div>

        </div>
      </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/gh/bbbootstrap/libraries@main/toasty.js"></script>
      
    
    <%@ include file="footer1.jsp" %>

    <script src="static/js/user_dashboard.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>