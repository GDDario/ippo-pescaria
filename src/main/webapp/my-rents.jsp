<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<%@ include file="/util/head.jsp" %>

<body onload="loadRents()">
  <%@ include file="/components/header.jsp" %>

  <main class="container my-4" style="min-height: 72vh">
    <h1>Meus aluguéis</h1>

    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Barco</th>
          <th scope="col">Dias alugado</th>
          <th scope="col">Início</th>
          <th scope="col">Fim</th>
          <th scope="col">Valor total</th>
          <th scope="col">Dia do aluguél</th>
        </tr>
      </thead>
      <tbody id="table-body">
      </tbody>
    </table>
  </main>

  <%@ include file="/components/footer.jsp" %>

  <script src="js/rent.js"></script>
</body>

</html>