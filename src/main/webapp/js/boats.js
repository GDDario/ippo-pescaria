function loadBoats() {
    fetch('/HotBoatsController')
        .then(response => {
            if (!response.ok) {
                throw new Error("Network response was not ok");
            }
            return response.json();
        })
        .then(data => {
            console.log("Boats data:", data);
            displayBoats(data);
        })
        .catch(error => {
            console.error("There was a problem with the fetch operation:", error);
        });
}

function displayBoats(boats) {
    const container = document.getElementById("boats-container");
    container.innerHTML = "";

    boats.forEach(boat => {
        const boatItem = document.createElement("li");
        boatItem.textContent = `${boat.name} - $${boat.price}`;
        container.appendChild(boatItem);
    });
}