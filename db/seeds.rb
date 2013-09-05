# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Books!
columns = [:title, :author, :rating]

books =
[
  ["A Brave New World", "Aldous Huxley", 86],
  ["The Partly Cloudy Patriot", "Sarah Vowell", 75],
  ["Me Talk Pretty One Day", "David Sedaris", 80],
  ["The Hitchhiker's Guide to the Galaxy", " Douglas Adams", 90],
  ["Ender's Game", "Orson Scott Card", 85]
]

records = []
books.each do |book|
  record = {}
  columns.each_with_index do |col, i|
    record[col] = book[i]
  end
  records << record
end

records.each do |record|
  book = Book.where({:title => record[:title],
                     :author => record[:author]}).first

  if book.nil?
    book = Book.new(record)
  else
    book.assign_attributes(record)
  end
  book.save!
end


# Categories!
categories = [ "Fiction", "Non-fiction", "Science Fiction", "Earth Science",
  "Mathematics", "Programming" ]

categories.each do |c|
  cat_in_db = Category.where({name: c}).first
  cat_in_db = Category.new({name: c}) if cat_in_db.nil?
  cat_in_db.save!
end
