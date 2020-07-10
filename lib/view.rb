class View
  def display(recipes) # an array filled with instances
    if recipes.any?
      recipes.each_with_index do |recipe, index|
        puts "#{index + 1} - #{recipe.name} / #{recipe.description}"
      end
    else
      puts "No recipes yet 🍽"
    end
  end

  def ask_for_name
    puts "What's the name?"
    print '> '
    gets.chomp
  end

  def ask_for_description
    puts "What's the description?"
    print '> '
    gets.chomp
  end

  def ask_for_number
    puts "What's the number?"
    print '> '
    gets.chomp.to_i
  end
end
