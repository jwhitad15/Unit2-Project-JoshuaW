// custom reusable header component (4 elements)

import React from "react";
import ExitProgram from "./ExitProgram";
import '../admin/admin.css'
import { useEffect, useState } from "react";



const AdminHeader = () => {
    // Retrieve the first name from local storage
    const [firstName, setFirstName] = useState(localStorage.getItem("firstName") || "Admin");


  // Update firstName on mount and whenever localStorage changes
    useEffect(() => {
    const handleStorageChange = () => {
    const storedName = localStorage.getItem("firstName");
    if (storedName) setFirstName(storedName);
    };
    
    
    // Listen for storage changes (works across tabs)
    window.addEventListener("storage", handleStorageChange);
    
    
    // Also update immediately in case localStorage was just set
    handleStorageChange();
    
    
    return () => window.removeEventListener("storage", handleStorageChange);
    }, []);

    return (
        <header className="foths-header">
            <a href="./#/dashboard" id="card-hyperlink" className="admin-header-element"> Dashboard </a>
            <div className="admin-header-element">Welcome, {firstName} </div>
            <ExitProgram />
        </header>
    );
};

export default AdminHeader;