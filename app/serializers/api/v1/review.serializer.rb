class Api::V1::ReviewSerializer < ActiveModel::Serializer
  attributes :id, :college_id, :user_id, :category_id, :content, :rating
end
