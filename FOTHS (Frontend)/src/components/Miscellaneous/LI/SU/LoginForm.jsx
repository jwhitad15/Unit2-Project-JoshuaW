import React, { useState } from 'react';

const LoginForm = () => {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');

    const handleSubmit = async (e) => {
        e.preventDefault(); // Ensure this is called on a valid event object
        try {
            const res = await fetch('http://localhost:8080/auth/login', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ username, password }),
                credentials: 'include', // Use if relying on session cookies
            });

            if (!res.ok) {
                const text = await res.text();
                throw new Error(`Login failed ${res.status}: ${text}`);
            }

            const contentType = res.headers.get('content-type') || '';
            if (contentType.includes('application/json')) {
                const data = await res.json();
                console.log('Logged in', data);
                // Handle success (e.g., redirect or save token)
            } else {
                const text = await res.text();
                console.warn('Expected JSON but got:', text);
            }
        } catch (err) {
            console.error('Error during login:', err);
        }
    };

    return (
        <form onSubmit={handleSubmit}>
            <input
                type="text"
                name="username"
                placeholder="Username"
                value={username}
                onChange={(e) => setUsername(e.target.value)}
                required
            />
            <input
                type="password"
                name="password"
                placeholder="Password"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                required
            />
            <button type="submit">Login</button>
        </form>
    );
};

export default LoginForm;