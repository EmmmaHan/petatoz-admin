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
    @title = 'New Store'
  end

  def create
    @store = Store.create!(store_params)
    redirect_to stores_path
  end

  def update

  end

  def store_params
    params.permit(:name_eng, :name_kr, :name_jp, :website, :description, :pickup_available, :pet_type)
  end
end