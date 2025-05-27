console.log("Submitting form...");
fetch("https://jsonplaceholder.typicode.com/posts", {
  method: "POST",
  body: JSON.stringify({ test: "debug" }),
  headers: { "Content-Type": "application/json" }
})
.then(res => res.json())
.then(data => {
  console.log("Response received:", data);
})
.catch(err => {
  console.error("Error:", err);
});
