const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const res = await fetch('http://localhost:8080/auth/login', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ username, password }),
        credentials: 'include' // use if you rely on session cookie
      });
  
      if (!res.ok) {
        const text = await res.text();
        throw new Error(`Login failed ${res.status}: ${text}`);
      }
  
      const contentType = res.headers.get('content-type') || '';
      if (contentType.includes('application/json')) {
        const data = await res.json();
        // handle success (e.g., redirect or save token)
        console.log('Logged in', data);
      } else {
        const text = await res.text();
        console.warn('Expected JSON but got:', text);
      }
    } catch (err) {
      console.error('Error during login:', err);
    }
  };

export default handleSubmit;