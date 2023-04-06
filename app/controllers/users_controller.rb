class UsersController < ApplicationController
  def index
    @users = User.all
    @title = "Users"
  end


  def edit

  end
end