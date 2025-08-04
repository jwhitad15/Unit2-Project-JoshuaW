// import React from "react";

// const FetchDataComponent = ({ fetchedData }) => {
//   return (
//     <div>
//       {Array.isArray(fetchedData) ? (
//         fetchedData.length > 0 ? (
//           <ul>
//             {fetchedData.map((item, index) => (
//               <li key={index}>{JSON.stringify(item)}</li>
//             ))}
//           </ul>
//         ) : (
//           <div>No data fetched yet.</div> 
//         )
//       ) : typeof fetchedData === "string" && fetchedData === "Content Deleted" ? (
//         <h1>Content Successfully Deleted</h1> // Display message for 'Content Deleted'
//       ) : fetchedData && typeof fetchedData === "object" ? (
//         <div>
//           <p>{JSON.stringify(fetchedData)}</p>
//         </div>
//       ) : (
//         <div>No data fetched yet.</div> 
//       )}
//     </div>
//   );
// };

// export default FetchDataComponent;



// import React from "react";

// Line 41 controls the display of the fetched data
// const FetchDataComponent = ({ fetchedData }) => {
//   return (
//     <div>
//       {Array.isArray(fetchedData) ? (
//         fetchedData.length > 0 ? (
//           <table>
//             {fetchedData.map((item, index) => ( 
//               <tr key={index}> {JSON.stringify(item)} </tr>
//               ))}
//           </table>
//         ) : ( <div>No data fetched yet.</div> )
//       ) : typeof fetchedData === "string" && fetchedData === "Content Deleted" ? (
//         <h1>Content Successfully Deleted</h1> // Display message for 'Content Deleted'
//       ) : fetchedData && typeof fetchedData === "object" ? (
//         <div>
//           <div>{JSON.stringify(fetchedData)}</div> {/* Changed <p> to <div> */}
//         </div>
//       ) : (
//         <div>No data fetched yet.</div>
//       )}
//     </div>
//   );
// };

// export default FetchDataComponent;
// #117f9e;

import React from "react";
import './admin.css';

const FetchDataComponent = ({ fetchedData, onRecordClick }) => {
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
              <tr key={rowIndex}>
                {Object.entries(record).map(([key, value], colIndex) => (
                  <td 
                    key={colIndex} 
                    onClick={() => key === "id" && onRecordClick(record)} // Trigger click handler for ID cells
                    style={{ cursor: key === "id" ? "pointer" : "default" }} // Add pointer cursor for ID cells
                  >
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