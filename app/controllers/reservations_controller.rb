class ReservationsController < ApplicationController
  
  def index
   @reservations = Reservation.all.order(updated_at: 'ASC').page(params[:page]).per(4)
  end
  
  def new
    @reservation = Reservation.new
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.usedate = @reservation.enddate - @reservation.startdate
    # binding.pry
    if @reservation.save
      flash[:notice] = "予約新規登録しました"
      redirect_to reservation_path(@reservation)
    else
      redirect_to root_path
    end
  end
  
  def show
    @reservation = Reservation.find(params[:id])
  end
  
  def destroy
    reservation = Reservation.find(params[:id])
    reservation.user_id = current_user.id
    reservation.destroy
    redirect_back(fallback_location: root_path)
  end
  
  def reservation_params
    params.require(:reservation).permit(:human, :startdate, :enddate, :room_id, :user_id, :price, :totalprice)
  end
  
end
