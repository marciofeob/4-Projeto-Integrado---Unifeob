document.getElementById('loginBtn').addEventListener('click', async () => {
  const username = document.getElementById('username').value.trim();
  const password = document.getElementById('password').value.trim();
  const msg = document.getElementById('message');

  msg.textContent = '';

  if (!username || !password) {
    msg.textContent = 'Preencha todos os campos!';
    return;
  }

  try {
    const res = await fetch('http://localhost:3000/api/login', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ username, password })
    });

    const data = await res.json();

    if (data.success) {
      localStorage.setItem('user', JSON.stringify(data.user));
      window.location.href = 'dashboard.html';
    } else {
      msg.textContent = 'Usuário ou senha inválidos!';
    }
  } catch (err) {
    msg.textContent = 'Erro ao conectar ao servidor.';
  }
});
