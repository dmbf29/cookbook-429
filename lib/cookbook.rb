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

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      # row = ["pizza", "round"]
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe| # instance
        csv << [recipe.name, recipe.description]
      end
    end
  end

end

# Cookbook.new
