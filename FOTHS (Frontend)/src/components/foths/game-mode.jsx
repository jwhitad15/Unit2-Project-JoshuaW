import FourElementHeader from "../header-components/header-4";
import Footer from "../footer/footer";


const GameMode = () => {
    return (
        <div id="main">

            <div className="game-mode-header">
                <FourElementHeader/>
            </div>

            <main className="game-mode-cards">
                <div className="game-mode-title"> Game Mode </div>
                <a href="./#/study" id="game-mode-hyperlink" className="game-card-1"> Study </a>
                <a href="./#/recall" id="game-mode-hyperlink" className="game-card-2"> Recall </a>
                <a href="./#/multichoice" id="game-mode-hyperlink" className="game-card-3"> Quiz </a> 
            </main>
       
            <Footer/>

        </div>

    )
}

export default GameMode;