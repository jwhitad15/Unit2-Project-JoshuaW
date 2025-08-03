// A reusable footer component on main pages

const Footer = () => {

    return (
        <footer className="footer">
            <div className="footer-copyright"> &copy; JWMP 2025 </div>
            <a id="card-hyperlink" className="footer-eBible-link" href="https://www.esv.org/Genesis+1/"> e-Bible</a>
            <a id="card-hyperlink" className="footer-notepad-link" href="https://onlinenotepad.org/notepad"> Notepad</a>
            <a id="card-hyperlink" className="footer-about-link" href="./#/about"> About </a>
            <a id="jwmp-hyperlink" className="footer-admin-link" href="./#/login"> Admin </a>
        </footer>
    )
}

export default Footer;