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

        // Debug log to verify form data
        console.log("Submitting login form with data:", formData);
    
        try {
    // Make an API call to validate the username and password
            const response = await fetch("http://localhost:8080/auth/login", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(formData),
                credentials: 'include',
                redirect: 'manual'
            });
            const raw = await response.text(); // Always read as text first
            console.log("Raw response text:", raw); // Debug log to see raw response
            const contentType = (response.headers.get('content-type') || '').toLowerCase();

            // Spring now returns JSON 200 on success or 401 on failure (see backend)
                if (response.status === 200) {
                    // logged in
                    window.location.href = '/'; // or update app state
                    return;
                }

                if (response.status === 401) {
                    setError('Invalid credentials');
                    return;
                }

                // handle 302/303 if backend still sends redirect
                if (response.type === 'opaqueredirect' || response.status === 302 || response.status === 303) {
                    window.location.href = '/';
                    return;
                }

    
            if (!response.ok) {
                throw new Error("Failed to validate credentials");
            }
    
            if (contentType && contentType.includes("application/json")) {
                const data = JSON.parse(raw);
                console.log("Login Success", data); // Handles successful login (stores token, redirects, etc.)

                // Store user details in local storage
                localStorage.setItem("firstName", data.firstName);
                localStorage.setItem("fullName", `${data.firstName} ${data.lastName}`);
                localStorage.setItem("email", data.email);
                localStorage.setItem("username", data.username);
                localStorage.setItem("password", data.password);

                // Route based on the username
                if (data.username && data.username.includes("admin_")) {
                    console.log("Navigating to admin dashboard...");
                    navigate("/admin");
                } else {
                    console.log("Navigating to user dashboard...");
                    navigate("/user-account");
                }
            } else {
                console.warn('Expected JSON but received:', contentType || 'unknown', '\nBody:', raw);
                throw new Error('Unexpected response format from server');
            }
            
            // Check the response from the backend
            if (data.username === formData.username && data.password === formData.password) {
                // Store the user's first name in local storage
                localStorage.setItem("firstName", data.firstName);
                localStorage.setItem("fullName", `${data.firstName} ${data.lastName}`); 
                localStorage.setItem("email", data.email);
                localStorage.setItem("username", data.username);  
                localStorage.setItem("password", data.password); // Store the password for future use

                // Route based on the username
                if (data.username.includes("admin_")) {
                    console.log("Navigating to admin dashboard...");
                    navigate("/admin");
                } else {
                    console.log("Navigating to user dashboard...");
                    navigate("/user-account");
                }
            } else if (response.status === 401) {
                console.log("Invalid credentials.");
                setIsNotValid(true);
            } else {
                throw new Error("Unexpected response status: " + response.status);
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
                    <input className="textfield" type="text" name="username" autoComplete="username" value={formData.username} onChange={handleChange} required />
                </label> <br /> 

                <label> Password <br />
                    <CiLock className="icon" />
                    <input className="textfield" type="password" name="password" autoComplete="current-password" value={formData.password} onChange={handleChange} required />
              
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
