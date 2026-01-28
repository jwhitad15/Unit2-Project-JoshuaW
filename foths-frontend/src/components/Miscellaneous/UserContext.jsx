// src/context/UserContext.jsx
import { createContext, useState, useEffect } from "react";

export const UserContext = createContext();

export const UserProvider = ({ children }) => {
  const [userType, setUserType] = useState(null); // "admin" or "user"

  useEffect(() => {
    // Optional: restore from localStorage on refresh
    const savedType = localStorage.getItem("userType");
    if (savedType) setUserType(savedType);
  }, []);

  const loginUser = (type) => {
    setUserType(type);
    localStorage.setItem("userType", type);
  };

  const logoutUser = () => {
    setUserType(null);
    localStorage.removeItem("userType");
  };

  return (
    <UserContext.Provider value={{ userType, loginUser, logoutUser }}>
      {children}
    </UserContext.Provider>
  );
};