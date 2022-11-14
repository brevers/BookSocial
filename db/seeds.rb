# TODO: Use the right images :)
Book.find_or_create_by(title: "1984") do |book|
  # TODO: Probably we want to add Author and ISBN to this model.
  book.cover = "1984.jpg"
end

Book.find_or_create_by(title: "Lord or the Flies") do |book|
  book.cover = "lord_of_the_flies.jpg"
end

Book.find_or_create_by(title: "Lord of the Rings") do |book|
  book.cover = "lord_of_the_rings.jpg"
end

Book.find_or_create_by(title: "Moby Dick") do |book|
  book.cover = "book-not-found.jpg"
end

Book.find_or_create_by(title: "The Great Gatsby") do |book|
  book.cover = "the_greate_gatsby.jpg"
end

Book.find_or_create_by(title: "One Hundred Years of Solitude") do |book|
  book.cover = "/book-not-found.jpg"
end
