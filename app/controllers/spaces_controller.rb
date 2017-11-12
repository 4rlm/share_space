class SpacesController < ApplicationController
  before_action :set_space, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:index, :show]


  # GET /spaces
  # GET /spaces.json
  def index
    # @spaces = Space.all

    # @search = Space.search(params[:q])
    # @spaces = @search.result



    @q = Space.ransack(params[:q])
    # @spaces = @q.result.includes(:addresses)
    @spaces = @q.result(distinct: true).includes(:address)
    # @q.build_condition

    # or use `to_a.uniq` to remove duplicates (can also be done in the view):
    # @people = @q.result.includes(:articles).page(params[:page]).to_a.uniq

  end

  # GET /spaces/1
  # GET /spaces/1.json
  def show
    @address = Address.find_by(space_id: @space.id)
  end

  # GET /spaces/new
  def new
    @space = Space.new
  end

  # GET /spaces/1/edit
  def edit
    @address = Address.find_by(space_id: @space.id)
  end

  # POST /spaces
  # POST /spaces.json
  def create
    @space = Space.new(space_params)

    respond_to do |format|
      if @space.save
        format.html { redirect_to @space, notice: "Space was successfully created. Let's make it pretty!" }
        format.json { render :show, status: :created, location: @space }
      else
        format.html { render :new }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spaces/1
  # PATCH/PUT /spaces/1.json
  def update
    respond_to do |format|
      if @space.update(space_params)
        format.html { redirect_to @space, notice: 'Space was successfully updated.' }
        format.json { render :show, status: :ok, location: @space }
      else
        format.html { render :edit }
        format.json { render json: @space.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spaces/1
  # DELETE /spaces/1.json
  def destroy
    @space.destroy
    respond_to do |format|
      format.html { redirect_to spaces_url, notice: 'Space was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space
      @space = Space.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def space_params
      params.require(:space).permit(:name, :website, :phone, :user_id, :description)
    end
end
