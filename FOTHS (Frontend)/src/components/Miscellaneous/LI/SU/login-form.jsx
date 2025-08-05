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

        // if (formData.username.includes('admin_') && (formData.password.includes('admin_') || formData.password.includes('Admin_'))) {
        // setTimeout(() => {navigate('/admin')}, 500)
        // } else {
        //    setIsNotValid(true);
        // }
        try {
            // Make an API call to validate the username and password
            const response = await fetch("http://localhost:8080/login", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                },
                body: JSON.stringify(formData),
            });

            if (!response.ok) {
                throw new Error("Failed to validate credentials");
            }

            const data = await response.json();

            // Check the response from the backend
            if (data.isAdmin) {
                // Navigate to the admin dashboard if the user is an admin
                navigate("/admin");
            } else if (data.isValidUser) {
                // Navigate to the user dashboard if the credentials are valid
                navigate("/dashboard");
            } else {
                // Show an error message if the credentials are invalid
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
            <p id="login-title">Administrative Login</p>

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
     
                <p>Don't have an account? Click  <Link id="card-hyperlink" to="/dashboard">here</Link> to return to the application! </p>

            </form>

        </div>
        
    )

}

export default LoginForm;

