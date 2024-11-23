 <%@ page contentType="text/html; charset=UTF-8" %>


<!DOCTYPE html>
<html lang="en">
  <%@ include file="/util/head.jsp" %>

  <body class="d-flex flex-column">
    <%@ include file="/components/header.jsp" %>

    <div class="container my-5">
        <div>
            <h1 class="text-center">Ippo Pescaria</h1>
        </div>

        <div class="d-flex justify-content-center">
           
            <div class="login-box m-auto mt-5 col-4 text-center">
                <h3 class="text-center">Página não encontrada</h3>
                <i class="bi bi-emoji-frown-fill text-danger success-icon"></i>                 
                <h6>Desculpe, nós não conseguimos encontrar o que você estava procurando.</h6>
                <h6>Vá para a <a href="/ippo-pescaria">página principal</a></h6>
            </div>

        </div>
   
    </div>

    <%@ include file="/components/footer.jsp" %>
  </body>
</html>
