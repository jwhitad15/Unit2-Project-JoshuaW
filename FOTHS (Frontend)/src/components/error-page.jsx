import Footer from "./footer/footer";
import FourElementHeader from "./header-components/header-4";

const ErrorPage = () => {

    return (
        <div id="error-main">

           
            <div className="error-header">
                <FourElementHeader/>
            </div>

            <div className="error-container">
                
                <div className="error-title-container"> <h2> Error 404: Page Does Not Exist </h2> </div> <br />

                <div className="error-display-card"> 
                    <h2>We apologize, but there seems to be an error. Our records indicate that the page you are trying to access does not exist. Please return to the home page. </h2>
                </div>

                <div className="return-to-dashboard-button-class">
                   <a id="return-to-dashboard-hyperlink" href="./#/dashboard">Return</a>
                </div>
                
            </div>

            <Footer/>

        </div>

    )
}

export default ErrorPage;