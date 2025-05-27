// Using then/catch
fetch("https://jsonplaceholder.typicode.com/posts")
  .then(res => res.json())
  .then(data => console.log(data))
  .catch(err => console.error(err));

// Using async/await
async function loadEvents() {
  document.body.innerHTML += "Loading...";
  try {
    const res = await fetch("https://jsonplaceholder.typicode.com/posts");
    const data = await res.json();
    console.log(data);
  } catch (e) {
    console.error(e);
  }
}
loadEvents();
