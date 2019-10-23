import React from "react";

class Clock extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            time: new Date()
        }
        // this.tick = this.tick.bind(this);
    }

    componentDidMount() {
        this.interval = setInterval( () => {
            this.tick();
        }, 1000);
    }

    componentWillUnmount() {
        clearInterval(this.interval);
    }

    tick() {
        this.setState({time: new Date()});
    }

    render() {
        return (
            <div>
                <h1>{`Time:  ${this.state.time.toLocaleTimeString()}`}</h1>
                <h1>{`Date:  ${this.state.time.toDateString()}`}</h1>
            </div>
        );
    }

}

export default Clock;