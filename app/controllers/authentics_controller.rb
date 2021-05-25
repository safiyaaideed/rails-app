class AuthenticsController < ApplicationController
  before_action :set_authentic, only: %i[ show edit update destroy ]
  before_action :set_categories

  # GET /authentics or /authentics.json
  def index
    @authentics = Authentic.all
  end

  # GET /authentics/1 or /authentics/1.json
  def show
  end

  # GET /authentics/new
  def new
    @authentic = Authentic.new
  end

  # GET /authentics/1/edit
  def edit
  end

  # POST /authentics or /authentics.json
  def create
    @authentic = Authentic.new(authentic_params.merge(user: current_user))
    
    respond_to do |format|
      if @authentic.save
        format.html { redirect_to @authentic, notice: "The sneaker was successfully created." }
        format.json { render :show, status: :created, location: @authentic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @authentic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authentics/1 or /authentics/1.json
  def update
    respond_to do |format|
      if @authentic.update(authentic_params)
        format.html { redirect_to @authentic, notice: "Authentic was successfully updated." }
        format.json { render :show, status: :ok, location: @authentic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @authentic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authentics/1 or /authentics/1.json
  def destroy
    @authentic.destroy
    respond_to do |format|
      format.html { redirect_to authentics_url, notice: "Authentic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authentic
      @authentic = Authentic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def authentic_params
      params.require(:authentic).permit(:Sneakers, :name, :description, :price, :availability, :category_id, :photo )
    end

    def set_categories
      @categories=Category.all
    end
end
 