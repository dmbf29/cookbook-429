require 'csv'
# store all of our recipes
class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = [] # storing all of our instances
    load_csv
  end

  def all
    @recipes
  end

  def add(recipe) # instance
    @recipes << recipe
    save_csv
  end

  def remove_at(index)
    @recipes.delete_at(index)
    save_csv
  end

  def mark_as_done(index)
    # recipe = find recipes with index
    recipe = @recipes[index]
    # mark it as done
    recipe.mark_as_done!
    # save it
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # row is a hash

      # reassigning row[:done]'s value
      row[:done] = (row[:done] == "true") # gives a boolean
      @recipes << Recipe.new(row)
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << ['name', 'description', 'prep_time', 'difficulty', 'done']
      @recipes.each do |recipe| # instance
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.difficulty, recipe.done?]
      end
    end
  end

end

# Cookbook.new
