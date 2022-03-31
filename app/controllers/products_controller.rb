class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def new
    @product = Product.new
  end

  def create
    @product = product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR category ILIKE :query"
      @products = Product.where(sql_query, query: "%#{params[:query]}%").order(created_at: :desc)
    else
      @products = Product.order(created_at: :desc).limit(15)
    end
    @markers = @products.geocoded.map do |product|
      {
        lat: product.latitude,
        lng: product.longitude,
        info_window: render_to_string(partial: "info_window", locals: { flat: flat })
      }
    end
  end

  def show
    # @booking = Booking.new
    # @marker = @car.geocode.map do {
    #   lat: @car.latitude,
    #   lng: @car.longitude
    # }
    # end
    # @bookings = @car.bookings
    # @bookings_dates = @bookings.map do |booking|
    #   {
    #     from: booking.start_at,
    #     to: booking.end_at
    #   }
    # end
  end

  def edit
  end

  def update
    if @product.user == current_user
      if @product.update(product_params)
        redirect_to product_path(@product)
      else
        render :edit
      end
    else
      flash[:alert] = "Vous n'avez pas l'autorisation !!!"
      redirect_to product_path(@product)
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :address, :price, :category)
  end
end
