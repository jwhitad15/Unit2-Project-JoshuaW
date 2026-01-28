import Footer from "../footer/Footer";
import FourElementHeader from "../header-components/FourElementHeader";
import FOTHS_Logo from "../Miscellaneous/FOTHS_Logo.png";

const Dashboard = () => {

    return (
        <div id="main">
           
            <header className="dashboard-header">
                <FourElementHeader/>
            </header>

            <main>
                <div className="dashboard-title"> To Play a Game, Select a Game Card Below! </div> 
                <a href="./#/foths" id="foths-card-hyperlink" className="FOTHS-dashboard-card">
                    <img src={FOTHS_Logo} className="FOTHS-logo" alt="FOTHS-Logo-Kids" width="90%"/>
                </a> 
                
            </main>

           <Footer/>

        </div>

    )
}

export default Dashboard;


// Testing commit