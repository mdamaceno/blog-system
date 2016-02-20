require 'test_helper'

class Blog::Api::V1::TagsSerializerTest < ActionController::TestCase
  def setup
    @resource = build(:tag)
    @serializer = Blog::Api::V1::TagsSerializer.new(@resource)
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
end
