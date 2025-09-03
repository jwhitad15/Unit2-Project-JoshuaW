// This component fetches and displays data in a table format
// It allows clicking on table cells to trigger a popup with record details
// #117f9e;

import React from "react";
import './Admin.css';

const FetchDataComponent = ({ fetchedData, onCellClick}) => {

  if (!Array.isArray(fetchedData) || fetchedData.length === 0) {
    return null; // Return nothing if fetchedData is empty
  }
  
  return (
    <div>
      {Array.isArray(fetchedData) && fetchedData.length > 0 ? (
        <table className="fetch-table" border="1" >
          <thead>
            <tr>
              {/* Dynamically generate table headers based on the keys of the first record */}
              {Object.keys(fetchedData[0]).map((key, index) => (
                <th className="fetch-header" key={index} >
                  {key.toUpperCase()}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {/* Dynamically generate table rows for each record */}
            {fetchedData.map((record, rowIndex) => (
              <tr key={rowIndex} >
                {Object.entries(record).map(([key, value], colIndex) => (
                  <td key={colIndex} onClick={() => onCellClick(value, record)} style={{ cursor: "pointer" }}>
                    {value}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      ) : fetchedData === "Content Deleted" ? (
        <h1>Content Successfully Deleted</h1>
      ) : fetchedData && typeof fetchedData === "object" ? (
        <div>
          <div>{JSON.stringify(fetchedData)}</div>
        </div>
      ) : (
        <div>No data fetched yet.</div>
      )}
    </div>
  );
};

export default FetchDataComponent;