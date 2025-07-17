// This component controls the Study Mode Scripture carousel
import {useState, useEffect} from "react";
import Footer from "../footer/footer";
import FetchtHeader from "../header-components/fetch-header";
import './fetch.css'


const Fetch = ({}) => {

        const [items, setItems] = useState([]);
        const [dataIsLoaded, setDataIsLoaded] = useState(false);
    
        // React hooking to fetch mock data
        useEffect(() => {
            fetch("https://jsonplaceholder.typicode.com/users")
                .then((res) => res.json())
                .then((json) => {
                    setItems(json);
                    setDataIsLoaded(true);
                });
        }, []); 
    
        // Conditional Rendering
        if (!dataIsLoaded) {
            return (
                <div>
                    <h1>Please wait some time....</h1>
                </div>
            );
        }

    return (
        <div id="foths-main" className="fetchy">

           
            <div className="study-header">
                <FetchtHeader/>
            </div>

            <main className="fetch-display-container">

                <div className="subheader">
                    <p className="subheader-title">Fetching User Data from API</p>
                    <p className="subheader-text">This page represents a mockup fetch for sample data. When more users join FOTHS, user account data will be fetched & displayed on this page. </p>
                </div> <br />
            
                <hr/> <br />

                <div className="container">
                    {items.map((item) => (
                        <div className="item" key={item.id}>
                            <table className="center">
                                <tr>
                                    <th> <strong> Username </strong> </th>
                                    <th> <strong> Name </strong></th>
                                    <th> <strong> Email </strong></th>
                                </tr> 
                                <tr>
                                    <td className="username-cell">{item.username}</td>
                                    <td className="name-cell">{item.name}</td>
                                    <td className="email-cell">{item.email}</td>
                                </tr>
                            </table> <br/>
                        </div>
                    ))}
                </div> 
            </main>

            <div className="return-to-foths-from-study">
                   <a id="return-to-dashboard-hyperlink" href="./#/foths">Home</a>
            </div>

            <Footer/>

        </div>

    )
}

export default Fetch;