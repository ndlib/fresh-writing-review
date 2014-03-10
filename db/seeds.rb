# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Issue.delete_all
Issue.create(year: 2014, title: "Fresh Writing Volume 14", editorial_notes: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2012', 'foreword.md')), editorial_board: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2012', 'board.md')), acknowledgments: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2012', 'acknowledgments.md')))
Issue.create(year: 2012, title: "Fresh Writing Volume 12", editorial_notes: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2012', 'foreword.md')), editorial_board: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2012', 'board.md')), acknowledgments: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2012', 'acknowledgments.md')), is_pdf: true)
Issue.create(year: 2011, title: "Fresh Writing Volume 11", editorial_notes: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2011', 'foreword.md')), editorial_board: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2011', 'board.md')), acknowledgments: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2011', 'acknowledgments.md')), is_pdf: true)


issue_id = Issue.first.id
Essay.delete_all
Essay.create(id: 1, issue_id: issue_id, template: 'text', title: "1 section text", body: IO.read(Rails.root.join('spec', 'fixtures', 'narrative_text.txt')), author: "Terence Clines")
Essay.create(id: 2, issue_id: issue_id, template: 'media', title: "No Transcript", body: IO.read(Rails.root.join('spec', 'fixtures', 'video_text.txt')), embed: '<iframe width="560" height="315" src="//www.youtube.com/embed/unWnZvXJH2o" frameborder="0" allowfullscreen></iframe>', author: "Terence Clines")
Essay.create(id: 3, issue_id: issue_id, template: 'text', title: "2 section text", body: IO.read(Rails.root.join('spec', 'fixtures', 'two_section_text_part1.txt')), alt_body: IO.read(Rails.root.join('spec', 'fixtures', 'two_section_text_part2.txt')), alt_title: "Pied Beauty", author: "Terence Clines")
Essay.create(id: 4, issue_id: issue_id, template: 'media', title: "Transcript", body: IO.read(Rails.root.join('spec', 'fixtures', 'video_text.txt')), embed: '<iframe width="560" height="315" src="//www.youtube.com/embed/unWnZvXJH2o" frameborder="0" allowfullscreen></iframe>', alt_body: "Transcript", alt_title: 'Body section title', author: "Terence Clines")
Essay.create(id: 5, issue_id: issue_id, template: 'media', title: "The Streets Are Art", body: IO.read(Rails.root.join('spec', 'fixtures', 'zavakos_body.txt')), embed: nil, alt_body: nil, alt_title: nil, author: "Rachel Zavakos", works_cited: IO.read(Rails.root.join('spec', 'fixtures', 'zavakos_works_cited.txt')), discussion_questions: IO.read(Rails.root.join('spec', 'fixtures', 'zavakos_discussion_questions.txt')), author_biography: IO.read(Rails.root.join('spec', 'fixtures', 'biography.txt')))



EssayStyle.delete_all
%w(Narrative Analysis Research Definition Rebuttal Reflective).each do |style|
  EssayStyle.create(title: style)
end

