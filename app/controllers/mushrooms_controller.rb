class MushroomsController < ApplicationController
  before_action :set_mushroom, only: [:show, :edit, :update, :destroy]

  # GET /mushrooms
  # GET /mushrooms.json
  def index
    @mushrooms = Mushroom.all
  end

  # GET /mushrooms/1
  # GET /mushrooms/1.json
  def show
  end

  # GET /mushrooms/new
  def new
    if user_signed_in?
      # if the user has created a profile show the cars form else redirect to creating a profile page
      if current_user.profile
          @mushroom = Mushroom.new
          # render cars form page
      else
          redirect_to new_profile_path
      end
    else
      redirect_to new_user_session_path
    end
  end

  # GET /mushrooms/1/edit
  def edit
  end

  # POST /mushrooms
  # POST /mushrooms.json
  def create
    @mushroom = Mushroom.new(mushroom_params)
    @seller = Seller.new
    @seller.profile_id = current_user.profile.id
    @seller.save
    @mushroom.seller_id = current_user.profile.seller.id
    
    respond_to do |format|
      if @mushroom.save
        format.html { redirect_to @mushroom, notice: 'Mushroom was successfully created.' }
        format.json { render :show, status: :created, location: @mushroom }
      else
        format.html { render :new }
        format.json { render json: @mushroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mushrooms/1
  # PATCH/PUT /mushrooms/1.json
  def update
    if @mushroom.pictures
      @mushroom.pictures.purge
    end
    respond_to do |format|
      if @mushroom.update(mushroom_params)
        format.html { redirect_to @mushroom, notice: 'Mushroom was successfully updated.' }
        format.json { render :show, status: :ok, location: @mushroom }
      else
        format.html { render :edit }
        format.json { render json: @mushroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mushrooms/1
  # DELETE /mushrooms/1.json
  def destroy
    @mushroom.destroy
    respond_to do |format|
      format.html { redirect_to mushrooms_url, notice: 'Mushroom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mushroom
      @mushroom = Mushroom.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mushroom_params
      params.require(:mushroom).permit(:flavour, :seller_id, pictures: [])
    end
end
