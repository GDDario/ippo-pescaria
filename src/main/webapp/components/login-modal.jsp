<%@ page contentType="text/html; charset=UTF-8" %>

<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="login-modal"" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Fazer login</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" action="LoginController" name="login-form">
          <div class="form-group">
            <label for="login-email" class="col-form-label">Email</label>
            <input type="text" name="email" class="form-control" id="login-email" value="test@email.com">
            <c:if test="${not empty sessionScope.emailError}">
                <span class="field-error" id="login-email-error">${sessionScope.emailError}</span>
            </c:if>
          </div>

          <div class="form-group">
            <label for="login-password" class="col-form-label">Senha</label>
            <input type="password" name="password" class="form-control" id="login-password" value="password">
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
        <button type="submit" class="btn btn-primary">Login</button>
      </div>
    </form>
        <div>
            <p style="float: right; margin-right: 16px;">
                <a href="privacy-policy.jsp" about="_blank">Nossa política de dados</a>
            </p>
        </div>
    </div>
  </div>
</div>

<script>
    function checkModalParameter() {
        const urlParams = new URLSearchParams(window.location.search);
        const openModal = urlParams.get('openloginModal');
        const success = urlParams.get('login_success');

        if (openModal === 'true') {
            const myModal = new bootstrap.Modal(document.getElementById('login-modal'));
            myModal.show();

            fetch('ClearSessionAttributesServlet')
                .then(response => {
                    if (!response.ok) {
                        console.error("Erro ao limpar a sessão");
                    }
                });
        }

        if (success === "true") {
            showToast('Logado com sucesso!', 'success');
            window.history.pushState("object or string", "Title", "/ippo-pescaria/" + window.location.href.substring(window.location.href.lastIndexOf('/') + 1).split("?")[0]);
        }
    }

    document.addEventListener('DOMContentLoaded', checkModalParameter);
</script>
