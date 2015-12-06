class ShoppingCartsController < ApplicationController
  require 'acts_as_shopping_cart'

  before_filter :extract_shopping_cart

  def create
    @wine = Wine.find(params[:id])
    @shopping_cart.add(@wine, @wine.price, params[:num_wine])
    redirect_to basket_path
  end

  def clear
    @shopping_cart.clear
    redirect_to wines_path
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
