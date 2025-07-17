// grandchild component that displays the dynamic user data on FOTHS main page
import React from "react";



const DisplaySelectedDropdown = (props) => {

    const selections = {
        0: "",
        1: {title: "Complete Faith Study Mode", a:"Set a timer for 31 minutes", b:"Choose 2-3 favorite scriptures", c: "Write each verse 5 times"},
        2: {title: "Complete Faith Recall Mode", a:"Try Recall Quiz", b:"Take notes on missed questions", c: "Retake Recall Quiz"},
        3: {title: "Complete Faith Multichoice Quiz", a:"Try Multichoice Quiz", b:"Take notes on missed questions", c: "Retake Multichhoice Quiz"}
    }
    let notZero = false;

    if (props.goalData !== 0) {
        notZero = true;
    } 

    return (
        <div className="scope-card-list-item">
  
            <div > 

                <p className="scope-display-dropdown-selection"> <b>{selections[props.goalData].title}</b></p>
                <p className="scope-preset-item"> + {selections[props.goalData].a} </p>
                <p className="scope-preset-item"> + {selections[props.goalData].b} </p>
                <p className="scope-preset-item"> + {selections[props.goalData].c} </p>
    

            </div>

        </div>
    );


}



export default DisplaySelectedDropdown;