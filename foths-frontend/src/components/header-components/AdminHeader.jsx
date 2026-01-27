// custom reusable header component (4 elements)

import React from "react";
import ExitProgram from "./ExitProgram";
import '../admin/admin.css'
import { useEffect, useState } from "react";



const AdminHeader = () => {
    // Retrieve the first name from local storage
    const [firstName, setFirstName] = useState("Admin");


// On mount, read localStorage and update firstName
        useEffect(() => {
        const storedName = localStorage.getItem("firstName");
        if (storedName) {
        setFirstName(storedName);
        }
        }, []);

        // Optional improvement: update firstName if localStorage changes while on the page
        useEffect(() => {
        const interval = setInterval(() => {
        const storedName = localStorage.getItem("firstName");
        if (storedName && storedName !== firstName) {
        setFirstName(storedName);
        }
        }, 500); // check every 0.5 seconds

        return () => clearInterval(interval); // cleanup
        }, [firstName]);

    return (
        <header className="foths-header">
            <a href="./#/dashboard" id="card-hyperlink" className="admin-header-element"> Dashboard</a>
            <div className="admin-header-element">Welcome, {firstName}</div>
            <ExitProgram />
        </header>
    );
};

export default AdminHeader;