class ReservationsController < ApplicationController
  
  def index
   @reservations = Reservation.all
  end
  
  def new
    @reservation = Reservation.new
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    # @reservation.room_id = Room.find(params[:id])
    if @reservation.save
      flash[:notice] = "予約新規登録しました"
      redirect_to reservations_path
    else
      redirect_to root_path
    end
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
