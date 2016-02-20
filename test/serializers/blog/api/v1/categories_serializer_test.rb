require 'test_helper'

class Blog::Api::V1::CategoriesSerializerTest < ActionController::TestCase
  def setup
    @resource = build(:category)
    @serializer = Blog::Api::V1::CategoriesSerializer.new(@resource)
    @serialization = ActiveModel::Serializer::Adapter.create(@serializer)
    @data = JSON.parse(@serialization.to_json)
    @attribute = @data['data']['attributes']
  end

  test 'has an id' do
    assert_equal @resource.id, @attribute['id']
  end

  test 'has a name' do
    assert_equal @resource.name, @attribute['name']
  end

  test 'has a description' do
    assert_equal @resource.description, @attribute['description']
  end
end
