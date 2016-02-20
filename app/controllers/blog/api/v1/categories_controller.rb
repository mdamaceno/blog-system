class Blog::Api::V1::CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :update, :destroy]

  def index
    @categories = Blog::Category.all
    render json: @categories
  end

  def show
    render json: @category
  end

  def create
    @category = Blog::Category.new(category_params)
    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    head :no_content
  end

  private

  def find_category
    @category = Blog::Category.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Category does not exist' }, status: :not_found
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
