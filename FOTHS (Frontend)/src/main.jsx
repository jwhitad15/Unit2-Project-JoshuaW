import { StrictMode } from 'react'
import ReactDOM from 'react-dom/client'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.jsx'
import { SelectionProvider } from './components/foths/SelectionLogic.jsx'

// Create the root
const root = ReactDOM.createRoot(document.getElementById("root"));

// Render the app
root.render(
  <StrictMode>
    <SelectionProvider>
      <App />
    </SelectionProvider>
  </StrictMode>
);

// The final gateway, where the App component is rendered