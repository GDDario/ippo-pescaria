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
