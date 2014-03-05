# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Essay.delete_all
Essay.create(id: 1, title: "Super Essay", body: 'TEXT GOES HERE'  )
Essay.create(id: 2, title: "You Tube", body: "You tube is awesome", embed: '<iframe width="560" height="315" src="//www.youtube.com/embed/unWnZvXJH2o" frameborder="0" allowfullscreen></iframe>')

Issue.delete_all
[2014,2013,2012].each do |year|
  Issue.create(year: year, editorial_notes: "Notes for #{year}", editorial_board: "Editorial Board for #{year}", acknowledgments: "Acknowledgments for #{year}")
end
