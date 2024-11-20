<%@ page contentType="text/html; charset=UTF-8" %>

<div class="modal fade" id="register-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Criar uma conta</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" action="RegisterController" name="register-form">
          <div class="form-group">
            <label for="register-name" class="col-form-label">Nome</label>
            <input type="text" name="name" class="form-control" id="register-name" value="Makunouchi Ippo">
          </div>

          <div class="form-group">
            <label for="register-email" class="col-form-label">Email</label>
            <input type="text" name="email" class="form-control" id="register-email" value="test@email.com">
            <c:if test="${not empty sessionScope.emailError}">
                <span class="field-error" id="register-email-error">${sessionScope.emailError}</span>
            </c:if>
          </div>

          <div class="form-group">
            <label for="register-birth-date" class="col-form-label">Data de nascimento</label>
            <input type="text" name="birth-date" class="form-control" id="register-birth-date" value="2001-10-12">
          </div>

          <div class="form-group">
            <label for="register-password" class="col-form-label">Senha</label>
            <input type="password" name="password" class="form-control" id="register-password" value="password">
          </div>

          <div class="form-group">
            <label for="register-password-confirmation" class="col-form-label">Senha</label>
            <input type="password" name="password-confirmation" class="form-control" id="register-password-confirmation" value="password">
            <c:if test="${not empty sessionScope.passwordConfirmationError}">
                <span class="field-error">${sessionScope.passwordConfirmationError}</span>
            </c:if>
          </div>
          <%-- <div class="form-group">
            <label for="message-text" class="col-form-label">Message:</label>
            <textarea class="form-control" id="message-text"></textarea>
          </div> --%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
        <button type="submit" class="btn btn-primary">Cadastrar</button>
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
        const openModal = urlParams.get('openRegisterModal');

        if (openModal === 'true') {
            const myModal = new bootstrap.Modal(document.getElementById('register-modal'));
            myModal.show();

            fetch('ClearSessionAttributesServlet')
                .then(response => {
                    if (!response.ok) {
                        console.error("Erro ao limpar a sessão");
                    }
                });
        }
    }

    document.addEventListener('DOMContentLoaded', checkModalParameter);
</script>
