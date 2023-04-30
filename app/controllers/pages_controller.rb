class PagesController < ApplicationController
  before_action :require_login, except: [:about]

  def about; end
end
