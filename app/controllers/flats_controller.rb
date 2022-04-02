class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def index
    @flats = Flat.all
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def homepage
    if params[:query].present?
      sql_query = "name ILIKE :query OR address ILIKE :query OR address ILIKE :query"
      @flats = Flat.where(sql_query, query: "%#{params[:query]}%").order(created_at: :desc)
    else
      @flats = Flat.order(created_at: :desc).limit(9)
    end
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window: render_to_string(partial: "info_window", locals: { flat: flat })
      }
    end
  end

  def my_flats
    @flats = Flat.where(user_id: current_user.id)
  end

  def show
    @booking = Booking.new
    @marker = @flat.geocode.map do {
      lat: @flat.latitude,
      lng: @flat.longitude
    }
    end
    @bookings = @flat.bookings
    @bookings_dates = @bookings.map do |booking|
      {
        from: booking.start_at,
        to: booking.end_at
      }
    end
  end

  def edit
  end

  def update
    if @flat.user == current_user
      if @flat.update(flat_params)
        redirect_to flat_path(@flat)
      else
        render :edit
      end
    else
      flash[:alert] = "Vous n'avez pas l'autorisation !!!"
      redirect_to flat_path(@flat)
    end
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  # ----------------------------------------------------- #
  def filter
    # .where(engine: "Automatique")
    # .where(engine: "Manuelle")

    # .where(fuel: "Essence")
    # .where(fuel: "Diesel")

    # .where(seats: 3)
    # .where(seats: 4)
    # .where(seats: 5)
    # .where(seats: 6)
    # .where(:seats > 6)

    # .where(:year_of_production < 2000)
    # .where(:year_of_production.between?(2000,2010))
    # .where(:year_of_production > 2010)

    # .where(:price_per_day < 20)
    # .where(:price_per_day.between?(20..50))
    # .where(:price_per_day.between?(50..100))
    # .where(:price_per_day > 100)
  end
  # ----------------------------------------------------- #

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:brand, :model, :year_of_production,
                                :address, :price_per_day, :engine, :fuel,
                                :kilometers, :seats, :photo)
  end
end
