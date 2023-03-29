module Api
  module V1
    class DinosaursController < Api::V1::BaseController
      before_action :set_dinosaur, only: %i[ show update destroy ]

      # GET /dinosaurs
      def index
        @dinosaurs = Dinosaur.all.includes(:cage, :species)

        success!(::V1::DinosaursBlueprint.render_as_hash(@dinosaurs))
      end

      # GET /dinosaurs/1
      def show
        success!(::V1::DinosaursBlueprint.render_as_hash(@dinosaur))
      end

      # POST /dinosaurs
      def create
        @dinosaur = Dinosaur.new(dinosaur_params)

        if @dinosaur.save
          success!(::V1::DinosaursBlueprint.render_as_hash(@dinosaur))
        else
          fail!(@dinosaur.errors.full_messages)
        end
      end

      # PATCH/PUT /dinosaurs/1
      def update
        if @dinosaur.update(dinosaur_params)
          success!(::V1::DinosaursBlueprint.render_as_hash(@dinosaur))
        else
          fail!(@dinosaur.errors.full_messages)
        end
      end

      # DELETE /dinosaurs/1
      def destroy
        if @dinosaur.destroy
          success!()
        else
          fail(@dinosaur.errors.full_messages)
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
  end
end
