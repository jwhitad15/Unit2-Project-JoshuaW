// Pomodoro Timer Component for User study sessions

import './pomodoro.css'

const Pomodoro = () => {

    return (

        <div>
            <div className="pomodoro">

                <div className="pomoTimer" id="pomoTimer"> 
                    31:00
                    
                    <div className="pomoButton">
                        <button id="start">Start</button>
                        <button id="pause">Pause</button>
                        <button id="reset">Reset</button>
                    </div>
                </div>

           
            </div>
        </div>
    )
}

export default Pomodoro;