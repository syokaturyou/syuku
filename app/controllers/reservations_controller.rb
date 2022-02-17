class ReservationsController < ApplicationController
  
  def index
   @reservations = Reservation.all
  end
  
  def new
    @reservation = Reservation.new
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    # @room = Room.find(params[:id])
    # @reservation.room_id = @room.id
    @reservation.usedate = @reservation.enddate - @reservation.startdate
    @reservation.totalprice = @reservation.usedate * @reservation.human
    if @reservation.save
      flash[:notice] = "予約新規登録しました"
      redirect_to reservation_path(@reservation)
    else
      redirect_to root_path
    end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
    # @reservation.user = current_user
  end
  
  def destroy
    reservation = Reservation.find(params[:id])
    reservation.user_id = current_user.id
    reservation.destroy
    redirect_back(fallback_location: root_path)
  end
  
  def reservation_params
    params.require(:reservation).permit(:human, :startdate, :enddate, :room_id, :user_id)
  end
  
end
