 <div id="toastContainer" 
         class="position-fixed top-0 end-0 p-3" 
         style="z-index: 1055;">
        <!-- Toasts serão inseridos dinamicamente aqui -->
    </div>

    
<script>
function showToast(message, type) {
    if (!message || typeof message !== 'string') {
        console.error('Erro: A mensagem do toast precisa ser uma string válida.');
        return;
    }

    const toastContainer = document.getElementById('toastContainer');

    const className = 'toast align-items-center text-white bg-' + type + ' border-0'; 
    const toast = document.createElement('div');
    toast.className = className;
    toast.role = 'alert';
    toast.ariaLive = 'assertive';
    toast.ariaAtomic = 'true';

    const body = `
        <div class="d-flex">
            <div class="toast-body">
                ` + message + `
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    `;
    toast.innerHTML = body;

    toastContainer.appendChild(toast);

    const bsToast = new bootstrap.Toast(toast, { delay: 3000 }); // Duração de 3 segundos
    bsToast.show();

    toast.addEventListener('hidden.bs.toast', () => {
        toast.remove();
    });
}

</script>