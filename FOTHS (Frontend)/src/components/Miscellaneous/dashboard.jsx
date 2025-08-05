import Footer from "../footer/footer";
import FourElementHeader from "../header-components/header-4";

const Dashboard = () => {

    return (
        <div id="main">
           
            <header className="dashboard-header">
                <FourElementHeader/>
            </header>

            <main>
                <div className="dashboard-title"> Dashboard View </div> 
                <a href="./#/foths" id="foths-card-hyperlink" className="FOTHS-dashboard-card"><hr style={{width: "70%"}}/>FOTHS<hr style={{width: "70%"}}/></a> 
                
            </main>

           <Footer/>

        </div>

    )
}

export default Dashboard;