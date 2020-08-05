class BookingsController < ApplicationController
  before_action :set_item, except: [:index]

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.item = @item
    @booking.user = current_user
    if @booking.save
      # set booking to true @booking.booked = true ?
      @booking.update_attributes(booked: true)
      redirect_to item_booking_path(@item, @booking), notice: "Booking successfully created."
    else
      render :new
    end
  end

  def edit; end

  def update
    @booking.update(booking_params)
    if @booking.save
      redirect_to @item, notice: "Booking successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to @item, notice: "Booking successfully destroyed."
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :message)
  end
end
