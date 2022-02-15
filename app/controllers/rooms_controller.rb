class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    @room.user = current_user
    if @room.save
      flash[:notice] = "部屋を新規登録しました"
      redirect_to rooms_path
    else
      render "new"
    end
  end
  
  def show
    @room = Room.find(params[:id])
  end
  
  def posts
    @rooms = Room.all
  end
  
  def destroy
    room = Room.find(params[:id])
    room.user_id = current_user.id
    room.destroy
    redirect_back(fallback_location: root_path)
  end
  
  def room_params
    params.require(:room).permit(:roomname, :roomprofile, :roomimage, :address, :price, :user_id)
  end
  
end
