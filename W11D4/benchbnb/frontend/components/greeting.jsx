import React from "react";
import { Link } from 'react-router-dom';

class Greeting extends React.Component {

  constructor({props}) {
    super(props);

  }

  render() {
    const display = this.props.currentUser ? (
      <div>
        <p>Welcome, {this.props.currentUser.username} </p>
        <button onClick={this.props.logoutUser}>Logout</button>
      </div>
    ) : (
      <div>
        <Link to="/signup">Signup</Link>
        <Link to="/login">Login</Link>
      </div>
    )
    return (
      <div>
        {display}
      </div>
    );
  }

}

export default Greeting;

