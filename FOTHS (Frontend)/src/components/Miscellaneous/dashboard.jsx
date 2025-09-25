import Footer from "../footer/Footer";
<<<<<<< HEAD
import FourElementHeader from "../header-components/header-4";
=======
import FourElementHeader from "../header-components/FourElementHeader";
>>>>>>> 125a6033fb47cc265ced4b92411adc8de58196a7

const Dashboard = () => {

    return (
        <div id="main">
           
            <header className="dashboard-header">
                <FourElementHeader/>
            </header>

            <main>
                <div className="dashboard-title"> To Play a Game, Select a Game Card Below! </div> 
                <a href="./#/foths" id="foths-card-hyperlink" className="FOTHS-dashboard-card"><img src="src/components/Miscellaneous/FOTHS_Logo.png" className="FOTHS-logo" alt="graphic-of-orange-fruit" width="90%"/></a> 
                
            </main>

           <Footer/>

        </div>

    )
}

export default Dashboard;