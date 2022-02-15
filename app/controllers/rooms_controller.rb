class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
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
  
  def room_params
    params.require(:room).permit(:roomname, :roomprofile, :roomimage, :address, :price)
  end
  
end
