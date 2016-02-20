class Blog::Api::V1::CategoriesSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
end
