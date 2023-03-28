
module Api
  module V1
    class BaseController < ActionController::Base

      def status
        render json: {
          data: {
            version: 1,
            current_time: DateTime.now
          },
          status: 200
        }
      end

      def success!(data = {}, code = nil)
        code ||= 200

        render json: { status: code, data: data }
      end

      def fail!(errors, code = nil)
        errors = [errors] if errors.is_a? String

        code ||= 422

        render json: { status: code, errors: errors }
      end

    end
  end
end