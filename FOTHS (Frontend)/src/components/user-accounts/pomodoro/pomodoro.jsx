// Pomodoro Timer Component for User study sessions
import React, { useState, useRef } from "react";
import './pomodoro.css'

const Pomodoro = () => {

    const [time, setTime] = useState(0); // Total time in seconds
    const [inputMinutes, setInputMinutes] = useState(""); // User input for minutes
    const [isRunning, setIsRunning] = useState(false); // Tracks whether the timer is running
    const timerRef = useRef(null); // Reference for the interval

    // Convert seconds to MM:SS format
    const formatTime = (seconds) => {
        const minutes = Math.floor(seconds / 60);
        const remainingSeconds = seconds % 60;
        return `${String(minutes).padStart(2, "0")}:${String(remainingSeconds).padStart(2, "0")}`;
    };

    // Handle user input for setting the timer
    const handleInputChange = (e) => {
        setInputMinutes(e.target.value);
    };

    // Set the timer based on user input
    const handleSetTimer = () => {
        const minutes = parseInt(inputMinutes, 10);
        if (!isNaN(minutes) && minutes > 0) {
            setTime(minutes * 60); // Convert minutes to seconds
            setInputMinutes(""); // Clear the input field
        }
    };

    // Start the countdown timer
    const handleStart = () => {
        if (!isRunning && time > 0) {
            setIsRunning(true);
            timerRef.current = setInterval(() => {
                setTime((prevTime) => {
                    if (prevTime <= 1) {
                        clearInterval(timerRef.current);
                        setIsRunning(false);
                        return 0;
                    }
                    return prevTime - 1;
                });
            }, 1000);
        }
    };

    // Pause the countdown timer
    const handlePause = () => {
        if (isRunning) {
            clearInterval(timerRef.current);
            setIsRunning(false);
        }
    };

    // Reset the timer
    const handleReset = () => {
        clearInterval(timerRef.current);
        setIsRunning(false);
        setTime(0);
    };

    return (

        <div>
            <div className="pomodoro">

                <div className="pomoTimer" id="pomoTimer"> 
                    {formatTime(time)}
                    <input type="number" className="pomoTextInput" placeholder="00:00" value={inputMinutes} onChange={handleInputChange} />
                </div>
                <div className="pomoButton">
                    <button onClick={handleSetTimer}>Set</button>
                    <button id="start" onClick={handleStart}>Start</button>
                    <button id="pause" onClick={handlePause}>Pause</button>
                    <button id="reset" onClick={handleReset}>Reset</button>
                </div>

           
            </div>
        </div>
    )
}

export default Pomodoro;