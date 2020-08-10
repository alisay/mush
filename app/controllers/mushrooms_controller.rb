class MushroomsController < ApplicationController
  before_action :set_mushroom, only: [:show, :edit, :update, :destroy, :buy]
  before_action :set_flavours, only: [:new, :edit]
  before_action :authenticate_user!

  # GET /mushrooms
  # GET /mushrooms.json
  def index
    @mushrooms = Mushroom.all
  end

  # GET /mushrooms/1
  # GET /mushrooms/1.json
  def show
    session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        customer_email: current_user.email,
        line_items: [{
            name: @mushroom.flavour,
            # amount: @mushroom.price * 100,
            amount: 5000,
            currency: 'aud',
            quantity: 1,
        }],
        payment_intent_data: {
            metadata: {
                user_id: current_user.id,
                listing_id: @mushroom.id
            }
        },
        success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@mushroom.id}",
        cancel_url: "#{root_url}listings"
    )

    @session_id = session.id
  end

  # GET /mushrooms/new
  def new
    if user_signed_in?
      # if the user has created a profile show the mushroom form else redirect to creating a profile page
      if current_user.profile
          @mushroom = Mushroom.new
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
    pp @flavours
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

  def buy 
    @mushroom.buyer_id = current_user.id
    @mushroom.purchased = true
    respond_to do |format|
      if @mushroom.save
        format.html { redirect_to @mushroom, notice: 'Mushroom is yours.' }
        format.json { render :show, status: :created, location: @mushroom }
      else
        format.html { render :new }
        format.json { render json: @mushroom.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mushroom
      @mushroom = Mushroom.find(params[:id])
    end

    def set_flavours
      @flavours = Flavour.all
    end


    # Only allow a list of trusted parameters through.
    def mushroom_params
      params.require(:mushroom).permit(:flavour_id, :seller_id, :buyer_id, :purchased, pictures: [])
    end
end
