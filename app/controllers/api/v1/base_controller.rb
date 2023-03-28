
module Api
  module V1
    class BaseController < ActionController::Base

      def status
        render json: {
          data: {
            version: 1,
            current_time: DateTime.now
          },
          status: 'OK'
        }
      end
    end
  end
end