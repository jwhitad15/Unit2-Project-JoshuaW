import './admin.css'

const UserFetch = () => {

    return (
        <main className="ua-fetch-window"> 
            <input id='firstName' maxLength='15' minLength='4' className="admin-textfield" type="text" placeholder="First" ></input>
            <input id='lastName' maxLength='15' minLength='4' className="admin-textfield" type="text" placeholder="Last" ></input>
            <input id='email' maxLength='15' minLength='4' className="admin-textfield" type="text" placeholder="Email" ></input>
            <input id='username' maxLength='15' minLength='4' className="admin-textfield" type="text" placeholder="Username" ></input>
            <input id='password' maxLength='15' minLength='4' className="admin-textfield" type="text" placeholder="Password" ></input>
            
        </main>
    )

}

export default UserFetch;