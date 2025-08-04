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

import React from "react";

const FetchDataComponent = ({ fetchedData }) => {
  return (
    <div>
      {Array.isArray(fetchedData) ? (
        fetchedData.length > 0 ? (
          <ul>
            {fetchedData.map((item, index) => (
              <li key={index}>{JSON.stringify(item)}</li>
            ))}
          </ul>
        ) : (
          <div>No data fetched yet.</div>
        )
      ) : typeof fetchedData === "string" && fetchedData === "Content Deleted" ? (
        <h1>Content Successfully Deleted</h1> // Display message for 'Content Deleted'
      ) : fetchedData && typeof fetchedData === "object" ? (
        <div>
          <div>{JSON.stringify(fetchedData)}</div> {/* Changed <p> to <div> */}
        </div>
      ) : (
        <div>No data fetched yet.</div>
      )}
    </div>
  );
};

export default FetchDataComponent;