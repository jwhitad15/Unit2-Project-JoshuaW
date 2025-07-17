import UserInteraction from "./foths-user-interaction";
import FourElementHeader from "../header-components/header-4";
import Footer from "../footer/footer";
import Image from "../image";





const FOTHSMain = () => {

    return (
        <div id="foths-main">

           
            <FourElementHeader/>

            {/* Dynamic Component that receives user input to display in another element */}
            <aside>
                <div className="scope">Scope</div>
                <div className="scope-card-1"><UserInteraction/> </div>
            </aside>

            <div className="foths-main">
                <div className="foths-main-title"> Fruits of the Holy Spirit </div>

                <div className="fruits-grid">
                    <div className="fruit-cards-row-1">
                        <a href="./#/game-mode" id="fruit-card-1-hyperlink" className="fruit-card-1"><div className="responsive-fruit-card-text">Faith</div><Image/></a>
                    </div>
                </div>

            </div>
        
            {/* Flexbox stylization to create columns & column cards */}
            <nav>
                <div className="recent-activity">Activity</div>
                <div className="recent-activity-card-1">Welcome to FOTHS, an interactive application designed to help users study & retain biblical Scripture. </div>
                <div className="recent-activity-card-2">This is your Activity Board. Any recent activity, such as study sessions or quizzes will be recorded here.</div>
                <div className="recent-activity-card-3">Have fun studying!</div>
            </nav>

            <Footer/>

        </div>

    )
}

export default FOTHSMain;