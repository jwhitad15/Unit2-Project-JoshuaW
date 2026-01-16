// A reusable footer component on main pages
import { useNavigate } from "react-router-dom";

const Footer = () => {
    const navigate = useNavigate();

    const handleAccountClick = () => {
        // Retrieve username and password from localStorage
        const username = localStorage.getItem("username") || "";
        const password = localStorage.getItem("password") || "";

        console.log("Username:", username);
        console.log("Password:", password);

        // Check if the user is an Admin
        if (username?.includes("admin_") && password?.includes("Admin:")) {
            navigate("/admin"); // Navigate to Admin page
        } else {
            navigate("/user-account"); // Navigate to User Account page
        }
    };

    return (
        <footer className="footer">
            <div className="footer-copyright"> &copy; JWMP 2025 </div>
            <a id="card-hyperlink" className="footer-eBible-link" href="https://www.esv.org/Genesis+1/"> e-Bible</a>
            <a id="card-hyperlink" className="footer-notepad-link" href="https://onlinenotepad.org/notepad"> Notepad</a>
            <a id="card-hyperlink" className="footer-about-link" href="./#/about"> About </a>
            <button id="jwmp-hyperlink" className="footer-admin-link" onClick={handleAccountClick}> Account </button>
        </footer>
    );
};

export default Footer;