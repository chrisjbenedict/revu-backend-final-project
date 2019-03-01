class Api::V1::FavoriteSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :college_id, :ranking, :app_started, :essay, :app_submitted
end
