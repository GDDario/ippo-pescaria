<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
  <%@ include file="/util/head.jsp" %>
  <body onload="loadFilters()">
  
    <%@ include file="/components/header.jsp" %>

   <div class="container-fluid">
     <div class="row mt-4">
       <div class="col-2 no-select scrollable">
         <h4 class="d-flex align-items-center gap-2">Filtros <i class="bi bi-funnel-fill"></i></h4>

         <div class="mt-2">
            <div class="form-group">
              <label for="boat-name" class="col-form-label">Nome</label>
              <input
                type="text"
                name="boat-name"
                class="form-control"
                id="boat-name"
                onkeyup="loadFilteredBoats()"
              >
            </div>
         </div>

         <div class="mt-4" id="categories">
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
