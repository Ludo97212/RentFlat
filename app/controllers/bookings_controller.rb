class BookingsController < ApplicationController
  def new
    # Sur la SHOW de FLATS
  end

  def create
    set_flat
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user
    if @booking.departure >= @booking.arrival
      if @booking.save
        redirect_to flat_path(@flat)
        flash[:notice] = "Réservation envoyée! Vous pouvez consulter vos demandes depuis votre profil."
        # redirect_to my_bookings_path
      else
        render "flats/show"
      end
    else
      render "flats/show"
      flash[:alert] = "Erreur au niveau des dates !"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to my_bookings_path
  end

  def my_bookings
    @bookings = Booking.where(user_id: current_user).order(created_at: :desc)
  end

  def my_demands
    @bookings = Booking.joins(:flat).where(flats: { user_id: current_user }).order(created_at: :desc)
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(accepted_params)
      redirect_to my_demands_path
    else
      render :my_demands
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

  def booking_params
    params.require(:booking).permit(:arrival, :departure, :flat_id, :user_id)
  end

  def accepted_params
    params.require(:booking).permit(:accepted)
  end
end
