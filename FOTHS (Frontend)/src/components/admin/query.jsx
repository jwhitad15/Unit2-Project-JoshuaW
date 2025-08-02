// Component that receives user input

import React, { useState, useEffect } from "react";


const AdminQuery = ({ setFetchedData, setSelectedType, userData, questionData, scriptureData }) => {
 

  const [command, setCommand] = useState(""); // Tracks the Command dropdown selection
  const [type, setType] = useState(""); // Tracks the Type dropdown selection
  const [id, setId] = useState(""); // Tracks the ID input
  const [errorMessage, setErrorMessage] = useState(""); // Tracks error messages
  const [previewData, setPreviewData] = useState(null);

  const handleCommandChange = (e) => {
    setCommand(e.target.value);
  };

  const handleTypeChange = (e) => {
    const selectedType = e.target.value;
    setType(selectedType);
    setSelectedType(selectedType); // Pass the selected type to the Admin component
  };

  const handleIdChange = (e) => {
    setId(e.target.value);
  };

   // Fetch the entity record for preview when "Update" is selected and an ID is provided
   useEffect(() => {
    if (command === "update" && id.trim()) {
      const fetchPreviewData = async () => {
        try {
          const url = `http://localhost:8080/${type}/${id.trim()}`; // Construct the API URL
          const response = await fetch(url, {
            method: "GET",
            headers: {
              "Content-Type": "application/json",
            },
          });

          if (!response.ok) {
            throw new Error("Failed to fetch preview data.");
          }

          const data = await response.json();
          setPreviewData(data); // Set the preview data
          setErrorMessage(""); // Clear any previous error messages
        } catch (error) {
          setErrorMessage("Failed to fetch preview data. Please check the ID and try again.");
          setPreviewData(null); // Clear preview data on error
        }
      };

      fetchPreviewData();
    } else {
      setPreviewData(null); // Clear preview data if conditions are not met
    }
  }, [command, id, type]);

  const handleSubmit = async (e) => {
    e.preventDefault();

    if (!command || !type) {
      setErrorMessage("Please select both Command and Type.");
      return;
    }

    if (command === "add" && type === "users") {
      try {
        const url = `http://localhost:8080/users/create`;
        console.log(userData) // Construct the API URL
        const response = await fetch(url, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(userData), // Send the input data as the request body
        });

        if (!response.ok) {
          throw new Error("Failed to add data.");
        }

        const data = await response.json();
        console.log(data);
        setFetchedData(data); // Set the fetched data in state
        setErrorMessage(""); // Clear any previous error messages
      } catch (error) {
        setErrorMessage("Failed to add data. Please try again.");
      }
  };

    // Create operations based on the Command dropdown selection
    if (command === "add" && type === "questions") {
      try {
        const url = `http://localhost:8080/questions/add`;
        console.log(questionData) // Construct the API URL
        const response = await fetch(url, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(questionData), // Send the input data as the request body
        });

        if (!response.ok) {
          throw new Error("Failed to add data.");
        }

        const data = await response.json();
        console.log(data);
        setFetchedData(data); // Set the fetched data in state
        setErrorMessage(""); // Clear any previous error messages
      } catch (error) {
        setErrorMessage("Failed to add data. Please try again.");
      }
  };

    if (command === "add" && type === "scriptures") {
      try {
        const url = `http://localhost:8080/scriptures/add`;
        console.log(scriptureData) // Construct the API URL
        const response = await fetch(url, {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(scriptureData), // Send the input data as the request body
        });

        if (!response.ok) {
          throw new Error("Failed to add data.");
        }

        const data = await response.json();
        console.log(data);
        setFetchedData(data); // Set the fetched data in state
        setErrorMessage(""); // Clear any previous error messages
      } catch (error) {
        setErrorMessage("Failed to add data. Please try again.");
      }
  };

    // Read operations based on the Command dropdown selection
    if (command === "view") {
      try {
        // Construct the API URL based on whether an ID is provided
        const url = id.trim()
        ? `http://localhost:8080/${type}/${id}` // Fetch specific record by ID
        : `http://localhost:8080/${type}`; // Fetch all records of the selected type
  
      // Make an API call to fetch data
      const response = await fetch(url, {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
          },
        });

        if (!response.ok) {
          throw new Error("Failed to fetch data.");
        }

        const data = await response.json();
        setFetchedData(data); // Set the fetched data in state
        setErrorMessage(""); // Clear any previous error messages
      } catch (error) {
        setErrorMessage("Failed to fetch data. Please try again.");
      }
    }

    if (command === "update") {
      if (!id.trim()) {
        setErrorMessage("Please provide an ID to update the record.");
        return;
      }

      try {
        const url = `http://localhost:8080/${type}/update/${id.trim()}`; // Construct the API URL
        const dataToUpdate = type === "users" ? userData : type === "questions" ? questionData : scriptureData;

        const response = await fetch(url, {
          method: "PUT",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(dataToUpdate), // Send the updated data as the request body
        });

        if (!response.ok) {
          throw new Error("Failed to update data.");
        }

        const data = await response.json();
        setFetchedData(data); // Set the fetched data in state
        setErrorMessage(""); // Clear any previous error messages
      } catch (error) {
        setErrorMessage("Failed to update data. Please try again.");
      }

    } else if (command === "delete") {
      try {
        console.log("Fetching data with command:", command, "type:", type, "id:", id);
        let deleteID = id.trim()// Construct the API URL based on whether an ID is provided
        const url = `http://localhost:8080/${type}/${command}/${deleteID}` // Fetch specific record by ID
// Fetch all records of the selected type
        console.log("API URL:", url);
      // Make an API call to fetch data
      const response = await fetch(url, {
          method: "DELETE",
          headers: {
            "Content-Type": "application/json",
          },
        });

        if (response.status === 204) {
          console.log("Record deleted successfully. No content returned.");
          setFetchedData("Content Deleted"); // Set fetchedData to an empty array
          setErrorMessage(""); // Clear any previous error messages
          return;
        }
  
        if (!response.ok) {
          throw new Error("Failed to delete data.");
        }
      } catch (error) {
        console.error("Error executing command:", error);
        setErrorMessage("Failed to execute command. Please try again.");
      }
    } else {
      setErrorMessage("Invalid command selected.");
    }
  };


  return (

    <div style={{ textAlign: "center", marginTop: "20px" }}>

      <form className="scope-goals-input" onSubmit={handleSubmit}>

        <label className="scope-presetGoals-banner"><hr/>PARAMETERS<hr/> <br/> </label>

        <label htmlFor="goals">Command</label> <br/>
        <select id="goals"   className="goal-select"  value={command} onChange={handleCommandChange} >
          <option value=""></option>
          <option value="view">View</option>
          <option value="add">Add</option>
          <option value="update">Update</option>
          <option value="delete">Delete</option>
        </select> <br /> <br className="desktop-scope-breakpoint" />
        <label >Type</label> <br/>
        <select id="goals"  className="goal-select" value={type} onChange={handleTypeChange}>
          <option value=""></option>
          <option value="users">User</option>
          <option value="scriptures">Scripture</option>
          <option value="questions">Question</option>
        </select> <br /> <br className="desktop-scope-breakpoint" /> <br/>
       

         <hr className="scope-line"/>

        <label> 
          <label className="scope-customGoals-banner">ID<br className="mobile-scope-breakpoint"/> <hr /> </label> <br />
        </label> 
        <input className="admin-textfield" placeholder="123" value={id} onChange={handleIdChange}/> <br/> <br />
        <br />

        <button type="submit" className="account-button-class" >Submit</button>  <br/>  <br/>
        {previewData && <pre>{JSON.stringify(previewData, null, 2)}</pre>}
      
        {errorMessage && <p style={{ color: "white" }}>{errorMessage}</p>}
      </form> <br/>
{/* 
      <main id="ua-window" className="ua-study-window">
        {previewData ? (
          <div>
            <h3>Preview Data:</h3>
            <pre>{JSON.stringify(previewData, null, 2)}</pre>
          </div>
        ) : (
          <p>No preview data available.</p>
        )}
      </main> */}

    </div>

  );
}

export default AdminQuery;

