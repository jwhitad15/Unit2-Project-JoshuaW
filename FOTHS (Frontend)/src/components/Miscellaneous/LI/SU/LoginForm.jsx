// This page is for Admin to be able to login to the backend of the app and see all user accounts related to the app.
// The login component navigates to a fetch feature that represents what it would be like to retrieve user account data.

import { useState } from "react";
import React from "react";
import { useNavigate, Link } from "react-router-dom";
import { CiUser, CiLock } from "react-icons/ci";


const LoginForm = () => {
    const navigate = useNavigate();
    const [formData, setFormData] = useState({ username: "", password: ""});
    const [isNotValid, setIsNotValid] = useState(false);

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData((input) => ({...input, [name]: value}));
    }

    const handleSubmit = async (e) => {
        e.preventDefault();
    
        try {
            // Make an API call to validate the username and password
            const response = await fetch("http://localhost:8080/login", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(formData),
            });
    
            console.log("Response status:", response.status);
    
            if (!response.ok) {
                throw new Error("Failed to validate credentials");
            }
    
            const data = await response.json();
            console.log("Backend response:", data); // Debug the response structure
    
            // Check the response from the backend
        if (data.username === formData.username && data.password === formData.password) {
            // Store the user's first name in local storage
            localStorage.setItem("firstName", data.firstName);
            localStorage.setItem("fullName", data.firstName + " " + data.lastName); 
            localStorage.setItem("email", data.email);
            localStorage.setItem("username", data.username);    
            localStorage.setItem("password", data.password); // Store the password for future use

            // Check if both username and password contain the substring 'admin_'
            if (formData.username.includes("admin_") && formData.password.includes("Admin:")) {
                console.log("Navigating to admin dashboard...");
                navigate("/admin");
            } else {
                console.log("Navigating to user dashboard...");
                navigate("/user-account");
            }
            } else {
                console.log("Invalid credentials.");
                setIsNotValid(true);
            }
        } catch (error) {
            console.error("Error during login:", error);
            setIsNotValid(true);
        }
    };

    

    return (
        <div className="login-signup" >
            <h1 className="header">FOTHS</h1>
            <p id="login-title">Login Portal</p>

            <form className="login-form" onSubmit={handleSubmit}>

                <label> Username <br /> 
                    <CiUser className="icon" />
                    <input className="textfield" type="text" name="username" value={formData.username} onChange={handleChange} required />
                </label> <br /> 

                <label> Password <br />
                    <CiLock className="icon" />
                    <input className="textfield" type="password" name="password" value={formData.password} onChange={handleChange} required />
              
                </label> <br /> <br />

                  {isNotValid && (
                    <p style={{fontSize:"14px", color: 'white' }}> Invalid username and/or password. Please check credentials. </p> )}

                <button type="submit" className="button-class">Login</button>
               
            </form>

            <form >
     
                <p style={{color: "#a64444"}}>Don't have an account? Click  <Link style={{color: "#a64444"}} id="card-hyperlink" to="/dashboard">here</Link> to return to the application! </p>

            </form>

        </div>
        
    )

}

export default LoginForm;

