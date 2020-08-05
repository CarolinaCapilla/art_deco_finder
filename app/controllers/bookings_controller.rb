class BookingsController < ApplicationController
  before_action :set_booking, except: [:index]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show; end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.item = @item
    @booking.user = current_user
    if @booking.save
      # set booking to true @booking.booked = true ?
      @booking.update_attributes(booked: true)
      redirect_to booking_path(@booking), notice: "Booking succesfully created."
    else
      render :new
    end
  end

  def edit; end

  def update
    @booking.update(booking_params)
    if @booking.save
      redirect_to experience_path(@experience)
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to booking_path(@booking.user), notice: "Booking succesfully destroyed."
  end

  private

  def set_booking
    @booking = Booking.find(params[:item_id])
  end

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
