class Recipe
  attr_reader :name, :description

  def initialize(name, description)
    @name = name
    @description = description
  end
end

# Recipe.new(1, 2) => .initialize store initial data

# Recipe.new('spaghetti', 'pasta')
