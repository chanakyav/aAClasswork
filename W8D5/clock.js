class Clock {
  constructor() {
    // 1. Create a Date object.
    // 2. Store the hours, minutes, and seconds.
    // 3. Call printTime.
    // 4. Schedule the tick at 1 second intervals.
    let date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    this.printTime();
  
    let tick = this._tick.bind(this);
    setInterval(function () {
      console.clear();
      tick();
    }, 1000);
  }

  printTime() {
    // Format the time in HH:MM:SS
    // Use console.log to print it.
    let hours = (this.hours < 10) ? '0' + this.hours.toString() : this.hours.toString();
    let minutes = (this.minutes < 10) ? '0' + this.minutes.toString() : this.minutes.toString();
    let seconds = (this.seconds < 10) ? '0' + this.seconds.toString() : this.seconds.toString();
    
    console.log(`${hours}:${minutes}:${seconds}`);
  }

  _tick() {
    // 1. Increment the time by one second.
    // 2. Call printTime.
    this.seconds++;
    if (this.seconds > 59){
      this.seconds = 0;
      this.minutes++;
    }
    if (this.minutes > 59){
      this.minutes = 0;
      this.hours++;
    }
    if (this.hours > 23) this.hours = 0;

    this.printTime();
  }
}

const clock = new Clock();
