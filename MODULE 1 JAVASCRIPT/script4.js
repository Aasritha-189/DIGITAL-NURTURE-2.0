function addEvent(name, date, category) {
  return { name, date, category, seats: 10 };
}

function registerUser(event) {
  if (event.seats > 0) {
    event.seats--;
    console.log(`Registered for ${event.name}`);
  }
}

function filterEventsByCategory(events, category, callback) {
  return callback(events.filter(e => e.category === category));
}

// Closure
function createCategoryCounter() {
  let count = 0;
  return function() {
    count++;
    return count;
  };
}

const musicCounter = createCategoryCounter();
console.log(musicCounter());
console.log(musicCounter());
