# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create!([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create!(name: 'Emanuel', city: cities.first)

def test_file(*paths)
  paths = ['spec', 'fixtures'] + paths
  IO.read(Rails.root.join(*paths))
end

def markdown(*paths)
  MarkdownContent.create!(content: test_file(*paths))
end

EssayStyle.delete_all
%w(Narrative Analysis Research Definition Rebuttal Reflective).each do |style|
  EssayStyle.create!(title: style)
end

Issue.delete_all
current_issue = Issue.create!(published: true, year: 2014, title: "Volume 14",
        editorial_notes: markdown('issues', '2012', 'foreword.md'), editorial_board: markdown('issues', '2012', 'board.md'), acknowledgements: markdown('issues', '2012', 'acknowledgements.md'),
        large_cover_image: File.open(Rails.root.join('spec', 'fixtures', 'images', 'covers', 'nature.jpeg')),
        small_cover_image: File.open(Rails.root.join('spec', 'fixtures', 'images', 'covers', 'nature.jpeg')),
        cover_image_credit: "The photographer",
        cover_image_alt: 'trees!!!!'
        )
Issue.create!(published: true, year: 2012,
  title: "Volume 12", editorial_notes: markdown('issues', '2012', 'foreword.md'), editorial_board: markdown('issues', '2012', 'board.md'), acknowledgements: markdown('issues', '2012', 'acknowledgements.md'),
  is_pdf: true,
  pdf: File.open(Rails.root.join('spec', 'fixtures', 'files', 'issues', '2012.pdf')),
  old_cover_image: File.open(Rails.root.join('spec', 'fixtures', 'images', 'covers', '2012.jpg')),
  small_cover_image: File.open(Rails.root.join('spec', 'fixtures', 'images', 'covers', 'food.jpeg')),
)
Issue.create!(published: true, year: 2011,
  title: "Volume 11", editorial_notes: markdown('issues', '2011', 'foreword.md'), editorial_board: markdown('issues', '2011', 'board.md'), acknowledgements: markdown('issues', '2011', 'acknowledgements.md'),
  is_pdf: true,
  pdf: File.open(Rails.root.join('spec', 'fixtures', 'files', 'issues', '2011.pdf')),
  old_cover_image: File.open(Rails.root.join('spec', 'fixtures', 'images', 'covers', '2011.jpg'))
)
Issue.create!(published: true, year: 2010,
  title: "Volume 10", editorial_notes: markdown('issues', '2011', 'foreword.md'), editorial_board: markdown('issues', '2011', 'board.md'), acknowledgements: markdown('issues', '2011', 'acknowledgements.md'),
  is_pdf: true,
  pdf: File.open(Rails.root.join('spec', 'fixtures', 'files', 'issues', '2010.pdf')),
  old_cover_image: File.open(Rails.root.join('spec', 'fixtures', 'images', 'covers', '2011.jpg'))
)
Issue.create!(published: true, year: 2009,
  title: "Volume 9", editorial_notes: markdown('issues', '2011', 'foreword.md'), editorial_board: markdown('issues', '2011', 'board.md'), acknowledgements: markdown('issues', '2011', 'acknowledgements.md'),
  is_pdf: true,
  pdf: File.open(Rails.root.join('spec', 'fixtures', 'files', 'issues', '2009.pdf')),
  old_cover_image: File.open(Rails.root.join('spec', 'fixtures', 'images', 'covers', '2011.jpg'))
)
Issue.create!(published: true, year: 2008,
  title: "Volume 8", editorial_notes: markdown('issues', '2011', 'foreword.md'), editorial_board: markdown('issues', '2011', 'board.md'), acknowledgements: markdown('issues', '2011', 'acknowledgements.md'),
  is_pdf: true,
  pdf: File.open(Rails.root.join('spec', 'fixtures', 'files', 'issues', '2008.pdf')),
  old_cover_image: File.open(Rails.root.join('spec', 'fixtures', 'images', 'covers', '2011.jpg'))
)
Issue.create!(published: true, year: 2006,
  title: "Volume 6", editorial_notes: markdown('issues', '2011', 'foreword.md'), editorial_board: markdown('issues', '2011', 'board.md'), acknowledgements: markdown('issues', '2011', 'acknowledgements.md'),
  is_pdf: true,
  pdf: File.open(Rails.root.join('spec', 'fixtures', 'files', 'issues', '2006.pdf')),
  old_cover_image: File.open(Rails.root.join('spec', 'fixtures', 'images', 'covers', '2011.jpg'))
)

issue_id = Issue.first.id
narrative_style = EssayStyle.all[0]
analysis_style = EssayStyle.all[1]
research_style = EssayStyle.all[2]
definition_style = EssayStyle.all[3]


Award.delete_all
['McPartlin Award', 'Snite Museum of Art'].each do | title |
  Award.create!(title: title, body: markdown('award_text.md'))
end


Essay.delete_all
Essay.create!(id: 1, published_medium: 'text', issue_id: issue_id, published: true, essay_style: narrative_style, title: "Family of Deer", author: "Terence Clines",
    body: markdown('narrative_text.txt'),
    author_biography: markdown('biography.txt'),
    cover_image: File.open(Rails.root.join('spec', 'fixtures', 'images', 'essay_covers', 'nigthlife.jpeg'))
)

Essay.create!(id: 3, published_medium: 'text', issue_id: issue_id, published: true, essay_style: analysis_style, title: "Imperfect, Contradictory Beauty",
  body: markdown('two_section_text_part1.txt'),
  alt_body: markdown('two_section_text_part2.txt'),
  alt_title: "Pied Beauty",
  author: "Nathan McDevitt",
  author_biography: markdown('biography_long.md'),
  instructor_resources: markdown('instructor_resources.md')
)

Essay.create!(id: 4, published_medium: 'video', issue_id: issue_id, published: true, essay_style: narrative_style, title: "Invisiball Report", author: "Chizo Ekechukwu",
    body: markdown('video_text.txt'),
    embed: '<iframe width="560" height="315" src="//www.youtube.com/embed/zlMYf8MWI-4" frameborder="0" allowfullscreen></iframe>',
    alt_body: markdown('ekechukwu_transcript.txt'),
    alt_title: 'Transcript',
    author_biography: markdown('biography.txt')
)

Essay.create!(id: 5, published_medium: 'text', issue_id: issue_id, published: true, essay_style: research_style, title: "The Streets Are Art", author: "Rachel Zavakos",
    body: markdown('zavakos_body.txt'),
    works_cited: markdown('zavakos_works_cited.txt'),
    discussion_questions: markdown('zavakos_discussion_questions.txt'),
    author_biography: markdown('biography_long.md')
)

Essay.create!(id: 6, published_medium: 'audio', issue_id: issue_id, published: true, essay_style: analysis_style, title: "Monsoon: Winds of Culture", author: "Jennifer Cha",
    body: markdown('cha_text.txt'),
    embed: '<object id="kaltura_player_1_dfzuw68y" name="kaltura_player_1_dfzuw68y" type="application/x-shockwave-flash" allowFullScreen="true" allowNetworking="all" allowScriptAccess="always" height="30" width="480" bgcolor="#000000" xmlns:dc="http://purl.org/dc/terms/" xmlns:media="http://search.yahoo.com/searchmonkey/media/" rel="media:video" resource="https://www.kaltura.com/kwidget/wid/_1023422/ui_conf_id/21300191/entryId/1_dfzuw68y" data="https://www.kaltura.com/kwidget/wid/_1023422/ui_conf_id/21300191/entryId/1_dfzuw68y"><param name="allowFullScreen" value="true" /><param name="allowNetworking" value="all" /><param name="allowScriptAccess" value="always" /><param name="bgcolor" value="#000000" /><param name="flashVars" value="&entryId=1_dfzuw68y" /><param name="movie" value="https://www.kaltura.com/kwidget/wid/_1023422/ui_conf_id/21300191/entryId/1_dfzuw68y" /></object>',
    discussion_questions: markdown('zavakos_discussion_questions.txt'),
    author_biography: markdown('biography.txt')
)

Essay.create!(id: 7, published_medium: 'text', issue_id: issue_id, published: true, essay_style: research_style, title: "Easing into the Future: Federal Reserve Policy under Janet Yellen", author: "Emily Campagna",
    body: markdown('campagna_text.txt'),
    works_cited: markdown('campagna_works_cited.txt'),
    discussion_questions: markdown('zavakos_discussion_questions.txt'),
    author_biography: markdown('biography_long.md')
)

EssayAward.delete_all
EssayAward.create!(essay_id: 5, placement: 1, award: Award.first)
EssayAward.create!(essay_id: 6, placement: 2, award: Award.first)


HighlightedEssay.delete_all
EssayStyle.all.each do |essay_style|
  essay = current_issue.essays.where(essay_style: essay_style).first
  if essay.present?
    HighlightedEssay.create!(essay: essay, issue: current_issue, essay_style: essay_style, body: essay.body.content[0..200])
  end
end



Page.delete_all
%w(about contact).each do |page|
  Page.create!(title: page.titleize, path: page, body: markdown('pages', "#{page}.md"))
end

AttachedFile.destroy_all
AttachedFile.create!( essay_id: 5, title: "Power Point of Essay Images", body: 'This is a power point with lots of exciting pictures about the essay.', file: File.open(Rails.root.join('spec', 'fixtures', 'files', 'zavakos.pptx')))

