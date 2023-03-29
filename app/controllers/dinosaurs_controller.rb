class DinosaursController < ApplicationController
  before_action :set_dinosaur, only: %i[ show edit update destroy ]

  # GET /dinosaurs or /dinosaurs.json
  def index
    @dinosaurs = Dinosaur.all
  end

  # GET /dinosaurs/1 or /dinosaurs/1.json
  def show
  end

  # GET /dinosaurs/new
  def new
    @dinosaur = Dinosaur.new
  end

  # GET /dinosaurs/1/edit
  def edit
  end

  # POST /dinosaurs or /dinosaurs.json
  def create
    @dinosaur = Dinosaur.new(dinosaur_params)

    respond_to do |format|
      if @dinosaur.save
        format.html { redirect_to dinosaur_url(@dinosaur), notice: "Dinosaur was successfully created." }
        format.json { render :show, status: :created, location: @dinosaur }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dinosaur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dinosaurs/1 or /dinosaurs/1.json
  def update
    respond_to do |format|
      if @dinosaur.update(dinosaur_params)
        format.html { redirect_to dinosaur_url(@dinosaur), notice: "Dinosaur was successfully updated." }
        format.json { render :show, status: :ok, location: @dinosaur }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dinosaur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dinosaurs/1 or /dinosaurs/1.json
  def destroy
    @dinosaur.destroy

    respond_to do |format|
      format.html { redirect_to dinosaurs_url, notice: "Dinosaur was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dinosaur
      @dinosaur = Dinosaur.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dinosaur_params
      params.require(:dinosaur).permit(:name, :cage_id, :species_id)
    end
end
