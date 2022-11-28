# frozen_string_literal: true

# This is the controller for the categories resource
class CategoriesController < ApplicationController
  before_action :require_admin, except: %i[index show]

  def new
    # Create a new category object immediately upon entry of this method so that
    # a valid category object exists when the Show etc. pages are first entered.
    # Otherwise, the error trapping done there will fail
    @category = Category.new
  end

  def create
    @category = Category.new(whitelist_category_params)

    if @category.save
      # Generate a confirmation message for the user.
      flash[:notice] = 'Category was created successfully.'
      redirect_to categories_path

    else
      # Error trapping
      # Re-render the "new" category page.
      # Because the save returned false, the error trapping on the "new" page
      # will display the errors
      render 'new', status: :unprocessable_entity

    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def index
    # Utilizing the will_paginate gem to include pagination as this code was
    # @categories= Category.all, which could return many rows
    @categories = Category.paginate(page: params[:page], per_page: 8).order('name ASC')
  end

  private

  def whitelist_category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if logged_in? && @current_user.admin
      true
    else
      flash[:alert] = 'Categories can only be created by Admin-level users'
      redirect_to categories_path
    end
  end
end
