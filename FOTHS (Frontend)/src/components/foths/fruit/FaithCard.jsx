// Image component that displays graphic on Fruit Cards in FOTHS Main page

import React from "react";
import faithFruit from './Faith.png'

function FaithCard() {
    return (
    <img src={faithFruit} className="fruit-card-image" alt="graphic-of-orange-fruit" width="130px" height="120px" />
    )

}

export default FaithCard;