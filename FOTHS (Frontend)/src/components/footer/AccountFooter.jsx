// A reusable footer component on main pages

const AccountFooter = () => {

    return (
        <footer className="footer">
            <div className="footer-copyright"> &copy; JWMP 2025 </div>
            <a id="jwmp-hyperlink" className="account-footer-admin-link" href="./#/foths"> <div className="foths-from-account">FOTHS</div> <div className="play-foths-from-account">Play FOTHS</div> </a>
            <a id="card-hyperlink" className="footer-eBible-link" href="https://www.esv.org/Genesis+1/"> e-Bible</a>
            <a id="card-hyperlink" className="footer-notepad-link" href="https://onlinenotepad.org/notepad"> Notepad</a>
            <a id="card-hyperlink" className="footer-about-link" href="./#/about"> About </a>
        </footer>
    )
}

export default AccountFooter;