# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create default categories
default_categories = [
  {
    name: "Technology",
    description: "Posts about technology, programming, and software development"
  },
  {
    name: "Design",
    description: "Posts about UI/UX design, graphics, and visual design"
  },
  {
    name: "Business",
    description: "Posts about business, entrepreneurship, and startup stories"
  },
  {
    name: "General",
    description: "General posts and miscellaneous topics"
  }
]

default_categories.each do |category_attrs|
  Category.find_or_create_by!(name: category_attrs[:name]) do |category|
    category.description = category_attrs[:description]
  end
end

puts "Created #{Category.count} categories"
