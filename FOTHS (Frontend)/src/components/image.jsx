// Image component that displays graphic on Fruit Cards in FOTHS Main page

import React from "react";
import image from '../images/1.png'
function Image() {
    return (
    <img src={image} className="fruit-card-image" alt="graphic-of-orange-fruit" width="130px" height="120px" />
    )

}

export default Image;