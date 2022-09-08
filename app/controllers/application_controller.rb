class ApplicationController < ActionController::API
   rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
   rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

   private

   def record_not_found(err)
      render json: { error: err.message }, status: :not_found
   end

   def record_invalid(err)
      render json: { error: err.record.errors.full_messages }, status: :unprocessable_entity
   end

end
