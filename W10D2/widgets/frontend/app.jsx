import React from 'react';
import ReactDOM from 'react-dom';
import Widget from './widget';

const tabs = [
  {
    title: "harry potter",
    content: "back to hogwarts"
  },
  {
    title: "marvel",
    content: "superhero stuff"
  },
  {
    title: "star wars",
    content: "may the force be with you"
  }
];

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  ReactDOM.render(<Widget movies={tabs}/>, root);
})