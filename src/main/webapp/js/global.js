const loginButton = document.getElementById('login-button');
const authModal = document.getElementById('auth-modal');

loginButton.addEventListener('click', () => {
    document.addEventListener('click', modalClickListener);
    document.addEventListener('keydown', modalKeyDownListener);
    authModal.classList.add('open');
});

const modalClickListener = function (e) {
    const element = e.target;

    if (element.id === 'auth-modal' || element.classList.contains('close-modal')) {
        closeModal();
    }
};

const modalKeyDownListener = function (e) {
    if (e.key === 'Escape') {
        closeModal();
    }
};

function closeModal() {
    authModal.classList.remove('open');
    document.removeEventListener('click', modalClickListener);
    document.removeEventListener('keydown', modalKeyDownListener);
}

function changeToRegisterForm() {
    document.getElementsByClassName('modal-body login')[0].classList.remove('open');
    document.getElementsByClassName('modal-body register')[0].classList.add('open');
}

function changeToLoginForm() {
    document.getElementsByClassName('modal-body register')[0].classList.remove('open');
    document.getElementsByClassName('modal-body login')[0].classList.add('open');
}