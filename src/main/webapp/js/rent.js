let selectedRentDates = [];

function loadAvailableRents() {
  const queryString = window.location.search;
  const urlParams = new URLSearchParams(queryString);
  const id = urlParams.get('id');
  document.getElementById('boat-id').value = id;

  fetch(`http://localhost:8080/ippo-pescaria/UnavailableRentsController?boat_id=${id}`)
    .then(response => {
      if (!response.ok) {
        throw new Error("Network response was not ok");
      }
      return response.json();
    })
    .then(data => {
      loadCalendar(data)
    })
    .catch(error => {
      console.error("There was a problem with the fetch operation:", error);
    });
}

function loadCalendar(datesRange) {
  console.log("loading calendar")

  const disabledDates = datesRange.map((date) => ({
    from: date.dateStart,
    to: date.dateEnd
  }))

  flatpickr("#available-rent-dates", {
    mode: "range",
    disable: disabledDates,
    dateFormat: "Y-m-d",
    minDate: "today",
    onClose: function (selectedDates) {
      selectedRentDates = selectedDates.map((date) => date.toISOString().split('T')[0]);
      document.getElementById('selected-rent-dates').value = selectedRentDates;
      console.log('setted value', document.getElementById('selected-rent-dates').value)
    }
  });
}

function loadRents() {
  fetch(`http://localhost:8080/ippo-pescaria/RentController`)
    .then(response => {
      if (!response.ok) {
        throw new Error("Network response was not ok");
      }
      return response.json();
    })
    .then(data => {
      displayRents(data);
    })
    .catch(error => {
      console.error("There was a problem with the fetch operation:", error);
    });
}

function displayRents(rents) {
  const container = document.getElementById('table-body');

  rents.forEach((rent) => {
    const content = `
      <tr>
        <td>${rent.id}</td>
        <td>${rent.boatName}</td>
        <td>${rent.daysRented}</td>
        <td>${formatDate(rent.dateStart)}</td>
        <td>${formatDate(rent.dateEnd)}</td>
        <td>R$ ${rent.total},00</td>
        <td>${formatDateTime(rent.createdAt)}</td>
        <td>
          <button class="btn btn-primary">
            <i class="bi bi-clipboard"></i>
            Detalhes
          </button>

          <button class="btn btn-danger">
            <i class="bi bi-x"></i>
            Cancelar
          </button>
        </td>
      </tr>
    `;

    container.insertAdjacentHTML("beforeend", content);
  });
}

function formatDate(date) {
  const splitedDate = date.split('-');

  return `${splitedDate[2]}/${splitedDate[1]}/${splitedDate[0]}`;
}

function formatDateTime(dateTime) {
  const date = new Date(dateTime);

  const formatedDateTime = date.toLocaleString("pt-BR", {
    day: "2-digit",
    month: "2-digit",
    year: "numeric",
    hour: "2-digit",
    minute: "2-digit",
    second: "2-digit",
  });

  return formatedDateTime;
}