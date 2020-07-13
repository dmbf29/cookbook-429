class View
  def display(recipes) # an array filled with instances
    if recipes.any?
      recipes.each_with_index do |recipe, index|
        x_mark = recipe.done? ? "X" : " "
        puts "[#{x_mark}] #{index + 1} - #{recipe.name} - #{recipe.prep_time} -  #{recipe.difficulty}/\n #{recipe.description}"
      end
    else
      puts "No recipes yet 🍽"
    end
  end

  def ask_for(thing)
    puts "What's the #{thing}?"
    print '> '
    gets.chomp
  end
end
