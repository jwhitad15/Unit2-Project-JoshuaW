// // This page is for Admin to be able to login to the backend of the app and see all user accounts related to the app.
// // The login component navigates to a fetch feature that represents what it would be like to retrieve user account data.

import { useState, useContext } from "react";
import React from "react";
import { useNavigate, Link } from "react-router-dom";
import { CiUser, CiLock } from "react-icons/ci";
import ApiHelper from "../../../../classes/ApiHelper.js";
import { UserContext } from "../../UserContext.jsx";

const LoginForm = ({ setIsAuthenticated }) => {
  const navigate = useNavigate();
  const { loginUser } = useContext(UserContext);
  const [formData, setFormData] = useState({ username: "", password: "", firstName: "", lastName: "", email: "" });
  const [isNotValid, setIsNotValid] = useState(false);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((input) => ({...input, [name]: value}));
  }

  const handleSubmit = async (e) => {
    e.preventDefault();
    console.log("Submitting login form with data:", formData);

    try {
        const res = await fetch(`${ApiHelper.baseUrl}/users/authenticate`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(formData),
            credentials: "include" // <--- CRITICAL for session cookie
        });

        // Identifies that fetch succeeded; inspect status of 200
        if (res.status === 200) {
          setIsNotValid(false);
          setIsAuthenticated(true); // Let's App know authentication is valid for allowing access to protected routes
          // --- Safe JSON parsing ---      
          
          const text = await res.text(); // read response as text first
          const data = text ? JSON.parse(text) : {}; // parse only if text exists
         
          // parse the JSON response
          localStorage.setItem("firstName", data.firstName || "");
          localStorage.setItem("fullName", `${data.firstName || ""} ${data.lastName || ""}`);
          localStorage.setItem("email", data.email || "");
          localStorage.setItem("username", data.username || formData.username);

          console.log(formData.firstName, "has logged in successfully as", formData.username);
          console.log(formData.username, "is logged in bitch");
          console.log(formData.email);

          // Determine user type
          const userType = formData.username.includes("admin_") ? "admin" : "user";
          const userInfo = {
            firstName: data.firstName || "",
            lastName: data.lastName || "",
            email: data.email || "",
            username: data.username || "",
            };
          loginUser(userType, userInfo); // <-- Set in context


          // Navigate based on type
          if (userType === "admin") navigate("/admin", { replace: true });
          else navigate("/user-account", { replace: true });

          return;
        }
  
        if (res.status === 401) {
          // Invalid credentials
          setIsNotValid(true);
          return;
        }
  
        // Unexpected status
        console.warn("Unexpected login response:", res.status);
        setIsNotValid(true);
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
          <p style={{fontSize:"14px", color: 'white' }}>
            Invalid username and/or password. Please check credentials.
          </p>
        )}

        <button type="submit" className="button-class">Login</button>
      </form>

      {/* <form >
        <p style={{color: "#a64444"}}>Don't have an account? Click  <Link style={{color: "#a64444"}} id="card-hyperlink" to="/user-registration">here</Link> to create one!</p>
      </form> */}
    </div>
  )
}

export default LoginForm;
