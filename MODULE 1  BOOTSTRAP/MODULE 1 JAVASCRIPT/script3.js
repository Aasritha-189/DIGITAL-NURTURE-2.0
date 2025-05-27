const events = [
  { name: "Cleanup", date: "2025-06-15", seats: 10 },
  { name: "Music Fest", date: "2025-04-01", seats: 0 },
  { name: "Art Fair", date: "2025-08-20", seats: 5 }
];

const today = new Date("2025-05-27");

events.forEach(event => {
  const eventDate = new Date(event.date);
  if (eventDate > today && event.seats > 0) {
    console.log(`Upcoming Event: ${event.name}`);
  }
});

function register(eventName) {
  try {
    const event = events.find(e => e.name === eventName);
    if (!event || event.seats <= 0) throw "Registration failed";
    event.seats--;
    console.log(`Registered for ${eventName}. Remaining: ${event.seats}`);
  } catch (error) {
    console.error(error);
  }
}
