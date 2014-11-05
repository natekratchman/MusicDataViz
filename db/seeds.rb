# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
a = Artist.create(name: "Air")
b = Artist.create(name: "Beatles")
c = Artist.create(name: "Chicago")
d = Artist.create(name: "Del The Funky Homosapien")
p = Playlist.create(name: "Top Tracks")
