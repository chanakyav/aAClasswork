import React from "react";
import ReactDOM from "react-dom";
import { fetchAllPokemon } from "./util/api_util";
import { requestAllPokemon } from "./actions/pokemon_actions";
import configureStore from "./store/store";

document.addEventListener("DOMContentLoaded", () => {
	const rootEl = document.getElementById("root");
	ReactDOM.render(<h1>Pokedex</h1>, rootEl);

	console.log("loaded");

	window.fetchAllPokemon = fetchAllPokemon;
    window.requestAllPokemon = requestAllPokemon;
    

    const store = configureStore();

    window.getState = store.getState;
    window.dispatch = store.dispatch;

});
