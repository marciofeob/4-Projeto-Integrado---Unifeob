const user = JSON.parse(localStorage.getItem('user'));
if (!user) window.location.href = 'login.html';

document.getElementById('userName').textContent = user.name;

function logout() {
  localStorage.removeItem('user');
  window.location.href = 'login.html';
}
