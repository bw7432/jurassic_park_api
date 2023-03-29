module Api
  module V1
    class CagesController < Api::V1::BaseController
      before_action :set_cage, only: %i[ show update destroy ]

      # GET /cages
      def index
        @cages = Cage.filter(params.slice(:power_status))

        success!(::V1::CagesBlueprint.render_as_hash(@cages))
      end

      # GET /cages/1
      def show
        success!(::V1::CagesBlueprint.render_as_hash(@cage))
      end

      # POST /cages
      def create
        @cage = Cage.new(cage_params)

        if @cage.save
          success!(::V1::CagesBlueprint.render_as_hash(@cage))
          render json: @cage, status: :created, location: @cage
        else
          fail!(@cage.errors.full_messages)
        end
      end

      # PATCH/PUT /cages/1
      def update
        if @cage.update(cage_params)
          success!(::V1::CagesBlueprint.render_as_hash(@cage))
          render json: @cage
        else
          fail!(@cage.errors.full_messages)
        end
      end

      # DELETE /cages/1
      def destroy
        if @cage.destroy
          success!()
        else
          fail(@cage.errors.full_messages)
        end
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_cage
          @cage = Cage.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def cage_params
          params.require(:cage).permit(:name, :power_status, :max_occupancy)
        end
    end
  end
end
