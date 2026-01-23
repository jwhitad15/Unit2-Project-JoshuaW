const cors = require('cors');

// Enable CORS for all routes
app.use(cors({
    origin: 'https://foths-frontend-production.up.railway.app', // Allow requests from your frontend
    credentials: true               // Allow cookies and credentials
}));

// Middleware to remove 'WWW-Authenticate' header from all responses
app.use((req, res, next) => {
    res.removeHeader('WWW-Authenticate');
    next();
});

app.post('/auth/login', async (request, response) => {
    const { username, password } = request.body;

    // Replace this with your actual SQL database authentication logic
    try {
        // Example: Query your SQL database to validate credentials
        const isValidUser = await validateUserFromDatabase(username, password); // Replace with your actual function

        if (isValidUser) {
            const user = await validateUserFromDatabase(username, password); // Replace with your actual function to fetch user details
            return response.status(200).json({
                username: user.username,
                firstName: user.firstName,
                lastName: user.lastName,
                email: user.email
            });
        }

        return response.status(401).json({ error: "Invalid credentials" });
    } catch (error) {
        console.error("Error during authentication:", error);
        return response.status(500).json({ error: "Internal server error" });
    }
});

// Import your database client
const mysql = require('mysql2/promise'); // Example for MySQL

// Create a database connection pool
const db = mysql.createPool({
    host: 'localhost', // Replace with your database host
    user: 'root', // Replace with your database username
    password: 'Kcjlw157!', // Replace with your database password
    database: 'unit2database', // Replace with your database name
    port: 3306 // Replace with your database port (default for PostgreSQL is 5432)
});

// Example function to validate user credentials from the database
async function validateUserFromDatabase(username, password) {
    try {
        const [rows] = await db.query(
            'SELECT * FROM users WHERE username = ? AND password = ?',
            [username, password]
        );
        return rows.length > 0; // Return true if a matching user is found
    } catch (error) {
        console.error("Database query error:", error);
        throw error; // Propagate the error to the caller
    }
}