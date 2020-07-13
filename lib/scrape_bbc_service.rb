require 'open-uri'
require 'nokogiri'

class ScrapeBBCService
  attr_reader :keyword

  def initialize(keyword)
    @keyword = keyword
  end

  def call
    url = "https://www.bbcgoodfood.com/search/recipes?query=#{keyword}"
    html = open(url)
    doc = Nokogiri::HTML(html)
    doc.search('.node-recipe').first(5).map do |recipe_card|
      name = recipe_card.search('.teaser-item__title').text.strip
      description = recipe_card.search('.teaser-item__text-content').text.strip
      prep_time = recipe_card.search('.teaser-item__info-item--total-time').text.strip
      difficulty = recipe_card.search('.teaser-item__info-item--skill-level').text.strip
      Recipe.new(
        name: name,
        description: description,
        prep_time: prep_time,
        difficulty: difficulty
      )
    end
  end
end
