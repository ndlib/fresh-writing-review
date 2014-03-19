# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

EssayStyle.delete_all
%w(Narrative Analysis Research Definition Rebuttal Reflective).each do |style|
  EssayStyle.create(title: style)
end

Issue.delete_all
current_issue = Issue.create(year: 2014, title: "Volume 14", editorial_notes: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2012', 'foreword.md')), editorial_board: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2012', 'board.md')), acknowledgments: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2012', 'acknowledgments.md')))
Issue.create(year: 2012, title: "Volume 12", editorial_notes: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2012', 'foreword.md')), editorial_board: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2012', 'board.md')), acknowledgments: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2012', 'acknowledgments.md')), is_pdf: true)
Issue.create(year: 2011, title: "Volume 11", editorial_notes: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2011', 'foreword.md')), editorial_board: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2011', 'board.md')), acknowledgments: IO.read(Rails.root.join('spec', 'fixtures', 'issues', '2011', 'acknowledgments.md')), is_pdf: true)

issue_id = Issue.first.id
narrative_style = EssayStyle.all[0]
analysis_style = EssayStyle.all[1]
research_style = EssayStyle.all[2]
definition_style = EssayStyle.all[3]


EssayAward.delete_all
['McPartlin Award', 'Snite Museum of Art'].each do | title |
  EssayAward.create(title: title, body: IO.read(Rails.root.join('spec', 'fixtures', 'award_text.md')))
end


Essay.delete_all
Essay.create(id: 1, issue_id: issue_id, essay_style: narrative_style, template: 'text', title: "Family of Deer", author: "Terence Clines",
    body: IO.read(Rails.root.join('spec', 'fixtures', 'narrative_text.txt')),
    author_biography: IO.read(Rails.root.join('spec', 'fixtures', 'biography.txt'))
)

Essay.create(id: 3, issue_id: issue_id, essay_style: analysis_style, template: 'text', title: "Imperfect, Contradictory Beauty",
  body: IO.read(Rails.root.join('spec', 'fixtures', 'two_section_text_part1.txt')),
  alt_body: IO.read(Rails.root.join('spec', 'fixtures', 'two_section_text_part2.txt')),
  alt_title: "Pied Beauty",
  author: "Nathan McDevitt",
  author_biography: IO.read(Rails.root.join('spec', 'fixtures', 'biography_long.md')),
  instructor_resources: IO.read(Rails.root.join('spec', 'fixtures', 'instructor_resources.md'))
)

Essay.create(id: 4, issue_id: issue_id, essay_style: narrative_style, template: 'media', title: "Invisiball Report", author: "Chizo Ekechukwu",
    body: IO.read(Rails.root.join('spec', 'fixtures', 'video_text.txt')),
    embed: '<iframe width="560" height="315" src="//www.youtube.com/embed/zlMYf8MWI-4" frameborder="0" allowfullscreen></iframe>',
    alt_body: IO.read(Rails.root.join('spec', 'fixtures', 'ekechukwu_transcript.txt')),
    alt_title: 'Transcript',
    author_biography: IO.read(Rails.root.join('spec', 'fixtures', 'biography.txt'))
)

Essay.create(id: 5, issue_id: issue_id, essay_style: research_style, template: 'text', title: "The Streets Are Art", author: "Rachel Zavakos",
    body: IO.read(Rails.root.join('spec', 'fixtures', 'zavakos_body.txt')),
    works_cited: IO.read(Rails.root.join('spec', 'fixtures', 'zavakos_works_cited.txt')),
    discussion_questions: IO.read(Rails.root.join('spec', 'fixtures', 'zavakos_discussion_questions.txt')),
    author_biography: IO.read(Rails.root.join('spec', 'fixtures', 'biography_long.md')),
    placement: 1,
    essay_award: EssayAward.first
)

Essay.create(id: 6, issue_id: issue_id, essay_style: analysis_style, template: 'media', title: "Monsoon: Winds of Culture", author: "Jennifer Cha",
    body: IO.read(Rails.root.join('spec', 'fixtures', 'cha_text.txt')),
    embed: '<object id="kaltura_player_1_dfzuw68y" name="kaltura_player_1_dfzuw68y" type="application/x-shockwave-flash" allowFullScreen="true" allowNetworking="all" allowScriptAccess="always" height="30" width="480" bgcolor="#000000" xmlns:dc="http://purl.org/dc/terms/" xmlns:media="http://search.yahoo.com/searchmonkey/media/" rel="media:video" resource="https://www.kaltura.com/kwidget/wid/_1023422/ui_conf_id/21300191/entryId/1_dfzuw68y" data="https://www.kaltura.com/kwidget/wid/_1023422/ui_conf_id/21300191/entryId/1_dfzuw68y"><param name="allowFullScreen" value="true" /><param name="allowNetworking" value="all" /><param name="allowScriptAccess" value="always" /><param name="bgcolor" value="#000000" /><param name="flashVars" value="&entryId=1_dfzuw68y" /><param name="movie" value="https://www.kaltura.com/kwidget/wid/_1023422/ui_conf_id/21300191/entryId/1_dfzuw68y" /></object>',
    discussion_questions: IO.read(Rails.root.join('spec', 'fixtures', 'zavakos_discussion_questions.txt')),
    author_biography: IO.read(Rails.root.join('spec', 'fixtures', 'biography.txt')),
    placement: 2,
    essay_award: EssayAward.first
)

Essay.create(id: 7, issue_id: issue_id, essay_style: research_style, template: 'text', title: "Easing into the Future: Federal Reserve Policy under Janet Yellen", author: "Emily Campagna",
    body: IO.read(Rails.root.join('spec', 'fixtures', 'campagna_text.txt')),
    works_cited: IO.read(Rails.root.join('spec', 'fixtures', 'campagna_works_cited.txt')),
    discussion_questions: IO.read(Rails.root.join('spec', 'fixtures', 'zavakos_discussion_questions.txt')),
    author_biography: IO.read(Rails.root.join('spec', 'fixtures', 'biography_long.md'))
)




HighlightedEssay.delete_all
EssayStyle.all.each do |essay_style|
  essay = current_issue.essays.where(essay_style: essay_style).first
  if essay.present?
    HighlightedEssay.create(essay: essay, issue: current_issue, essay_style: essay_style, body: essay.body.to_s[0,200], biography: essay.author_biography.to_s[0,200])
  end
end



Page.delete_all
%w(about contact).each do |page|
  Page.create(title: page.titleize, path: page, body: IO.read(Rails.root.join('spec', 'fixtures', 'pages', "#{page}.md")))
end

e = Essay.find(5)
(1..8).each do | i |
  img = Image.create(image: File.open(Rails.root.join('spec', 'fixtures', 'images', 'zavakos', "figure_#{i}_orig.png")))
  e.body = e.body.sub("<figure#{i}_url>", img.image.url)
end
e.save!
