module Api
  module V1
    class SpeciesController < Api::V1::BaseController
      before_action :set_species, only: %i[ show update destroy ]
    
      # GET /species
      def index
        @species = Species.all
    
        success!(::V1::SpeciesBlueprint.render_as_hash(@species))
      end
    
      # GET /species/1
      def show
        success!(::V1::SpeciesBlueprint.render_as_hash(@species))
      end
    
      # POST /species
      def create
        @species = Species.new(species_params)
    
        if @species.save
          success!(Blueprints::V1::SpeciesBlueprint.render_as_hash(@species))
        else
          fail!(@species.errors.full_messages)
        end
      end
    
      # PATCH/PUT /species/1
      def update
        if @species.update(species_params)
          success!(Blueprints::V1::SpeciesBlueprint.render_as_hash(@species))
        else
          fail(@species.errors.full_messages)
        end
      end
    
      # DELETE /species/1
      def destroy
        if @species.destroy
          success!()
        else
          fail(@species.errors.full_messages)
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_species
          @species = Species.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def species_params
          params.require(:species).permit(:name, :type_of)
        end
    end
  end
end    