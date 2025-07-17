// custom reusable header component (4 elements)

import ExitProgram from "./exit-program-button";

const FetchtHeader = () => {

    return (
        <header className="foths-header">
               <a href="./#/dashboard" id="card-hyperlink" className="header-element-3"> Dashboard</a>
            <div className="header-fetch-title"> <b>FOTHS User Accounts</b> </div>
            <ExitProgram/>
        </header>
    )
};

export default FetchtHeader;