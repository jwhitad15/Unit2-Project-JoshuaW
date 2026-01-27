// // This page is for Admin to be able to login to the backend of the app and see all user accounts related to the app.
// // The login component navigates to a fetch feature that represents what it would be like to retrieve user account data.

import { useState } from "react";
import React from "react";
import { useNavigate, Link } from "react-router-dom";
import { CiUser, CiLock } from "react-icons/ci";
import ApiHelper from "../../../../ApiHelper.js";

const LoginForm = ({ setIsAuthenticated }) => {
  const navigate = useNavigate();
  const [formData, setFormData] = useState({ username: "", password: ""});
  const [isNotValid, setIsNotValid] = useState(false);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData((input) => ({...input, [name]: value}));
  }

  // const handleSubmit = async (e) => {
  //   e.preventDefault();
  //   console.log("Submitting login form with data:", formData);

  //   try {
  //     const res = await fetch(`${ApiHelper.baseUrl}/users/authenticate`, {
  //       method: "POST",
  //       headers: { "Content-Type": "application/json" },
  //       body: JSON.stringify(formData)
  //     });

  //     // Network-level fetch succeeded; inspect status
  //     const text = await res.text();
  //     const contentType = (res.headers.get('content-type') || '').toLowerCase();
  //     console.log("Response status:", res.status, "content-type:", contentType, "body:", text);

  //     if (res.status === 200) {
  //       const data = contentType.includes("application/json") ? JSON.parse(text) : null;
  //       if (data) {
  //         localStorage.setItem("firstName", data.firstName || "");
  //         localStorage.setItem("fullName", `${data.firstName || ""} ${data.lastName || ""}`);
  //         localStorage.setItem("email", data.email || "");
  //         localStorage.setItem("username", data.username || "");
  //         // do not store plaintext password in production
  //       }
  //       if (data && data.username && data.username.includes("admin_")) {
  //         navigate("/admin");
  //       } else {
  //         navigate("/user-account");
  //       }
  //       return;
  //     }

  //     if (res.status === 401) {
  //       console.log("Invalid credentials.");
  //       setIsNotValid(true);
  //       return;
  //     }

  //     // any other non-ok status
  //     console.warn("Unexpected response:", res.status, text);
  //     setIsNotValid(true);

  //   } catch (error) {
  //     // Likely CORS or network error; check backend console & network tab
  //     console.error("Error during login:", error);
  //     setIsNotValid(true);
  //   }
  // };

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

          const data = await res.json(); // parse the JSON response
          localStorage.setItem("firstName", data.firstName || "");
          localStorage.setItem("fullName", `${data.firstName || ""} ${data.lastName || ""}`);
          localStorage.setItem("email", data.email || "");
          localStorage.setItem("username", data.username || "");

          // Redirect user based on username
          if (formData.username.includes("admin_")) {
            navigate("/admin", { replace: true });
          } else {
            navigate("/user-account", { replace: true });
          }
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

    //     if (!res.ok) {
    //         if (res.status === 401) {
    //             setIsNotValid(true);
    //         }
    //         throw new Error(`Login failed with status ${res.status}`);
    //     }

    //     const data = await res.json(); // parse JSON
    //     console.log("Login success:", data);

    //     // Store JWT token
    //     // if (data.token) {
    //     //     localStorage.setItem("jwtToken", data.token);
    //     // }

    //     // Optional: store other user info
        
    //     localStorage.setItem("username", data.username || "");
    //     localStorage.setItem("firstName", data.firstName || "");
    //     localStorage.setItem("fullName", `${data.firstName || ""} ${data.lastName || ""}`);
    //     localStorage.setItem("email", data.email || "");

    //     // Navigate based on admin
    //     if (data.username && data.username.includes("admin_")) {
    //         navigate("/admin");
    //     } else {
    //         navigate("/user-account");
    //     }

    // } catch (error) {
    //     console.error("Error during login:", error);
    //     setIsNotValid(true);
    // }
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
