class SpaceAmenitiesController < ApplicationController
  before_action :set_space_amenity, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:index, :show]


  # GET /space_amenities
  # GET /space_amenities.json
  def index
    @space_amenities = SpaceAmenity.all
  end

  # GET /space_amenities/1
  # GET /space_amenities/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.js # show.js.erb
    end

  end

  # GET /space_amenities/new
  def new
    @space_amenity = SpaceAmenity.new
  end

  # GET /space_amenities/1/edit
  def edit
  end

  # POST /space_amenities
  # POST /space_amenities.json
  def create
    @space_amenity = SpaceAmenity.new(space_amenity_params)

    respond_to do |format|
      if @space_amenity.save
        format.html { redirect_to @space_amenity, notice: 'Space amenity was successfully created.' }
        format.json { render :show, status: :created, location: @space_amenity }
      else
        format.html { render :new }
        format.json { render json: @space_amenity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /space_amenities/1
  # PATCH/PUT /space_amenities/1.json
  def update
    respond_to do |format|
      if @space_amenity.update(space_amenity_params)
        format.html { redirect_to @space_amenity, notice: 'Space amenity was successfully updated.' }
        format.json { render :show, status: :ok, location: @space_amenity }
      else
        format.html { render :edit }
        format.json { render json: @space_amenity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /space_amenities/1
  # DELETE /space_amenities/1.json
  def destroy
    @space_amenity.destroy
    respond_to do |format|
      format.html { redirect_to space_amenities_url, notice: 'Space amenity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space_amenity
      @space_amenity = SpaceAmenity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_amenity_params
      params.require(:space_amenity).permit(:amenity_id, :space_id)
    end
end
