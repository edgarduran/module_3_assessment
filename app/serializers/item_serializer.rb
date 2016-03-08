class ItemSerializer < ActiveModel::Serializer
  attributes :id,
             :description,
             :image_url
end
