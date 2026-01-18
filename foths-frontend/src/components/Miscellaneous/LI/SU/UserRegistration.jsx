import React, {useEffect, useRef, useState} from "react";
// import { useNavigate } from "react-router";
import './UserLogin.css'
import { CiUser, CiLock } from "react-icons/ci";

function UserRegistration() {


    const [formData, setFormData] = useState('');

    const handleClick = (e) => {
        e.preventDefault();
        fetch(`${import.meta.env.VITE_BACKEND_URL}/users/create`, {
            method: 'POST',
            body: JSON.stringify({
                firstName: formData.firstName,
                lastName: formData.lastName,
                email: formData.email,
                username: formData.username,
                password: formData.password
            })
        })
        .then(response => response.json())
        .then(data => {
            console.log('Success:', data);
            alert("Account Registration Successful")})
        .catch(error => {
            console.error('Error:', error);
            alert("Account Registration Failed")
        });
    
    }


    return(
        <div>

                <div className="registration">
                    <h1 className="header">FOTHS</h1>
                    <p id="login-title">Account Registration</p>

                    <form className="login-form" onClick={handleClick}>

                        <fieldset className="legend-border">
                            <legend className="legend-title"> General </legend> <br />

                                <label id="first-name"> 
                                    <CiUser className="icon" />
                                    <input className="registration-textfield" type="text" name="first-name" placeholder="First Name" required />
                                </label> <br /> 
                                
                                <label id="last-name"> <br />
                                    <CiUser className="icon" />
                                    <input className="registration-textfield" type="text" name="last-name" placeholder="Last Name" required />
                                </label> <br /> 


                            <label id="email"><br /> 
                                <CiUser className="icon" />
                                <input className="registration-textfield" type="email" name="email" placeholder="Email" required />
                            </label> <br /> 
                        </fieldset> <br />
                        
                        <fieldset className="legend-border">
                            <legend> Credentials </legend> <br />
                                <label id="username">  
                                    <CiLock className="icon" />
                                    <input className="registration-textfield" type="username" name="username" placeholder="Username" required />
                                </label> <br />

                                <label id="password"> <br />
                                    <CiLock className="icon" />
                                    <input className="registration-textfield" type="password" name="password" placeholder="Password" required />
                                </label> <br /> <br />
                        </fieldset> <br />
        
                        <button className="button-class" onClick={handleClick}>Register</button>
                    </form>
                </div>

        </div>
    )
}

export default UserRegistration;