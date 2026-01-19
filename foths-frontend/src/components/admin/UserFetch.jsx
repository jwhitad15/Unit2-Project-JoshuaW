import React, { useState, useEffect } from "react";
import './admin.css'


const UserFetch = ({setUserData}) => {

    const [firstName, setFirstName] = useState("");
    const [lastName, setLastName] = useState("");
    const [email, setEmail] = useState("");
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");

    const handleFirstNameChange = (e) => setFirstName(e.target.value);
    const handleLastNameChange = (e) => setLastName(e.target.value);
    const handleEmailChange = (e) => setEmail(e.target.value);
    const handleUsernameChange = (e) => setUsername(e.target.value);
    const handlePasswordChange = (e) => setPassword(e.target.value);

    // Update the parent component's state whenever any field changes
    useEffect(() => {
    const userData = {
        firstName,
        lastName,
        email,
        username,
        password,
    };
    setUserData(userData); // Pass the updated data to the parent component
    }, [firstName, lastName, email, username, password, setUserData]);

    return (
        <main className="ua-fetch-window"> 
            <input id='firstName' maxLength='15' minLength='4' className="admin-textfield" type="text" placeholder="First" value={firstName} onChange={handleFirstNameChange}></input>
            <input id='lastName' maxLength='15' minLength='4' className="admin-textfield" type="text" placeholder="Last" value={lastName} onChange={handleLastNameChange}></input>
            <input id='email' maxLength='15' minLength='4' className="admin-textfield" type="text" placeholder="Email" value={email} onChange={handleEmailChange}></input>
            <input id='username' maxLength='15' minLength='4' className="admin-textfield" type="text" placeholder="Username" value={username} onChange={handleUsernameChange}></input>
            <input id='password' maxLength='15' minLength='4' className="admin-textfield" type="text" placeholder="Password" value={password} onChange={handlePasswordChange}></input>
            
        </main>
    )

}

export default UserFetch;