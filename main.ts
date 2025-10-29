import path from 'path';
import { app, BrowserWindow } from 'electron';

function createWindow() {
  const win = new BrowserWindow({
    width: 1000,
    height: 700,
    webPreferences: {
      preload: path.join(__dirname, '../preload.js'),
    },
  });

  // Caminho absoluto relativo ao diretório raiz do projeto
  const indexPath = path.join(__dirname, '../renderer/views/login.html');
  win.loadFile(indexPath);
}

app.whenReady().then(createWindow);
