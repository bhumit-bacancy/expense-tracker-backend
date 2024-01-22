class ApplicationController < ActionController::Base
  def serialize_collection(collection, serializer, instance = [])
    ActiveModel::Serializer::CollectionSerializer.new(collection, serializer: serializer)
  end
end
