require_relative 'view'
require_relative 'recipe'
require_relative 'scrape_bbc_service'
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
    name = @view.ask_for('name')
    # ask the user for description
    description = @view.ask_for('description')
    prep_time = @view.ask_for('prep time')
    difficulty = @view.ask_for('difficulty')
    # create a recipe
    recipe = Recipe.new(
      name: name,
      description: description,
      prep_time: prep_time,
      difficulty: difficulty
    )
    # give to the cookbook to save
    @cookbook.add(recipe)
  end

  def import
    # ask user what to import?
    # keyword = need user input
    keyword = @view.ask_for('keyword')
    # search BBC for that keyword
    recipes = ScrapeBBCService.new(keyword).call
    # return 5 recipe instances
    # display the recipes to the user
    @view.display(recipes)
    # ask which one they would like to save
    # get the number
    index = @view.ask_for('number').to_i - 1
    # save the recipe into the cookbook
    recipe = recipes[index]
    @cookbook.add(recipe)
  end

  def destroy
    # display the recipes
    display_recipes
    # ask the user which number
    index = @view.ask_for('number').to_i - 1
    # tell the repository to destroy with the index
    @cookbook.remove_at(index)
  end

  def mark_as_done
    # display recipes
    display_recipes
    # index = ask user which one is completed
    index = @view.ask_for('number').to_i - 1
    @cookbook.mark_as_done(index)
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
