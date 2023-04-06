class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :authenticate_user!
  before_action :set_title

  def set_title(title=t("home"))
    @title = title
  end
end
