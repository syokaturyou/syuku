class RoomsController < ApplicationController
  
  before_action :move_to_signed_in, except: [:show, :search]
  
  def index
    @rooms = Room.all.order(updated_at: 'ASC').page(params[:page]).per(8)
  end
  
  def search
    @keyword = params[:keyword]
    @area = params[:area]
    if params[:keyword] != nil
    @rooms = Room.search(params[:keyword]).page(params[:page]).per(8)
    elsif params[:area] != nil
    @rooms = Room.search(params[:area]).page(params[:page]).per(8)
    else
    @rooms = Room.all.order(updated_at: 'ASC').page(params[:page]).per(8)
    end
    render "index"
  end
  
  def new
    @room = Room.new
  end
  
  def edit
    @room = Room.find(params[:id])
  end
  
  def create
    @room = Room.new(room_params)
    @room.user = current_user
    if @room.save
      flash[:notice] = "部屋を新規登録しました"
      redirect_to room_path(@room)
    else
      render "new"
    end
  end
  
  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    @room.user = current_user
    if @room.save
      flash[:notice] = "部屋情報を更新しました"
      redirect_to rooms_path
    else
      render "edit"
    end
  end
  
  def posts
    @rooms = current_user.rooms.order(updated_at: 'ASC').page(params[:page]).per(4)
  end
  
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
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
  
  def move_to_signed_in
    unless user_signed_in?
      #サインインしていないユーザーはログインページが表示される
      redirect_to  '/users/sign_in'
    end
  end
  
end
