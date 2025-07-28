import './pomodoro.css'

const Pomodoro = () => {

    return (

        <body>
            <div className="pomodoro">
                {/* <h1 className="pomoTitle">Timer</h1>
                <hr/> */}

                <p className="pomoTimer" id="pomoTimer"> 
                    31:00
                    
                    <div className="pomoButton">
                        <button id="start">Start</button>
                        <button id="pause">Pause</button>
                        <button id="reset">Reset</button>
                    </div>
                </p>

           
            </div>
        </body>
    )
}

export default Pomodoro;