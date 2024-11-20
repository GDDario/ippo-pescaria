<%@ page contentType="text/html; charset=UTF-8" %>

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
    <script src="js/boats.js"></script>
  </head>
  <body onload="loadBoat()">
    <%@ include file="/components/header.jsp" %>

    <%-- <nav aria-label="breadcrumb">
      <ol class="breadcrumb p-3">
        <li class="breadcrumb-item"><a href="/">Home</a></li>
        <li class="breadcrumb-item"><a href="#">Camera</a></li>
        <li class="breadcrumb-item active" aria-current="page">MX-5</li>
      </ol>
    </nav> --%>
    <div class="container mb-5 mt-5">
        <div class="row d-flex flex-row">
            <div class="col-md-5 product-image">
                <img id="boat-img-1" class="img-fluid" src="images/loading-image.gif" alt="" />
            </div>
            <div class="col-md-2 product-small d-flex flex-md-column justify-content-start order-md-first">
                <img id="boat-img-2" class="img-fluid" src="images/loading-image.gif" alt="" />
                <img id="boat-img-3" class="img-fluid" src="images/loading-image.gif" alt="" />
                <img id="boat-img-4" class="img-fluid" src="images/loading-image.gif" alt="" />
            </div>
        
            <div class="col-md-5">
                <h6 id="boat-category" class="text-uppercase text-secondary">Categoria: Lancha</h6>
                <h2 id="boat-name" class="fs-3">Lancha poderosa</h2>
                <p id="capacity-and-cabins-number">Ideal para x pessoas - x cabines</p>
                <p id="enginer-power">Motor com x hp de potência</p>
                <p id="length">6m de comprimento</p>

                <div class="text-secondary text-small">Aluguel ao dia</div>
                <h5 id="price-per-day" class="text-secondary fs-4 fw-bold">R$ 100,00</h4>

                <button class="btn btn-dark w-100 my-5" onclick="showToast()">
                    Alugar
                </button>

            </div>
        </div>

  <div class="container mt-4">
    <h2>Detalhes</h2>
        <h4 class="mt-4">Ideal para</h4>
      <div id="boat-description">Barco confortável ideal para passeios familiares</div>

        <div class="mt-4">
            <h4>Conta com os seguintes equipamentos:</h4>
            <div class="row">
                    <div class="col-4">
                        <ul id="equipments-1" class="list-unstyled">
                        </ul>
                    </div>

                    <div class="col-4">
                        <ul id="equipments-2" class="list-unstyled">
                        </ul>
                    </div>
                </div>
            </div>
      </div>
  </div>

  <%@ include file="/components/footer.jsp" %>

     <script src="app.js"></script>
  </body>
</html>
