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

function fetchUser(id) {
  fetch(`http://localhost:3000/users/${id}`)
    .then(response => response.json())
    .then(user => displayUser(user));
}

document.querySelector('#show-user-link').addEventListener('click', function() {
  const id = this.dataset.userId;
  fetchUser(id);
});

function newSessionForm() {
  return `
    <form id="new-session-form">
      <label for="email">Email:</label><br>
      <input type="text" id="email" name="email"><br>
      <label for="password">Password:</label><br>
      <input type="password" id="password" name="password"><br>
      <input type="submit" value="Submit">
    </form>
  `;
}

function displayNewSessionForm() {
  const main = document.querySelector('main');
  main.innerHTML = newSessionForm();
}

document.querySelector('#new-session-link').addEventListener('click', displayNewSessionForm);

document.querySelector('main').addEventListener('submit', function(event) {
  if (event.target.matches('#new-session-form')) {
    event.preventDefault();
    const formData = new FormData(event.target);
    fetch('http://localhost:3000/login', {
      method: 'POST',
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(Object.fromEntries(formData))
    }).then(response => response.json())
      .then(user => {
        localStorage.setItem('currentUserId', user.id);
        displayUser(user);
      });
  }
});
