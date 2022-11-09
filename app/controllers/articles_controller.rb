# frozen_string_literal: true

# This is the controller for the articles resource
class ArticlesController < ApplicationController
  def show
    # 1.  Recall that the http GET function passes to the Controller the current article
    #     (from the browser) in the URI given by articles/id
    #     Rails passes this argument in the form of the params hash, so we can get the id by
    #     referring to params[:id]
    # 2.  Use an instance variable, which in this case is an object, as Rails makes it
    #     available to the View for us

    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    # Create a new article object immediately upon entry of this method so that
    # a valid article object exists when the Show etc.pages are first entered.
    # Otherwise, the error trapping done there will fail
    @article = Article.new
  end

  def edit
    # 1.  Recall that the http GET function passes to the Controller the current article
    #     (from the browser) in the URI given by articles/id
    #     Rails passes this argument in the form of the params hash, so we can get the id by
    #     referring to params[:id]
    # 2.  Use an instance variable, which in this case is an object, as Rails makes it
    #     available to the View for us

    @article = Article.find(params[:id])
  end

  def create
    # Instantiate an article object based on what is returned from the browser via params hash
    # Below is an example of some Rails security.  Rather than having Rails assign the tile
    # and description attributes directly:
    #   1. use the .require method to identify that it is the article resource we want
    #   2. .permit  method to specifically retrieve the attributes listed
    @article = Article.new(params.require(:article).permit(:title, :description))

    if @article.save
      #
      # Generate a confirmation message for the user.
      flash[:notice] = 'Article was saved successfully.'

      # Now that the article is saved, we need to tell Rails what to do.
      # Convention would take the user to the newly created article's Show page
      # Examination of Rails route for the Show action (See below) indicates:
      #  "Prefix" of "article" --> telling us the path to the article's show page is article_patch
      #  "URI" --> telling us we need to provide the unique article id.
      #            We can do this by providing Rails the article object.  It "knows" to get the id
      #            from the object.
      #       --[ Route 6 ]------------
      #       Prefix            | article
      #       Verb              | GET
      #       URI               | /articles/:id(.:format)
      #       Controller#Action | articles#show
      redirect_to article_path(@article)

    else

      # Error trapping
      # Re-render the "new" article page.
      # Because the save returned false, the error trapping on the "new" page
      # will display the errors
      render 'new', status: :unprocessable_entity

    end
  end

  def update
    # Instantiate an article object based on what is returned from the browser via params hash
    @article = Article.find(params[:id])

    if @article.update(params.require(:article).permit(:title, :description))
      #
      # Generate a confirmation message for the user.
      flash[:notice] = 'Article was updated successfully.'

      # Now that the article is updated, we need to tell Rails what to do.
      # Convention would take the user to the newly updated article's Show page
      # Examination of Rails route for the Show action (See below) indicates:
      #  "Prefix" of "article" --> telling us the path to the article's show page is article_patch
      #  "URI" --> telling us we need to provide the unique article id.
      #            We can do this by providing Rails the article object.  It "knows" to get the id
      #            from the object.
      #       --[ Route 6 ]------------
      #       Prefix            | article
      #       Verb              | GET
      #       URI               | /articles/:id(.:format)
      #       Controller#Action | articles#show
      redirect_to article_path(@article)

    else

      # Error trapping
      # Re-render the "edit" article page.
      # Because the save returned false, the error trapping on the "edit" page
      # will display the errors
      render 'edit', status: :unprocessable_entity
    end
  end
end
