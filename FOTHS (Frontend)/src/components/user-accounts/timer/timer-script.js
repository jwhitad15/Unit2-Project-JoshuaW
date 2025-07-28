const Hours = document.getElementById('hours');
const Minutes = document.getElementById('minutes');
const Seconds = document.getElementById('seconds');

const targetTime = new Time("00:00:00").getTime();

function timer () {
    const currentTime = new Time().getTime();
    const distance = targetTime - currentTime;

    const hours = Math.floor(distance/1000/60/60) % 24;
    const minutes = Math.floor(distance/1000/60) % 60;
    const seconds = Math.floor(distance/1000) % 60;

    Hours.innerHTML = hours;
    Minutes.innerHTML = minutes;
    Seconds.innerHTML = seconds;

    if(distance < 0) {
        Hours.innerHTML = "00";
        Minutes.innerHTML = "00";
        Seconds.innerHTML = "00";
    }
}

setInterval(timer, 1000);