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
  <body onload="loadFilters()">
    <%@ include file="/components/header.jsp" %>

   <div class="container-fluid">
     <div class="row mt-4">
       <div class="col-2 no-select scrollable">
         <h4 class="d-flex align-items-center gap-2">Filtros <i class="bi bi-funnel-fill"></i></h4>

         <div id="categories" class="mt-4">
            <h5>Tipos de barco</h5>
         </div>

         <hr>

         <div id="price-per-day">
            <h5>Preço por dia<h5>
         </div>

        <hr>

         <div id="capacity">
            <h5>Capacidade<h5>
         </div>

         <hr>

        <div id="cabins-number">
            <h5>Numero de cabines<h5>
         </div>

         <hr>

         <div id="boat-length">
             <h5>Comprimento do barco<h5>
          </div>

          <hr>

        <div id="engine-power">
             <h5>Poder do motor<h5>
        </div>
        
        <hr>

        <div id="manufacture-year">
          <h5>Ano de fabricação<h5>
        </div>

        <hr>

         <div id="equipments">
            <h5>Equipamentos</h5>
         </div>

       </div>

       <div class="col-10">
         <h4>Barcos</h4>

         <p id="boats-found">Carregando ...</p>
         <div id="filtered-boats" class="row mt-4"></div>
       </div>
     </div>
   </div>
    
    <%@ include file="/components/footer.jsp" %>

    <script src="app.js"></script>
  </body>
</html>
