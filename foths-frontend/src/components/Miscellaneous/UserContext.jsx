// src/context/UserContext.jsx
import { createContext, useState, useEffect } from "react";

export const UserContext = createContext();

export const UserProvider = ({ children }) => {
    const [userType, setUserType] = useState(null); // "admin" or "user"
    const [userInfo, setUserInfo] = useState({}); // { firstName, lastName, email, username }
    
    
    useEffect(() => {
    // restore from localStorage if present
    const savedType = localStorage.getItem("userType");
    const savedInfo = JSON.parse(localStorage.getItem("userInfo") || "{}");
    if (savedType) setUserType(savedType);
    if (savedInfo.firstName) setUserInfo(savedInfo);
    }, []);
    
    
    const loginUser = (type, info = {}) => {
    setUserType(type);
    setUserInfo(info);
    localStorage.setItem("userType", type);
    localStorage.setItem("userInfo", JSON.stringify(info));
    };
    
    
    const logoutUser = () => {
    setUserType(null);
    setUserInfo({});
    localStorage.removeItem("userType");
    localStorage.removeItem("userInfo");
    };
    
    
    return (
    <UserContext.Provider value={{ userType, userInfo, loginUser, logoutUser }}>
    {children}
    </UserContext.Provider>
    );
    };