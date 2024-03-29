class WinesController < ApplicationController
    require 'rest-client'

    before_action :set_current_page

    def index
        @checkout = params[:checkout]
        @wines = Wine.paginate(page: params[:page], per_page: 10).order('name')
    end
    
    def find
        @wines = Wine.search(params[:term]).paginate(page: params[:page], per_page: 10).order('name')
    end

    def create
        @wine = Wine.new(params[:wine])
        @wine.save
        redirect_to @wine
    end

    def show
        @wine = Wine.find(params[:id])
    end

    private
        def set_current_page
            @current_page = params[:page] || 1
        end
end
