class MonstersController < ApplicationController
  
  before_filter :get_user, except: [:update, :destroy]
  before_filter :get_monster, except: [:index, :new, :create]
  
  def index
    respond_to do |format|
      format.html{ render :json => @user.monsters.as_json }
      format.json{ render :json => @user.monsters.as_json }
    end
  end
  
  def new
    @monster = @user.monsters.build
  end
  
  def create
    monster = @user.monsters.new(monster_params)
    if monster.save
      respond_to do |format|
        format.html{ render :json => monster.as_json }
        format.json{ render :json => monster.as_json }
      end
    else
      render json: "Monster not created - #{monster.errors.full_messages.join(', ')}".to_json
    end
  end

  def edit
  end
  
  def update
    if @monster.update(monster_params)
      respond_to do |format|
        format.html{ render :json => @monster.reload.as_json }
        format.json{ render :json => @monster.reload.as_json }
      end
    else
      render json: "Monster not updated - #{@monster.errors.full_messages.join(', ')}".to_json
    end
  end
  
  def destroy
    @monster.delete
    respond_to do |format|
      format.html{ render :json => @monster.as_json }
      format.json{ render :json => @monster.as_json }
    end
  end
  
  private
  
    def monster_params
      params.require(:monster).permit(:name, :power, :monster_type_id, :team_attributes => [:name])
    end
    
    def get_user
      @user = User.find params[:user_id]
    end
    
    def get_monster
      @monster = Monster.find params[:id]
    end
end
