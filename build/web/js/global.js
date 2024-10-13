const loginButton = document.getElementById('login-button');
const loginModal = document.getElementById('login-modal');

loginButton.addEventListener('click', () => {
    document.addEventListener('click', modalClickListener);
    document.addEventListener('keydown', modalKeyDownListener);
    loginModal.classList.add('open');
});

const modalClickListener = function (e) {
    const element = e.target;

    if (element.id === 'login-modal' || element.classList.contains('close-modal')) {
        closeModal();
    }
};

const modalKeyDownListener = function (e) {
    if (e.key === 'Escape') {
        closeModal();
    }
};

function closeModal() {
    loginModal.classList.remove('open');
    document.removeEventListener('click', modalClickListener);
    document.removeEventListener('keydown', modalKeyDownListener);
}