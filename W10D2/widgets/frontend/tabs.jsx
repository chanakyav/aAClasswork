import React from "react";
import TabItems from "./tab_items";

class Tabs extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      selectedIndex: 0
    };
    this.handleClick = this.handleClick.bind(this);
  }

  handleClick(event) {
    
    // console.log(event.currentTarget.getAttribute("data-id"));
    let idx = event.currentTarget.getAttribute("data-id");
    this.setState({selectedIndex: idx});
    
  }

  render() {
    // this.props.tabs[this.selectedIndex].title
    return (
      <div>
        <h1>Tabs</h1>
        <div className="tabs-list">
          <ul>
            {this.props.tabs.map((tab, i) => 
            <li key={i} data-id={i} onClick={this.handleClick}>
              <h3>{tab.title}</h3>
            </li>)}
          </ul>
          <article>{this.props.tabs[this.state.selectedIndex].content}</article>
        </div>
      </div>
    );
  }
  
}

export default Tabs;


