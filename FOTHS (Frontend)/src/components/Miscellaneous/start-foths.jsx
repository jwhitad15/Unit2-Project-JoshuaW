// This component starts the game

import React from "react";
import Animation from "./animation";



const StartFoths = () => {
   
    
    const handleSubmit = (event) => {
        event.preventDefault();
    }

    return (

        <div>

            <div className="foths-start" >
        
                <h1 className="header">FOTHS</h1>
                <p id="login-title">Fruits of the Holy Spirit</p>

                <form className="login-form" onSubmit={handleSubmit}>

                <h4 className="start-page-text">To start the application, press the button below!</h4>
                    <a href="./#/dashboard" className="start-button" text="Hover Effect 2" effecttype="effect2" >Start</a> 
                
                </form> <br />

            </div>

                {/* Scripture Animation */}
                <Animation/>

        </div>
        
    )

}

export default StartFoths;

