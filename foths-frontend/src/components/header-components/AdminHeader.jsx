// custom reusable header component (4 elements)

import React from "react";
import ExitProgram from "./ExitProgram";
import '../admin/admin.css'
import { useContext } from "react";
import { UserContext } from "../Miscellaneous/UserContext";



const AdminHeader = () => {
    const { userType } = useContext(UserContext);
    const firstName = localStorage.getItem("firstName") || (userType === "admin" ? "Admin" : "User");

    console.log("AdminHeader sees firstName:", firstName, "userType:", userType);

    return (
        <header className="foths-header">
            <a href="./#/dashboard" id="card-hyperlink" className="admin-header-element"> Dashboard </a>
            <div className="admin-header-element">Welcome, {firstName} </div>
            <ExitProgram />
        </header>
    );
};

export default AdminHeader;