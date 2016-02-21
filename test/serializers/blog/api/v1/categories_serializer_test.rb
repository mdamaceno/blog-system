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

  test 'has a created_at' do
    assert_equal @resource.created_at, @attribute['created_at']
  end

  test 'has an updated_at' do
    assert_equal @resource.updated_at, @attribute['updated_at']
  end
end
