class StoresController < ApplicationController
  def index
    @stores = Store.all
    @title = 'Stores'
  end

  def show
    @store = Store.find(params[:id])
    @title = "Store - #{@store.name_eng}"
  end

  def new

  end

  def create

  end

  def update

  end
end