function newUserForm() {
  return `
    <form id="new-user-form">
      <label for="username">Username:</label><br>
      <input type="text" id="username" name="username"><br>
      <label for="email">Email:</label><br>
      <input type="text" id="email" name="email"><br>
      <label for="password">Password:</label><br>
      <input type="password" id="password" name="password"><br>
      <input type="submit" value="Submit">
    </form>
  `;
}

function displayNewUserForm() {
  const main = document.querySelector('main');
  main.innerHTML = newUserForm();
}

document.querySelector('#new-user-link').addEventListener('click', displayNewUserForm);

document.querySelector('main').addEventListener('submit', function(event) {
  if (event.target.matches('#new-user-form')) {
    event.preventDefault();
    const formData = new FormData(event.target);
    fetch('http://localhost:3000/users', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(Object.fromEntries(formData))
    }).then(response => response.json())
      .then(user => displayUser(user));
  }
});

function displayUser(user) {
  const main = document.querySelector('main');
  main.innerHTML = `
    <h1>${user.username}</h1>
    <p>${user.email}</p>
  `;
}
