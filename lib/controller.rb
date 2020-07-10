require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook # INSTANCE
    @view = View.new # INSTANCE
  end

  def list
    display_recipes
  end

  def create
    # ask the user for name
    name = @view.ask_for_name
    # ask the user for description
    description = @view.ask_for_description
    # create a recipe
    recipe = Recipe.new(name, description)
    # give to the cookbook to save
    @cookbook.add(recipe)
  end

  def destroy
    # display the recipes
    display_recipes
    # ask the user which number
    index = @view.ask_for_number - 1
    # tell the repository to destroy with the index
    @cookbook.remove_at(index)
  end

  private

  def display_recipes
    # recipes = ask cookbook for the recipes
    recipes = @cookbook.all
    # give the view the recipes to display
    @view.display(recipes)
  end
end








#
