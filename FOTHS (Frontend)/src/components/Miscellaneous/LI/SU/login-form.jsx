// This page is for Admin to be able to login to the backend of the app and see all user accounts related to the app.
// The login component navigates to a fetch feature that represents what it would be like to retrieve user account data.

import { useState } from "react";
import React from "react";
import { useNavigate, Link } from "react-router";
import { CiUser, CiLock } from "react-icons/ci";


const LoginForm = () => {
    const navigate = useNavigate();
    const [formData, setFormData] = useState({ username: "", password: ""});
    const [isNotValid, setIsNotValid] = useState(false);

    const handleChange = (e) => {
        const { name, value } = e.target;
        setFormData((input) => ({...input, [name]: value}));
    }

    const handleSubmit = (e) => {
        e.preventDefault();

        if (formData.username.includes('admin_') && (formData.password === 'Admin:User!')) {
        setTimeout(() => {navigate('/fetch')}, 500)
        } else {
           setIsNotValid(true);
        }

    }

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
                    <p style={{fontSize:"14px", color: 'red' }}> Invalid username and/or password. Please check credentials. </p> )}

                <button type="submit" className="button-class">Login</button>
               
            </form>

            <form >
     
                <p>Don't have an account? Click  <Link id="card-hyperlink" to="/dashboard">here</Link> to return to the application! </p>

            </form>

        </div>
        
    )

}

export default LoginForm;

