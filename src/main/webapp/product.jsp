<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <!-- CSS only -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css"
    />
    <link rel="stylesheet" href="style.css" />
    <!-- JavaScript Bundle with Popper -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <%@ include file="/components/header.jsp" %>

    <!-- End of Navigation -->
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb p-3">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Camera</a></li>
        <li class="breadcrumb-item active" aria-current="page">MX-5</li>
      </ol>
    </nav>
    <div class="container mb-5">
        <div class="row d-flex flex-row">
            <div class="col-md-5 product-image">
                <img class="img-fluid" src="images/product-1-square.jpg" alt="" />
            </div>
            <div class="col-md-2 product-small d-flex flex-md-column justify-content-start order-md-first">
                <img class="img-fluid" src="images/product-1-square.jpg" alt="" />
                <img class="img-fluid" src="images/product-1-square.jpg" alt="" />
                <img class="img-fluid" src="images/product-1-square.jpg" alt="" />
            </div>
        
            <div class="col-md-5">
                <h6 class="text-uppercase text-secondary">Sony</h6>
                <h2 class="fs-3">WMX headphone</h2>
                <h5 class="text-secondary fs-6 fw-bold">$100</h5>
                <div class="text-secondary text-small">color :</div>
                <div class="my-2">
                  <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                    <input type="radio" class="btn-check" name="btnradio" id="btnradio1" autocomplete="off" checked>
                    <label class="btn btn-danger color-label" for="btnradio1">
                      <i class="bi bi-check2"></i>
                    </label>
                  
                    <input type="radio" class="btn-check" name="btnradio" id="btnradio2" autocomplete="off">
                    <label class="btn btn-success color-label" for="btnradio2">
                      <i class="bi bi-check2"></i>
                    </label>
                  
                    <input type="radio" class="btn-check" name="btnradio" id="btnradio3" autocomplete="off">
                    <label class="btn btn-dark color-label" for="btnradio3">
                      <i class="bi bi-check2"></i>
                    </label>
                  </div>
                </div>
                <div class="text-secondary text-small">size :</div>
                <div class="my-2">
                  <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                    <input type="radio" class="btn-check" name="size" id="btnradio4" autocomplete="off" checked>
                    <label class="btn btn-outline-dark" for="btnradio4">S</label>
                  
                    <input type="radio" class="btn-check" name="size" id="btnradio5" autocomplete="off">
                    <label class="btn btn-outline-dark" for="btnradio5">M</label>
                  
                    <input type="radio" class="btn-check" name="size" id="btnradio6" autocomplete="off">
                    <label class="btn btn-outline-dark" for="btnradio6">L</label>
                  </div>
                </div>
               
                <button class="btn btn-dark w-100 my-5" onclick="showToast()"><i class="bi bi-cart-plus-fill"></i>
                    Add to Cart </button>
                <div>
                  <span class="text-secondary text-small">Details :</span>
                  
                    <div class="accordion accordion-flush" id="accordionExample">
                        <div class="accordion-item">
                          <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                              Accordion Item #1
                            </button>
                          </h2>
                          <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                              <strong>This is the first item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                            </div>
                          </div>
                        </div>
                        <div class="accordion-item">
                          <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                              Accordion Item #2
                            </button>
                          </h2>
                          <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                              <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                            </div>
                          </div>
                        </div>
                        <div class="accordion-item">
                          <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                              Accordion Item #3
                            </button>
                          </h2>
                          <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                              <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
                            </div>
                          </div>
                        </div>
                      </div>
                </div>
            </div>
        </div>
    
    </div>

    <div class="footer mt-auto bg-dark text-light">
      <div class="container py-3">
          <div class="row d-flex footer-items">
              <div class="col-lg-4">
                  <h5>Categories</h5>
                  <ul>
                      <li><a href="#">Watches</a></li>
                      <li><a href="#">Mobiles</a></li>
                      <li><a href="#">Tablets</a></li>
                      <li><a href="#">Audio</a></li>
                      <li><a href="#">Drones</a></li>
                  </ul>
              </div>
              <div class="col-lg-4">
                 <h5>Useful Links</h5>
                 <ul>
                     <li><a href="#">Terms</a></li>
                     <li><a href="#">Privacy</a></li>
                     <li><a href="#">About us</a></li>
                     <li><a href="#">Mission</a></li>
                 </ul>
             </div>
             <div class="col-lg-4">
                 <h5>Get Updates</h5>
                 <div class="d-flex subscribe">
                     <input type="text" class="form-control">
                     <button class="btn btn-warning">Subscribe</button>
                 </div>
                 <div class="mt-2">
                  <div class="btn-group me-2 social-icons" role="group" aria-label="First group">
                    <button type="button" class="btn btn-secondary mx-1 d-flex flex-column justify-content-center align-items-center">
                      <i class="bi bi-facebook"></i>
                    </button>
                    <button type="button" class="btn btn-secondary mx-1 d-flex flex-column justify-content-center align-items-center">
                      <i class="bi bi-instagram"></i>
                    </button>                      
                    <button type="button" class="btn btn-secondary mx-1 d-flex flex-column justify-content-center align-items-center">
                      <i class="bi bi-twitter"></i>
                    </button>                      
                    <button type="button" class="btn btn-secondary mx-1 d-flex flex-column justify-content-center align-items-center">
                      <i class="bi bi-linkedin"></i>
                    </button>                   
                   </div>
                 </div>
             </div>
         </div>
         <div class="row text-center">
           <span>@coderdost</span>
         </div>
      </div>
   
  </div>
  <!-- End of Footer -->
       <div class="toast d-flex align-items-center text-white bg-primary border-0 position-fixed" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-body">
          Item is successfully added to your cart.
        </div>
        <button type="button" class="btn-close btn-close-white ms-auto me-2" data-bs-dismiss="toast" aria-label="Close"></button>
      </div>
      <!-- End of Toast -->
      <script src="app.js"></script>
  </body>
</html>
