document.querySelector("#registerBtn").onclick = () => alert("Registered!");

document.querySelector("#category").onchange = e => {
  console.log(`Selected: ${e.target.value}`);
};

document.querySelector("#search").addEventListener("keydown", e => {
  if (e.key === "Enter") {
    console.log(`Searching for: ${e.target.value}`);
  }
});
