// custom reusable header component (4 elements)

import ExitProgram from "./exit-program-button";
import '../admin/admin.css'



const AdminHeader = () => {

    return (
        <header className="foths-header">
            <a href="./#/dashboard" id="card-hyperlink" className="admin-header-element"> Dashboard</a>
            <div className="admin-header-element">Welcome, [User]</div>
            <ExitProgram/>
        </header>
    )
};

export default AdminHeader;