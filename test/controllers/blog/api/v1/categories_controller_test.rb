require 'test_helper'

class Blog::Api::V1::CategoriesControllerTest < ActionController::TestCase
  def setup
    @controller = Blog::Api::V1::CategoriesController.new
    @routes = Blog::Engine.routes
  end

  # GET #index

  test 'GET #index returns all the categories' do
    result = json_parsed('index', 10, 'category')
    assert_equal 10, result.length
  end

  # GET #show

  test 'GET #show returns data of an single category' do
    category = create(:category)
    result = json_parsed('show', nil, nil, category)
    assert_not_nil result
  end

  # POST #create

  test 'POST #create returns a successful json string with the new category' do
    attributes = attributes_for(:category, name: 'About', description: 'abc')
    result = json_parsed('create', nil, 'category', attributes)
    assert_equal 'About', result['name']
    assert_equal 'abc', result['description']
    assert_equal 'about', result['slug']
  end

  test 'POST #create returns an error if name is not submitted' do
    attributes = attributes_for(:category, name: nil)
    result = json_parsed('create', nil, 'category', attributes)
    assert_response :unprocessable_entity
    assert_includes result['name'], "can't be blank"
  end

  # PUT #update

  test 'PUT #update returns a successful json string with the updated category' do
    category = create(:category, name: 'About', description: 'abc')
    attributes = attributes_for(:category, name: 'Contact', description: 'cba')
    result = json_parsed('update', nil, 'category', category, attributes)
    assert_equal 'Contact', result['name']
    assert_equal 'cba', result['description']
  end

  test 'PUT #update returns an error if name is null' do
    category = create(:category, name: 'About', description: 'abc')
    attributes = attributes_for(:category, name: nil, description: 'cba')
    result = json_parsed('update', nil, 'category', category, attributes)
    assert_includes result['name'], "can't be blank"
  end

  # DELETE #destroy

  test 'DELETE #destroy removes a category and returns nothing' do
    category = create(:category)
    delete :destroy, id: category, format: :json
    assert_response :no_content
  end
end
