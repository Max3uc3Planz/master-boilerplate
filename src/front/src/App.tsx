import React from 'react';
import logo from './logo.svg';
import './App.css';
import UserApi from "./api/user-api";

const executeClick = async () => {
  const users = await UserApi.getAll();
  console.log("Print user response", users);
}

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.tsx</code> and save to reload.
        </p>
        <button onClick={executeClick}>Click on me for test API</button>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
