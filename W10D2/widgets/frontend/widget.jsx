import React from "react";
import ReactDOM from "react-dom";
import Clock from "./clock";
import Tabs from "./tabs";

const tabs = [
    {
        title: "One",
        content: "This is one"
    },
    {
        title: "Two",
        content: "This is two"
    },
    {
        title: "One",
        content: "This is 3"
    },
];

document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    const app = 
    <div>
        <Clock/>
        <Tabs data={tabs}/>
    </div>;
    ReactDOM.render( app, root );
});


/*

Pass array of objects to Tabs component:



*/