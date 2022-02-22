class ReservationsController < ApplicationController
  
  def index
   @reservations = Reservation.all.order(updated_at: 'ASC').page(params[:page]).per(4)
  end
  
  def new
    @reservation = Reservation.new
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    if @reservation.valid?
      render "confirm"
    else
      @room = Room.find(@reservation.room_id)
      render 'rooms/show'
    end
    # if @reservation.startdate == nil || @reservation.enddate == nil || @reservation.human == nil
    #   flash[:notice] = "必須項目を入力してください"
    #   redirect_to room_path(@reservation.room_id)
    # elsif @reservation.enddate <= @reservation.startdate
    #   flash[:notice] = "終了日は開始日以降の日を登録してください"
    #   redirect_to room_path(@reservation.room_id)
    # elsif @reservation.startdate < Date.today
    #   flash[:notice] = "開始日は本日以降の日を登録してください"
    #   redirect_to room_path(@reservation.room_id)
    # elsif @reservation.human < 1
    #   flash[:notice] = "1人以上の人数としてください"
    #   redirect_to room_path(@reservation.room_id)
    # else
    #   render "confirm"
    # end
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
