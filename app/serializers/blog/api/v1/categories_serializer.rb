class Blog::Api::V1::CategoriesSerializer < Blog::Api::V1::BaseSerializer
  attributes :id, :name, :description, :created_at, :updated_at
end
