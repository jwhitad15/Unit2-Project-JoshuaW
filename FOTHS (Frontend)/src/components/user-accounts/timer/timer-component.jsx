import './timer.css';

const UserTimer = () => {
  
  return (

    <div className="timer">
      <div className="time">
        <p id="hours">00</p>
        <p className='timer-label'>Hours</p>
      </div>
      <div className="time">
        <p id="minutes">00</p>
        <p className='timer-label'>Minutes</p>
      </div>
      <div className="time">
        <p id="seconds">00</p>
        <p className='timer-label'>Seconds</p>
      </div>

      <script src="timer-script.js"></script>
    </div>

  )
}

export default UserTimer;