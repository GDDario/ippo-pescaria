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
                <p>${boat.length} m | ${boat.capacity} ${peopleCountText}</p>
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
  });
}

function loadFilters() {
  fetch('http://localhost:8080/ippo-pescaria/FiltersController')
    .then(response => {
      if (!response.ok) {
        throw new Error("Network response was not ok");
      }
      return response.json();
    })
    .then(data => {
      displayCategories(data.categoriesList);
      displayEquipments(data.equipmentsList);
      console.log('Response', data);
      displayRangeFields(data.boatsFiltersDTO);
      //                displayBoats('hot-boats', data);
    })
    .catch(error => {
      console.error("There was a problem with the fetch operation:", error);
    });
}

function onBoatNameSearch(e) {
    console.log(document.getElementById('boat-name').value)
}

function displayCategories(categories) {
  const categoriesContainer = document.getElementById("categories");

  categories.forEach((category) => {
    const content = `
          <div class="form-check">
            <input 
              class="form-check-input" 
              type="checkbox" 
              value="${category.uuid}" 
              id="${category.uuid}" 
              onchange="loadFilteredBoats()"
            >
            <label class="form-check-label" for="${category.uuid}">
              ${category.name}
            </label>
          </div>
        `;

    categoriesContainer.insertAdjacentHTML("beforeend", content);
  });
}

function displayEquipments(equipments) {
  const equipmentsContainer = document.getElementById("equipments");

  equipments.forEach((equipment) => {
    const content = `
          <div class="form-check">
            <input 
              class="form-check-input" 
              type="checkbox" 
              value="${equipment.name}" 
              id="${equipment.name}" 
              onchange="loadFilteredBoats()"
            >
            <label class="form-check-label" for="${equipment.name}">
              ${equipment.name}
            </label>
          </div>
        `;

    equipmentsContainer.insertAdjacentHTML('beforeend', content);
  });
}

function displayRangeFields(rangeFields) {
  const pricePerDayContainer = document.getElementById('price-per-day');
  const capacityContainer = document.getElementById('capacity');
  const cabinsNumberContainer = document.getElementById('cabins-number');
  const boatLengthContainer = document.getElementById('boat-length');
  const enginePowerContainer = document.getElementById('engine-power');
  const manufactureYearContainer = document.getElementById('manufacture-year');

  const pricePerDayContent = `
         <div class="d-flex justify-content-between gap-2">
            <div class="form-group">
              <label for="minimum-price-per-day" class="col-form-label">Minimo</label>
              <input 
                type="number" 
                name="minimum-price-per-day" 
                class="form-control" 
                id="minimum-price-per-day" 
                value=0 
                onchange="loadFilteredBoats()"
              >
            </div>

            <div class="form-group">
              <label for="maximum-price-per-day" class="col-form-label">Maximo</label>
              <input 
                type="number" 
                name="maximum-price-per-day" 
                class="form-control" 
                id="maximum-price-per-day" 
                value=${rangeFields.maxPricePerDay} 
                onchange="loadFilteredBoats()"
              >
            </div>
         </div>
    `;
  pricePerDayContainer.insertAdjacentHTML('beforeend', pricePerDayContent);

  const capacityContent = `
         <div class="d-flex justify-content-between gap-2">
            <div class="form-group">
              <label for="minimum-capacity" class="col-form-label">Minimo</label>
              <input 
                type="number" 
                name="minimum-capacity" 
                class="form-control" 
                id="minimum-capacity" 
                value=0 
                onchange="loadFilteredBoats()"
              >
            </div>

            <div class="form-group">
              <label for="maximum-capacity" class="col-form-label">Maximo</label>
              <input 
                type="number" 
                name="maximum-capacity" 
                class="form-control" 
                id="maximum-capacity" 
                value=${rangeFields.maxCapacity} 
                onchange="loadFilteredBoats()"
              >
            </div>
         </div>
    `;
  capacityContainer.insertAdjacentHTML('beforeend', capacityContent);

  const cabinsNumberContent = `
         <div class="d-flex justify-content-between gap-2">
            <div class="form-group">
              <label for="minimum-cabins-number" class="col-form-label">Minimo</label>
              <input 
                type="number" 
                name="minimum-cabins-number" 
                class="form-control" 
                id="minimum-cabins-number" 
                value=0 
                onchange="loadFilteredBoats()"
              >
            </div>

            <div class="form-group">
              <label for="maximum-cabins-number" class="col-form-label">Maximo</label>
              <input 
                type="number" 
                name="maximum-cabins-number" 
                class="form-control" 
                id="maximum-cabins-number" 
                value=${rangeFields.maxCabinsNumber} 
                onchange="loadFilteredBoats()"
              >
            </div>
         </div>
    `;
  cabinsNumberContainer.insertAdjacentHTML('beforeend', cabinsNumberContent);

  const boatLengthContent = `
         <div class="d-flex justify-content-between gap-2">
            <div class="form-group">
              <label for="minimum-boat-length" class="col-form-label">Minimo</label>
              <input 
                type="number" 
                name="minimum-boat-length" 
                class="form-control" 
                id="minimum-boat-length" 
                value=0 
                onchange="loadFilteredBoats()"
              >
            </div>

            <div class="form-group">
              <label for="maximum-boat-length" class="col-form-label">Maximo</label>
              <input 
                type="number" 
                name="maximum-boat-length" 
                class="form-control" 
                id="maximum-boat-length" 
                value=${rangeFields.maxBoatLength} 
                onchange="loadFilteredBoats()"
              >
            </div>
         </div>
    `;
  boatLengthContainer.insertAdjacentHTML('beforeend', boatLengthContent);

  const enginePowerContent = `
         <div class="d-flex justify-content-between gap-2">
            <div class="form-group">
              <label for="minimum-engine-power" class="col-form-label">Minimo</label>
              <input 
                type="number" 
                name="minimum-engine-power" 
                class="form-control" 
                id="minimum-engine-power" 
                value=0 
                onchange="loadFilteredBoats()"
              >
            </div>

            <div class="form-group">
              <label for="maximum-engine-power" class="col-form-label">Maximo</label>
              <input 
                type="number" 
                name="maximum-engine-power" 
                class="form-control" 
                id="maximum-engine-power" 
                value=${rangeFields.maxEnginePower} 
                onchange="loadFilteredBoats()"
              >
            </div>
         </div>
    `;
  enginePowerContainer.insertAdjacentHTML('beforeend', enginePowerContent);

  const manufactureYearContent = `
         <div class="d-flex justify-content-between gap-2">
            <div class="form-group">
              <label for="start-manufacture-date" class="col-form-label">De</label>
              <input 
                type="number" 
                name="start-manufacture-date" 
                class="form-control" 
                id="start-manufacture-date" 
                value=${rangeFields.manufacturerStartDate} 
                onchange="loadFilteredBoats()"
              >
            </div>

            <div class="form-group">
              <label for="end-manufacture-date" class="col-form-label">Até</label>
              <input 
                type="number" 
                name="end-manufacture-date" 
                class="form-control" 
                id="end-manufacture-date" 
                value=${rangeFields.manufacturerEndDate} 
                onchange="loadFilteredBoats()"
              >
            </div>
         </div>
    `;
  manufactureYearContainer.insertAdjacentHTML('beforeend', manufactureYearContent);

  loadFilteredBoats();
}

function loadFilteredBoats() {
  document.getElementById('filtered-boats').replaceChildren();
  const filters = getFilters();
  console.log('Filters', filters);
  document.getElementById('boats-found').innerHTML = 'Carregando ...';

  const formData = new URLSearchParams(filters).toString();

  fetch('http://localhost:8080/ippo-pescaria/FilteredBoatsController', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    },
    body: formData
  })
    .then(response => {
      if (!response.ok) {
        throw new Error("Network response was not ok");
      }
      return response.json();
    })
    .then(data => {
      displayBoats('filtered-boats', data);
      let boatsFoundText = 'Nenhum barco encontrado!';

      if (data.length > 0) {
        boatsFoundText = `${data.length} barcos encontrados.`;
      }

      document.getElementById('boats-found').innerHTML = boatsFoundText;
    })
    .catch(error => {
      console.error("There was a problem with the fetch operation:", error);
    });
}


function getFilters() {
  const categoriesContainer = document.getElementById("categories");
  const equipmentsContainer = document.getElementById("equipments");
  const pricePerDayContainer = document.getElementById('price-per-day');
  const capacityContainer = document.getElementById('capacity');
  const cabinsNumberContainer = document.getElementById('cabins-number');
  const boatLengthContainer = document.getElementById('boat-length');
  const enginePowerContainer = document.getElementById('engine-power');
  const manufactureYearContainer = document.getElementById('manufacture-year');

  const categoriesArray = Array.from(
    categoriesContainer.querySelectorAll('input[type="checkbox"]')
  )
    .filter(element => element.checked)
    .map(element => element.value);

  const equipmentsArray = Array.from(
    equipmentsContainer.querySelectorAll('input[type="checkbox"]')
  )
    .filter(element => element.checked)
    .map(element => element.value);

  return {
    categoryUuids: categoriesArray,
    equipmentsArray: equipmentsArray,
    "boatName": document.querySelector('#boat-name').value,
    "minLength": boatLengthContainer.querySelector('#minimum-boat-length').value,
    "maxLength": boatLengthContainer.querySelector('#maximum-boat-length').value,
    "minPricePerDay": pricePerDayContainer.querySelector('#minimum-price-per-day').value,
    "maxPricePerDay": pricePerDayContainer.querySelector('#maximum-price-per-day').value,
    "minCapacity": capacityContainer.querySelector('#minimum-capacity').value,
    "maxCapacity": capacityContainer.querySelector('#maximum-capacity').value,
    "minEnginePower": enginePowerContainer.querySelector('#minimum-engine-power').value,
    "maxEnginePower": enginePowerContainer.querySelector('#maximum-engine-power').value,
    "minCabinsNumber": cabinsNumberContainer.querySelector('#minimum-cabins-number').value,
    "maxCabinsNumber": cabinsNumberContainer.querySelector('#maximum-cabins-number').value,
    "manufacturerStartDate": manufactureYearContainer.querySelector('#start-manufacture-date').value,
    "manufacturerEndDate": manufactureYearContainer.querySelector('#end-manufacture-date').value
  };
}

