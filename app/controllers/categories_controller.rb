class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
    @categories = Category.includes(:posts).order(:name)
  end

  def show
    @posts = @category.posts.includes(:category, featured_image_attachment: :blob)
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: "Category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy!
    redirect_to categories_url, notice: "Category was successfully deleted.", status: :see_other
  end

  private
    def set_category
      @category = Category.find(params.expect(:id))
    end

    def category_params
      params.expect(category: [ :name, :description ])
    end
end
