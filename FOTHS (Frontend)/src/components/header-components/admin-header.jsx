// custom reusable header component (4 elements)

import React, {useState} from "react";
import ExitProgram from "./exit-program-button";
import '../admin/admin.css'



const AdminHeader = () => {

    // const [wordData, setWordData] = useState(faithScripture[0])
    // const [val, setVal] = useState(0)

    return (
        <header className="foths-header">
            <a href="./#/dashboard" id="card-hyperlink" className="admin-header-element"> Dashboard</a>
            <div className="admin-header-element">Welcome, [User]</div>
            <ExitProgram/>
        </header>
    )
};

export default AdminHeader;