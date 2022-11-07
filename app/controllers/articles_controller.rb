# frozen_string_literal: true

# This is the controller for the articles resource
class ArticlesController < ApplicationController
  def show
    # Recall that the Rails GET function passes to the Controller the current article
    # (from the browser) in URI given by articles/id
    # Rails passes this argument in the params hash, so we can get the id by refering to params[:id]
    # Use an instance variable, which in this case is an object, so that the id can be
    # passed to the View
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

end
