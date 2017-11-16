class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:index, :show]


  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
    end

  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    # @booking = Booking.new(booking_params)
    bookings = Booking.create_multiple_bookings(booking_params)
    desk = Desk.find(booking_params[:desk_id])
    space = desk.space

    respond_to do |format|
      if bookings.present?
        format.html { redirect_to @current_user, notice: "Desk Booked"}
        format.json { render :'user/show', status: :ok, location: @current_user }
      else
        binding.pry
        format.html { redirect_to space_path(space), notice: "Desk Not Available.  Please Try Again." }
        format.json { render :'space/show', status: :ok, location: space }
      end
    end

  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to Space.find(Desk.find(@booking.desk_id).space_id), notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to @current_user, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :desk_id, :user_id, :reservation_date, :reservation_start_date, :reservation_end_date)
    end
end
