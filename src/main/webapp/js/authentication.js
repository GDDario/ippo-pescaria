const emailRegisterField = document.getElementById('register-email');
const emailRegisterError = document.getElementById('register-email-error');

emailRegisterField.addEventListener('change', (_) => {
    emailRegisterError.style.display = "none";
});