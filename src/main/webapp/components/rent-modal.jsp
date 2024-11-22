<%@ page contentType="text/html; charset=UTF-8" %>

<div class="modal fade" id="rent-modal" tabindex="-1" role="dialog" aria-labelledby="rent-modal"" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Realizar o aluguel</h5>
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" action="RentController" name="rent-form">
          <input id="available-rent-dates" required />

          <input type="hidden" id="selected-rent-dates" name="selected-rent-dates" />
          <input type="hidden" id="boat-id" name="boat-id" />

          <div class="form-group">
            <label for="user-description" class="col-form-label">Descreva o que pretende fazer (opcional)</label>
            <textarea name="user-description" rows=4 class="form-control" id="user-description"></textarea>
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
        <button type="submit" class="btn btn-primary">Alugar</button>
      </div>
    </form>
    </div>
  </div>
</div>

<script src="js/rent.js"></script>
<script>
    loadAvailableRents();

    document.addEventListener('DOMContentLoaded', checkModalParameter);
</script>

