import React from "react";
import ReactDOM from "react-dom";
import Root from "./components/root";
import configureStore from "./store/store";
import { loginUser } from "./actions/session_actions";

document.addEventListener("DOMContentLoaded", () => {

  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.loginUser = loginUser;

  const root = document.getElementById("root");
  ReactDOM.render( <Root store={store} /> , root);
});

const user = {
  id: 7,
  username: "ajaxuser2",
  password: "password"
};