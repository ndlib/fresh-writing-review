require 'spec_helper'


describe EssayDetail do


  describe :build do

    it "builds from the url slug"

    it "takes into account which issue the essay is a part of "


  end

  let(:essay) { double(Essay, title: 'title', template: "text", body: "", alt_body: "", alt_title: "", author: "Bob Bobbers") }
  subject { described_class.new(essay)}

  describe :title do
    let(:essay) { double(Essay, title: 'title') }

    it "delegates this to essay" do
      expect(essay).to receive(:title)

      subject.title
    end
  end


  describe :author do

    it "creates a named anchor link and adds the by text" do
      expect(subject.author).to eq("By <a href=\"#author_biography\">Bob Bobbers</a>")
    end
  end


  describe :render_works_cited do
    context :has_works_cited do
      let(:essay) { double(Essay, works_cited: "works_cited") }

      it "renders the template " do
        expect(subject).to receive(:render_to_string).with('/essays/works_cited', { object: subject.send(:works_cited) })

        subject.render_works_cited
      end

      it "generates a makrdown_detail" do
        expect(MarkdownDetail).to receive(:new).with("works_cited")
        subject.render_works_cited
      end
    end

    context :no_work_cited do
      let(:essay) { double(Essay, works_cited: nil) }

      it "does not render the template" do
        expect(subject).to_not receive(:render_to_string)
        subject.render_works_cited
      end
    end
  end


  describe :render_discussion_questions do
    context :has_discussion_questions do
      let(:essay) { double(Essay, discussion_questions: "questions") }

      it "renders the template " do
        expect(subject).to receive(:render_to_string).with('/essays/discussion_questions', { object: subject.send(:discussion_questions) })

        subject.render_discussion_questions
      end

      it "generates a makrdown_detail" do
        expect(MarkdownDetail).to receive(:new).with("questions")
        subject.render_discussion_questions
      end
    end

    context :no_work_cited do
      let(:essay) { double(Essay, discussion_questions: nil) }

      it "does not render the template" do
        expect(subject).to_not receive(:render_to_string)
        subject.render_discussion_questions
      end
    end
  end


  describe :determine_template_class do

    it "determines the template is text_template when the essay template is text" do
      essay.stub(:template).and_return('text')

      expect(subject.send(:determine_template_class)).to eq(EssayTemplates::Text)
    end

    it "determines the template is media_template when the essay template is text" do
      essay.stub(:template).and_return('media')

      expect(subject.send(:determine_template_class)).to eq(EssayTemplates::Media)
    end

    it "raises an exception if the essay template is incorrect" do
      essay.stub(:template).and_return('not_a_template')

      expect {subject.send(:determine_template_class)}.to raise_error
    end
  end


  describe :render do

    it "passes the render off to the determinied template" do
      expect(subject.send(:display_template)).to receive(:render)

      subject.render
    end
  end

end
