// A reusable footer component on main pages
import { useNavigate } from "react-router-dom";
import { useContext } from "react";
import { UserContext } from "../Miscellaneous/UserContext";

const Footer = () => {
    const navigate = useNavigate();
    const { userType } = useContext(UserContext);

    const handleAccountClick = () => {
        if (userType === "admin") navigate("/admin");
        else if (userType === "user") navigate("/user-account");
        else navigate("/"); // fallback if not logged in
    };

    return (
        <footer className="footer">
            <div className="footer-copyright"> &copy; JWMP 2025 </div>
            <a id="card-hyperlink" className="footer-eBible-link" href="https://www.esv.org/Genesis+1/"> e-Bible </a>
            <a id="card-hyperlink" className="footer-notepad-link" href="https://onlinenotepad.org/notepad"> Notepad </a>
            <a id="card-hyperlink" className="footer-about-link" href="./#/about"> About </a>
            <button id="jwmp-hyperlink" className="footer-admin-link" onClick={handleAccountClick}> Account </button>
        </footer>
    );
};

export default Footer;