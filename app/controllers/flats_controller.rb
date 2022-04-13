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
    if params[:query].present?
      sql_query = "address ILIKE :query"
      @flats = Flat.where(sql_query, query: "%#{params[:query]}%").order(created_at: :desc)
      # flash[:alert] = "0 résultat. Essayez autre chose !"
      flash[:notice] = "#{@flats.size} résultat(s)"
    else
      @flats = Flat.all
    end
    # @flats = Flat.all
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def homepage
    @flats = Flat.all
    @flats_to_show = Flat.order(created_at: :desc).limit(6)
    @markers = @flats_to_show.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window: render_to_string(partial: "info_window", locals: { flat: flat })
      }
    end
  end

  def show
    @booking = Booking.new
    @marker = @flat.geocode.map do {
      lat: @flat.latitude,
      lng: @flat.longitude
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

  # ----------------------- CUSTOM METHODS ----------------------------------------- #

  def my_flats
    @flats = Flat.where(user_id: current_user.id)
  end

  def paris
    @flats = Flat.where("address ILIKE 'paris'")
  end

  def marseille
    @flats = Flat.where("address ILIKE 'marseille'")
  end

  def lille
    @flats = Flat.where("address ILIKE 'Lille'")
  end

  def lyon
    @flats = Flat.where("address ILIKE 'Lyon'")
  end

  def nice
    @flats = Flat.where("address ILIKE 'Nice'")
  end

  def toulouse
    @flats = Flat.where("address ILIKE 'Toulouse'")
  end


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
    params.require(:flat).permit(:name, :description, :area, :address, :daily_price,
                                :user_id, :photo)
  end
end
