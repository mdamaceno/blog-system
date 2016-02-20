class Blog::Api::V1::TagsController < ApplicationController
  before_action :find_tag, only: [:show, :update, :destroy]

  def index
    @tags = Blog::Tag.all
    render json: @tags
  end

  def show
    render json: @tag
  end

  def create
    @tag = Blog::Tag.new(tag_params)

    if @tag.save
      render json: @tag, status: :created
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def update
    if @tag.update(tag_params)
      render json: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @tag.destroy
    head :no_content
  end

  private

  def find_tag
    @tag ||= Blog::Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:name)
  end
end
