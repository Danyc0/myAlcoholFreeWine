class WinesController < ApplicationController
    require 'rest-client'

    def index
        @wines = Wine.all
    end

    def create
        @wine = Wine.new(params[:wine])
        @wine.save
        redirect to @wine
    end

    def refresh
        puts "Database refresh started ..."
        @wines = Wine.all
        @wines.destroy

        response = RestClient.get 'http://localhost:9000/wines'
        for bottle in response
            @wine = Wine.new(bottle)
            @wine.save
        end
        puts "Database refresh completed!"
    end

    def show
        @wine = Wine.find(params[:id])
    end
end
