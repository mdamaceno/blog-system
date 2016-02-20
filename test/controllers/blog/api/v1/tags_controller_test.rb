require 'test_helper'

class Blog::TagsControllerTest < ActionController::TestCase
  def setup
    @controller = Blog::Api::V1::TagsController.new
    @routes = Blog::Engine.routes
  end

  # GET #index

  test 'GET #index returns all the tags' do
    result = json_parsed('index', 10, 'tag')
    assert_equal 10, result.length
  end

  # GET #show

  test 'GET #show returns data of an single tag' do
    tag = create(:tag)
    result = json_parsed('show', nil, nil, tag)
    assert_not_nil result
  end

  # POST #create

  test 'POST #create returns a successful json string with the new tag' do
    attributes = attributes_for(:tag, name: 'Samsung')
    result = json_parsed('create', nil, 'tag', attributes)
    assert_equal 'Samsung', result['name']
  end

  test 'POST #create returns an error if name is not submitted' do
    attributes = attributes_for(:tag, name: nil)
    result = json_parsed('create', nil, 'tag', attributes)
    assert_response :unprocessable_entity
    assert_includes result['name'], "can't be blank"
  end

  # PUT #update

  test 'PUT #update returns a successful json string with the updated tag' do
    tag = create(:tag, name: 'Samsung')
    attributes = attributes_for(:tag, name: 'LG')
    result = json_parsed('update', nil, 'tag', tag, attributes)
    assert_equal 'LG', result['name']
  end

  test 'PUT #update returns an error if name is null' do
    tag = create(:tag, name: 'Samsung')
    attributes = attributes_for(:tag, name: nil)
    result = json_parsed('update', nil, 'tag', tag, attributes)
    assert_response :unprocessable_entity
    assert_includes result['name'], "can't be blank"
  end

  # DELETE #destroy

  test 'DELETE #destroy removes a tag and returns nothing' do
    tag = create(:tag)
    delete :destroy, id: tag, format: :json
    assert_response :no_content
  end
end
