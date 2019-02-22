class Api::V1::SchoolCategorySerializer < ActiveModel::Serializer
  attributes :id, :school_id, :category_id
end
