// custom reusable header component (4 elements)

import React from "react";
import ExitProgram from "./ExitProgram";
import '../admin/admin.css'



const AdminHeader = () => {
    // Retrieve the first name from local storage
    const firstName = localStorage.getItem("firstName") || "Admin";

    return (
        <header className="foths-header">
            <a href="./#/dashboard" id="card-hyperlink" className="admin-header-element"> Dashboard</a>
            <div className="admin-header-element">Welcome, {firstName}</div>
            <ExitProgram />
        </header>
    );
};

export default AdminHeader;