class FlavoursController < ApplicationController
  before_action :set_flavour, only: [:show, :edit, :update, :destroy]

  # GET /flavours
  # GET /flavours.json
  def index
    @flavours = Flavour.all
  end

  # GET /flavours/1
  # GET /flavours/1.json
  def show
  end

  # GET /flavours/new
  def new
    @flavour = Flavour.new
  end

  # GET /flavours/1/edit
  def edit
  end

  # POST /flavours
  # POST /flavours.json
  def create
    @flavour = Flavour.new(flavour_params)

    respond_to do |format|
      if @flavour.save
        format.html { redirect_to @flavour, notice: 'Flavour was successfully created.' }
        format.json { render :show, status: :created, location: @flavour }
      else
        format.html { render :new }
        format.json { render json: @flavour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flavours/1
  # PATCH/PUT /flavours/1.json
  def update
    respond_to do |format|
      if @flavour.update(flavour_params)
        format.html { redirect_to @flavour, notice: 'Flavour was successfully updated.' }
        format.json { render :show, status: :ok, location: @flavour }
      else
        format.html { render :edit }
        format.json { render json: @flavour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flavours/1
  # DELETE /flavours/1.json
  def destroy
    @flavour.destroy
    respond_to do |format|
      format.html { redirect_to flavours_url, notice: 'Flavour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flavour
      @flavour = Flavour.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def flavour_params
      params.require(:flavour).permit(:name)
    end
end
