class ShoppingCartsController < ApplicationController
  require 'acts_as_shopping_cart'

  before_filter :extract_shopping_cart

  def create
    @wine = Wine.find(params[:id])
    @shopping_cart.add(@wine, @wine.price, params[:num_wine].to_i)
    redirect_to basket_path
  end

  def clear
    @shopping_cart.clear
    redirect_to wines_path
  end

  def checkout
    if user_signed_in?
        @shopping_cart.clear
        #Send order to REST API here
        redirect_to wines_path(:checkout => true)
    else
        redirect_to new_user_session_path(:checkout => true)
    end
  end

  private
      def extract_shopping_cart
        shopping_cart_id = session[:shopping_cart_id]
        if session[:shopping_cart_id]
            @shopping_cart = Cart.find(shopping_cart_id)
        else
            @shopping_cart = Cart.create
        end
        session[:shopping_cart_id] = @shopping_cart.id
      end
end
