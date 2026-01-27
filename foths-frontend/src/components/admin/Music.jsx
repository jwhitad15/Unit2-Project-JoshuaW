// Music Component for Admin Dashboard
import FocusMusic from './audio/FocusMusic.mp3'
import './audio/audio.css'

const Music = () => {

    return (

        <div>
            <audio className="audio" controls preload="none" src={FocusMusic}></audio>
        </div>
    )
}

export default Music;

