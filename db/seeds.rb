# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Essay.delete_all
Essay.create(id: 1, template: 'text', title: "1 section text", body: IO.read(Rails.root.join('spec', 'fixtures', 'narrative_text.txt')))
Essay.create(id: 2, template: 'media', title: "You Tube", body: IO.read(Rails.root.join('spec', 'fixtures', 'video_text.txt')), embed: '<iframe width="560" height="315" src="//www.youtube.com/embed/unWnZvXJH2o" frameborder="0" allowfullscreen></iframe>')
Essay.create(id: 3, template: 'text', title: "2 section text", body: IO.read(Rails.root.join('spec', 'fixtures', 'two_section_text_part1.txt')), alt_body: IO.read(Rails.root.join('spec', 'fixtures', 'two_section_text_part2.txt')), alt_title: "Pied Beauty")

Issue.delete_all
[2014,2013,2012].each do |year|
  Issue.create(year: year, editorial_notes: "Notes for #{year}", editorial_board: "Editorial Board for #{year}", acknowledgments: "Acknowledgments for #{year}")
end

EssayStyle.delete_all
%w(Narrative Analysis Research Definition Rebuttal Reflective).each do |style|
  EssayStyle.create(slug: style.downcase, title: style)
end

