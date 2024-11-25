<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <%@ include file="/util/head.jsp" %>

  <body onload="loadBoat()">
    <%@ include file="/components/header.jsp" %>
    <%@ include file="/components/rent-modal.jsp" %>

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

                 <%
                    if (session.getAttribute("isLoggedIn") != null) {
                %>
                <button class="btn btn-dark w-100 my-5" data-bs-toggle="modal" data-bs-target="#rent-modal">
                    Alugar
                </button>
                <%
                    } else {
                %>
                <button class="btn btn-dark w-100 my-5" data-bs-toggle="modal" data-bs-target="#login-modal">
                    Alugar
                </button>
                <%
                }
                %>
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
  <%@ include file="/components/toast.jsp" %>

  </body>
</html>
