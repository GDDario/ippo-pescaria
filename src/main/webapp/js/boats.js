function loadBoats() {
    fetch('http://localhost:8080/ippo-pescaria/HotBoatsController')
        .then(response => {
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.json();
        })
        .then(data => {
            displayBoats('hot-boats', data);
        })
        .catch(error => {
            console.error("There was a problem with the fetch operation:", error);
        });
}

function displayBoats(boatsContainerId, boats) {
    const boatsContainer = document.getElementById(boatsContainerId);


    boats.forEach((boat) => {
        const metersCountText = boat.length === 1 ? 'metro' : 'metros';
        const peopleCountText = boat.capacity === 1 ? 'pessoa' : 'pessoas';

        const content = `
          <div class="col-xl-3 col-lg-4 col-md-6 position-relative">
            <div class="card product-item">
              <i class="bi bi-heart-fill position-absolute liked"></i>
              <i class="bi bi-heart position-absolute like"></i>
              <a href="/ippo-pescaria/boat.jsp?id=${boat.uuid}">
                  <img src="images/product-1-square.jpg" class="card-img-top" alt="..."
                    data-bs-toggle="tooltip" data-bs-placement="top" title="Clique para acessar todos os dados do barco">
              </a>
              <div class="card-body cursor-text">
                <div class="d-flex justify-content-between align-items-center">
                    <h6 class="card-subtitle mb-2 text-muted fw-light">${boat.category.name}</h6>
                     <h6 class="card-subtitle mb-2 text-muted fw-light">${boat.enginePower} hp</h6>
                </div>
                <h5 class="card-title">${boat.name}</h5>
                <p>${boat.length} metros - ${boat.capacity} ${peopleCountText}</p>
                <p>R$ ${boat.pricePerDay},00 ao dia</p>
                <!--
                <p class="card-text price"><span class="float-end rating-stars">
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                    <i class="bi bi-star-fill"></i>
                  </span></p>
                  -->
                <div class="text-center">
                  <a href="/ippo-pescaria/boat.jsp?id=${boat.uuid}" class="btn btn-dark w-100" role="button">Visualizar</a>
                </div>
              </div>
            </div>
          </div>
        `;

        boatsContainer.insertAdjacentHTML("beforeend", content);
    })
}