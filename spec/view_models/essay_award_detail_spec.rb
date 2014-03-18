require 'spec_helper'


describe EssayAwardDetail do
  let(:issue) { double(Issue, title: 'title', id: 1, friendly_id: 'fid') }
  let(:essay_award) { double(EssayAward, title: 'title', id: 1, friendly_id: 'eafid') }

  subject { described_class.new(issue, essay_award)}

  describe '#link_to_detail' do
    it 'links to the style show page' do
      expect(subject.link_to_detail).to eq("<a href=\"/issues/fid/award/eafid\"><img alt=\"Fff\" src=\"http://placehold.it/211x135/A4A774/fff\" /></a> <a class=\"title\" href=\"/issues/fid/award/eafid\">title</a>")
    end
  end


end
