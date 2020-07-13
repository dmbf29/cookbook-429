class Recipe
  attr_reader :name, :description, :prep_time, :difficulty

  def initialize(attributes = {})
    # p attributes
    @name = attributes[:name]
    @description = attributes[:description]
    @prep_time = attributes[:prep_time]
    @difficulty = attributes[:difficulty]
    # attributes[:done] == false
    # attributes[:done] == true
    # attributes[:done] == nil
    @done = attributes[:done] || false
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = !@done
  end
end

# p Recipe.new(description: 'pasta', name: 'spaghetti', done: true)
# p Recipe.new(description: 'pasta', name: 'spaghetti', done: false)
# p Recipe.new(description: 'pasta', name: 'spaghetti')

# .even?
# .odd?
# .postive?
# .include?
# .any?
# .empty?

# Recipe.new(1, 2) => .initialize store initial data

# p Recipe.new('spaghetti', 'pasta', '30 min')
