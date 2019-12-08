import React from 'react';

export default class Weather extends React.Component {

  currentCity() {
    navigator.geolocation.getCurrentPosition(function (position) {
      console.log(position.coords.latitude, position.coords.longitude);
    });
  }

  getWeather() {
    const coords = [37, -122];

    const request = new XMLHttpRequest();
    let url = `http://api.openweathermap.org/data/2.5/weather?lat=${coords[0]}&lon=${coords[1]}&appid=b6907d289e10d714a6e88b30761fae22`;
    request.open('GET', url, true);
  
    request.onload = function () {
      if (this.status >= 200 && this.status < 400) {
        // Success!
        const resp = this.response;
        console.log(resp);
      } else {
        // We reached our target server, but it returned an error
  
      }
    };

    request.send();
  }

  render() {
    return(
      <div>
        <h1>Weather</h1>
        <div className="weather">
          {this.getWeather()}
        </div>
      </div>
    )
  }

}