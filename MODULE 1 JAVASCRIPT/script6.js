let events = [];

events.push({ name: "Baking Workshop", category: "Cooking" });
events.push({ name: "Jazz Night", category: "Music" });

const musicEvents = events.filter(e => e.category === "Music");

const displayCards = events.map(e => `Event: ${e.name}`);

console.log(displayCards);
