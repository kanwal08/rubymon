class WelcomeController < ApplicationController
  def index
    @user = current_user
    @monsters = Monster.sort(@user.monsters, params)
  end
end
