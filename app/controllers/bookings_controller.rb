class BookingsController < ApplicationController
  # def index
  #   @bookings = Booking.all
  # end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render 'new'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @Booking.destroy
    redirect_to booking_path(@booking.user)
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :item_id, :user_id)
  end
end
