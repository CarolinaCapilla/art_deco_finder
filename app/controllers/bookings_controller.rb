class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show update edit destroy]

  def index
    @bookings = policy_scope(Booking.where(user_id: current_user.id))
  end

  def show; end

  def new
    @item = Item.find(params[:item_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.item = Item.find(params[:item_id])
    @booking.user = current_user
    authorize @booking
    if @booking.save
      @booking.update_attributes(booked: true)
      redirect_to booking_path(@booking), notice: "Booking successfully created."
    else
      render :new
    end
  end

  def edit
    @item = @booking.item
  end

  def update
    @booking.update(booking_params)
    if @booking.save
      redirect_to booking_path(@booking), notice: "Booking successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to items_path, notice: "Booking successfully destroyed."
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :message)
  end
end
