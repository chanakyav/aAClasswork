class Api::PokemonController < ApplicationController

    def index
        @pokemon = Pokemon.all
    end
    
    def show
        @pokemon = Pokemon.find(params[:id])
    end

    private 

    def pokemon_params
        params.require(:pokemon).permit(:image_url, :attack, :defense, :name, :poke_type, moves: [])
    end

end
