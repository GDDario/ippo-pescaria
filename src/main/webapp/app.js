var toastElList = [].slice.call(document.querySelectorAll('.toast'))
var toastList = toastElList.map(function (toastEl) {
  return new bootstrap.Toast(toastEl)
})

//function showToast() {
//  toastList[0].show()
//}

// Enable Tooltip
var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
  return new bootstrap.Tooltip(tooltipTriggerEl)
})

function goToProductDetails(id) {
  window.location.href = `/ippo-pescaria/product.jsp?id=${id}`;
}

(function () {
  'use strict'

  var forms = document.querySelectorAll('.needs-validation')

  Array.prototype.slice.call(forms)
    .forEach(function (form) {
      form.addEventListener('submit', function (event) {
        if (!form.checkValidity()) {
          event.preventDefault()
          event.stopPropagation()
        }

        form.classList.add('was-validated')
      }, false)
    })
})()

function checkModalParameter() {
  const urlParams = new URLSearchParams(window.location.search);
  const successLogin = urlParams.get('success_login');
  const successRegister = urlParams.get('success_register');

  if (successLogin === 'true') {
    showToast('Logado com sucesso!', 'success');
  }
  if (successRegister === 'true') {
    showToast('Registrado e logado com sucesso!', 'success');
  }
}

document.addEventListener('DOMContentLoaded', checkModalParameter);