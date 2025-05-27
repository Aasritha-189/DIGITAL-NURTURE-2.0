function sendRegistration(data) {
  setTimeout(() => {
    fetch("https://jsonplaceholder.typicode.com/posts", {
      method: "POST",
      body: JSON.stringify(data),
      headers: { "Content-Type": "application/json" }
    })
    .then(res => res.json())
    .then(res => alert("Registration successful!"))
    .catch(() => alert("Failed to register."));
  }, 1000);
}

sendRegistration({ name: "John", email: "john@example.com" });
