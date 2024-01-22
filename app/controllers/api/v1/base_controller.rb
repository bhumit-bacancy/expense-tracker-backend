class Api::V1::BaseController < ApplicationController
  
  protect_from_forgery with: :null_session
  
  before_action :set_cors_headers

  rescue_from ActiveRecord::RecordNotFound do |error|
    api_error(400, error.message)
  end

  private

  # Method for render response as error
  def api_error(status = 500, errors = [], data = {})
    render json: {type: 'Error', status: status, message: errors, data: {user: "user"}}, status: status
  end

  # Method for render response as success
  def api_success(status = 200, msg = [], data = {})
    render json: { data: data, type: 'Success', status: status, message: msg }, status: status
  end

  def collection_serializer(collection, serializer, instance = [])
    ActiveModel::Serializer::CollectionSerializer.new(collection, serializer: serializer, data: instance)
  end

  def set_cors_headers
    headers['Access-Control-Allow-Origin'] = 'http://localhost:3000'
    headers['Access-Control-Allow-Methods'] = 'POST'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
    headers['Access-Control-Max-Age'] = '1728000'
  end
 
  # Get error message from object
  def get_error_messages(object)
    object.errors.first.message
  end

  def api_error_messages(object)
    object.errors.messages.values.uniq.join(',')
  end
end
