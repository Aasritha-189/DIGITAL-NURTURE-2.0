const events = [{ name: "Art Expo", seats: 20 }];

const list = document.querySelector("#eventList");

events.forEach(e => {
  const card = document.createElement("div");
  card.textContent = `${e.name} - Seats: ${e.seats}`;
  list.appendChild(card);
});
