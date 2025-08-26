import Footer from "../footer/Footer";
import FourElementHeader from "../header-components/FourElementHeader";

const Dashboard = () => {

    return (
        <div id="main">
           
            <header className="dashboard-header">
                <FourElementHeader/>
            </header>

            <main>
                <div className="dashboard-title"> Dashboard View </div> 
                <a href="./#/foths" id="foths-card-hyperlink" className="FOTHS-dashboard-card"><img src="src/components/Miscellaneous/FOTHS_Logo.png" className="fruit-card-image" alt="graphic-of-orange-fruit" width="90%"/></a> 
                
            </main>

           <Footer/>

        </div>

    )
}

export default Dashboard;