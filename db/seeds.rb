# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Issue.delete_all
[2014].each do |year|
  Issue.create(year: year, editorial_notes: "Notes for #{year}", editorial_board: "Editorial Board for #{year}", acknowledgments: "Acknowledgments for #{year}")
end
Issue.create(year: 2012, editorial_notes: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2012', 'foreword.md')), editorial_board: "Editorial Board for 2012", acknowledgments: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2012', 'acknowledgments.md')), cover_image_fixture_path: Rails.root.join('spec', 'fixtures', 'issues', '2012', 'cover.jpg'))
Issue.create(year: 2011, editorial_notes: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2011', 'foreword.md')), editorial_board: "Editorial Board for 2011", acknowledgments: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2011', 'acknowledgments.md')), cover_image_fixture_path: Rails.root.join('spec', 'fixtures', 'issues', '2011', 'cover.jpg'))


issue_id = Issue.first.id
Essay.delete_all
Essay.create(id: 1, issue_id: issue_id, template: 'text', title: "1 section text", body: IO.read(Rails.root.join('spec', 'fixtures', 'narrative_text.txt')), author: "Terence Clines")
Essay.create(id: 2, issue_id: issue_id, template: 'media', title: "No Transcript", body: IO.read(Rails.root.join('spec', 'fixtures', 'video_text.txt')), embed: '<iframe width="560" height="315" src="//www.youtube.com/embed/unWnZvXJH2o" frameborder="0" allowfullscreen></iframe>', author: "Terence Clines")
Essay.create(id: 3, issue_id: issue_id, template: 'text', title: "2 section text", body: IO.read(Rails.root.join('spec', 'fixtures', 'two_section_text_part1.txt')), alt_body: IO.read(Rails.root.join('spec', 'fixtures', 'two_section_text_part2.txt')), alt_title: "Pied Beauty", author: "Terence Clines")
Essay.create(id: 4, issue_id: issue_id, template: 'media', title: "Transcript", body: IO.read(Rails.root.join('spec', 'fixtures', 'video_text.txt')), embed: '<iframe width="560" height="315" src="//www.youtube.com/embed/unWnZvXJH2o" frameborder="0" allowfullscreen></iframe>', alt_body: "Transcript", alt_title: 'Body section title', author: "Terence Clines")



EssayStyle.delete_all
%w(Narrative Analysis Research Definition Rebuttal Reflective).each do |style|
  EssayStyle.create(title: style)
end

