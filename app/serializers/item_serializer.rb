class ItemSerializer < ActiveModel::Serializer
  attributes :id,
             :description,
             :name,
             :image_url
end
