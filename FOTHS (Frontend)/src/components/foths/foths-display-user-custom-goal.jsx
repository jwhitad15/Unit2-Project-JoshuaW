// grandchild component that displays the dynamic user data on FOTHS main page
import React from "react";


const DisplayCustomGoal = (props) => {



    return (
        <div >
                <div className="desktop-custom-goal">
                <p className="scope-card-list-item"> <b>{props.customTitle}</b> </p> 
                <p className="scope-card-list-item"> + {props.data} </p>  <br></br> 
                </div>
                
                <div className="mobile-response-custom-goal">
                <p className="scope-card-list-item"> <b>{props.customTitle}</b> </p> 
                <p className="scope-card-list-item"> + {props.data} </p>  <br></br> 
                </div>
        </div>
    );


}



export default DisplayCustomGoal;