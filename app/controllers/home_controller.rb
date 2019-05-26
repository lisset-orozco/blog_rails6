# frozen_string_literal: true

# home blog
class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
  end
end
