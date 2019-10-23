import React from "react";

class Tabs extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            tabs: props
        };
        console.log(props);
    } 

    render() {
        return (
            <div>
                <h1>Tabs</h1>
                {}
                <button>One</button>
                <button>Two</button>
                <button>Three</button>
                <p>Content</p>
            </div>
        );
    }

}

export default Tabs;