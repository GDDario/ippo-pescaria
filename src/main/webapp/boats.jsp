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
  <body onload="getFilters()">
    <%@ include file="/components/header.jsp" %>

   <div class="container-fluid">
     <div class="row mt-4">
       <div class="col-2 no-select">
         <h4>Filtros</h4>

         <div>
            <h5>Tipos</h5>

            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
              <label class="form-check-label" for="flexCheckDefault">
                Default checkbox
              </label>
            </div>

            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault2">
              <label class="form-check-label" for="flexCheckDefault2">
                Default checkbox
              </label>
            </div>
         </div>

         <hr>

         <div>
            <h5>Preco por dia<h5>

            <div class="d-flex justify-content-between gap-2">
                <div class="form-group">
                  <label for="register-name" class="col-form-label">Minimo</label>
                  <input type="number" name="name" class="form-control" id="register-name" value="Makunouchi Ippo">
                </div>

                <div class="form-group">
                  <label for="register-name" class="col-form-label">Maximo</label>
                  <input type="number" name="name" class="form-control" id="register-name" value="Makunouchi Ippo">
                </div>
            </div>
         </div>

         <div>
            <h5>Capacidade<h5>

            <div class="d-flex justify-content-between gap-2">
                <input>
                <label>Pessoas</label>
            </div>
         </div>

        <div>
            <h5>Numero de cabines<h5>

            <div class="d-flex justify-content-between gap-2">
                <input>
                <label>cabines</label>
            </div>
         </div>
         <div>
             <h5>Comprimento do barco<h5>

             <div class="d-flex justify-content-between gap-2">
                 <div class="form-group">
                   <label for="register-name" class="col-form-label">Minimo</label>
                   <input type="number" name="name" class="form-control" id="register-name" value="Makunouchi Ippo">
                 </div>

                 <div class="form-group">
                   <label for="register-name" class="col-form-label">Maximo</label>
                   <input type="number" name="name" class="form-control" id="register-name" value="Makunouchi Ippo">
                 </div>
             </div>
          </div>

        <div>
             <h5>Poder do motor<h5>

             <div class="d-flex justify-content-between gap-2">
                 <div class="form-group">
                   <label for="register-name" class="col-form-label">Minimo</label>
                   <input type="number" name="name" class="form-control" id="register-name" value="Makunouchi Ippo">
                 </div>

                 <div class="form-group">
                   <label for="register-name" class="col-form-label">Maximo</label>
                   <input type="number" name="name" class="form-control" id="register-name" value="Makunouchi Ippo">
                 </div>
             </div>
        </div>

         <div>
            <h5>Equipamentos</h5>

            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
              <label class="form-check-label" for="flexCheckDefault">
                Wakeboard
              </label>
            </div>

            <div class="form-check">
              <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault2">
              <label class="form-check-label" for="flexCheckDefault2">
                Ar-condicionado
              </label>
            </div>
         </div>

       </div>

       <div class="col-10">
         <h4>Barcos</h4>

         <p>x barcos encontrados</p>
       </div>
     </div>
   </div>
    
      <%@ include file="/components/footer.jsp" %>

      <script src="app.js"></script>
  </body>
</html>
