import React, {useEffect, useRef, useState} from "react";
import { useNavigate } from "react-router";
import Dashboard from "../../dashboard";
import './user-login.css'
import { CiUser, CiLock } from "react-icons/ci";

function UserRegistration() {
    const firstName=useRef()
    const email=useRef()
    const password=useRef()
    const [showDashboard, setShowDashboard] = useState(false)
    const [show, setShow] = useState(false)
    const localSignup = localStorage.getItem("register");
    const localEmail = localStorage.getItem("email");
    const localPassword = localStorage.getItem("password");
    const localFirstName = localStorage.getItem("firstName");

    useEffect(()=> {
        if(localSignup) {
            setShowDashboard(true)
        }
        if(localEmail) {
            setShow(true)
        }
    })

    let navigate = useNavigate();
    const handleClick = () => {
        if(firstName.current.value && email.current.value && password.current.value) {
            localStorage.setItem("firstName", firstName.current.value)
            localStorage.setItem("email", email.current.value)
            localStorage.setItem("password", password.current.value)
            localStorage.setItem("register", email.current.value)
            alert("Account Registration Successful")
            navigate("/dashboard");
        }
    }

    return(
        <div>

                <div className="registration">
                    <h1 className="header">FOTHS</h1>
                    <p id="login-title">Account Registration</p>

                    <form className="login-form">

                        <fieldset className="legend-border">
                            <legend className="legend-title"> General </legend> <br />

                                <label for="first-name"> 
                                    <CiUser className="icon" />
                                    <input className="registration-textfield" type="text" name="first-name" placeholder="First Name" required />
                                </label> <br /> 
                                
                                <label for="last-name"> <br />
                                    <CiUser className="icon" />
                                    <input className="registration-textfield" type="text" name="last-name" placeholder="Last Name" required />
                                </label> <br /> 


                            <label for="email"><br /> 
                                <CiUser className="icon" />
                                <input className="registration-textfield" type="email" name="email" placeholder="Email" required />
                            </label> <br /> 
                        </fieldset> <br />
                        
                        <fieldset className="legend-border">
                            <legend> Credentials </legend> <br />
                                <label for="username">  
                                    <CiLock className="icon" />
                                    <input className="registration-textfield" type="username" name="username" placeholder="Username" required />
                                </label> <br />

                                <label for="password"> <br />
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