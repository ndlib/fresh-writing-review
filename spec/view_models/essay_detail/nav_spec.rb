require 'spec_helper'

describe EssayDetail::Nav do

  let(:issue) { double(Issue, friendly_id: 'fid', title: 'title')}
  let(:essay_style) { double(EssayDetail, id: 1, friendly_id: 'efid', title: 'title')}
  let(:essay) { double(Essay, instructor_resources_files: nil, title: 'test title', body: double(MarkdownContent, content: "body"), issue: issue, friendly_id: 'essay_fid', essay_style: essay_style, instructor_resources: double(MarkdownContent, content: ""), discussion_questions: double(MarkdownContent, content: ""), author_biography: double(MarkdownContent, content: ""), works_cited: double(MarkdownContent, content: "")) }

  subject { described_class.new(essay) }


  describe 'self_render' do

    it "instanciates itself and renders" do
      described_class.any_instance.should_receive(:render)

      described_class.render(essay)
    end

  end

  describe 'issue_link' do
    it "calls the link method" do
      IssueDetail.any_instance.should_receive(:link_to_show).with('tool-link volume')
      subject.issue_link
    end
  end


  describe 'style_link' do
    it "calls the link method" do
      EssayStyleDetail.any_instance.should_receive(:short_link_to_show).with('tool-link style')
      subject.style_link
    end
  end


  describe 'discussion_questions_link' do
    it "calls the link method" do
      expect(EssayDetail::DiscussionQuestions).to receive(:render).with(essay)
      subject.discussion_questions_link
    end
  end


  describe 'instructor_rescouces_link' do
    it "calls the link method" do
      EssayDetail::InstructorResources.any_instance.should_receive(:link_to_detail).with('tool-link instructor')
      subject.instructor_resources_link
    end
  end


  describe 'author_biography_link' do

    it "adds the link if there is an author biography " do
      EssayDetail::AuthorBiography.any_instance.stub(:has_content?).and_return(true)
      expect(subject.author_biography_link).to eq("<a class=\"author tool-link\" href=\"#author_biography\">Author<br>Biography</a>")
    end

    it "does not add the link if there is not an author biography" do
      EssayDetail::AuthorBiography.any_instance.stub(:has_content?).and_return(false)
      expect(subject.author_biography_link).to eq(nil)
    end
  end


  describe 'works_cited_link' do

    it "adds the link if there is an author biography " do
      EssayDetail::WorksCited.any_instance.stub(:has_content?).and_return(true)
      expect(subject.works_cited_link).to eq("<a class=\"cited tool-link\" href=\"#works_cited\">Works Cited</a>")
    end

    it "does not add the link if there is not an author biography" do
      EssayDetail::WorksCited.any_instance.stub(:has_content?).and_return(false)
      expect(subject.works_cited_link).to eq(nil)
    end
  end



  describe 'top_of_the_page_link' do
    it "creates the link" do
      expect(subject.top_of_page_link).to eq("<a target=\"_top\" class=\"top tool-link\" href=\"#\">Top of Page</a>")
    end
  end

  describe 'render' do
    it "renders the template " do
      expect(subject).to receive(:render_to_string).with('/essays/nav', { object: subject })
      subject.render
    end

    it "renders with out error " do
      expect { subject.render }.to_not raise_error
    end
  end
end
