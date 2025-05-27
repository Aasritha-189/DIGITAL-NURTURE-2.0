document.querySelector("form").addEventListener("submit", function(e) {
  e.preventDefault();
  const name = this.elements["name"].value;
  const email = this.elements["email"].value;
  const event = this.elements["event"].value;

  if (!name || !email) {
    alert("All fields required");
    return;
  }

  console.log(`Name: ${name}, Email: ${email}, Event: ${event}`);
});
