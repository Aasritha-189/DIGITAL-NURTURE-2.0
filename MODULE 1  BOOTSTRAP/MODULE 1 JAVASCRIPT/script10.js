const event = { name: "Cooking", date: "2025-07-01", seats: 20 };

function printEvent({ name, date }) {
  console.log(`${name} - ${date}`);
}

const newEvents = [...[event]];

printEvent(event);
