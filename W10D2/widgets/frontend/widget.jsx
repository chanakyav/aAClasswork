import React from 'react';
import Clock from './clock';
import Tabs from './tabs';
import Weather from './weather';

class Widget extends React.Component {

  render() {
    return (
      <div>
        <Clock />
        <Tabs tabs={this.props.movies}/>
        <Weather />
      </div>
    );
  }

}

export default Widget;
