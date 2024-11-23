<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<%@ include file="/util/head.jsp" %>

<body onload="loadBoats()">
  <%@ include file="/components/header.jsp" %>

  <div id="carouselExampleDark" class="carousel carousel-dark slide mb-5" data-bs-ride="carousel">
    <ol class="carousel-indicators">
      <li data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active"></li>
      <li data-bs-target="#carouselExampleDark" data-bs-slide-to="1"></li>
      <li data-bs-target="#carouselExampleDark" data-bs-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active" data-bs-interval="3000">
        <img src="img/carousel/carousel-1.jpg" class="d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <h5>Férias nesse verão?</h5>
          <p>Confira nossa frota selecionada para o verão de 2025</p>
        </div>
      </div>
      <div class="carousel-item" data-bs-interval="3000">
        <img src="img/carousel/carousel-2.jpg" class="d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <h5>Nova sede</h5>
          <p>Conheça nossa sede em Veneza - Italia</p>
        </div>
      </div>
      <div class="carousel-item" data-bs-interval="3000">
        <img src="img/carousel/carousel-3.jpg" class="d-block w-100" alt="...">
        <div class="carousel-caption d-none d-md-block">
          <h5>Barcos parados?</h5>
          <p>Conheça nosso plano especial de terceirizacao de frota</p>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleDark" role="button" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleDark" role="button" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </a>
  </div>

  <!-- End of Carousel -->
  <div class="container mb-5">
    <h3>Confira os barcos mais quentes dessa semana 🔥</h3>

    <div id="hot-boats" class="row mt-4">
    </div>
  </div>
  
  <%@ include file="/components/footer.jsp" %>

  <script src="app.js"></script>
  
  <%@ include file="/components/toast.jsp" %>

</body>

</html>