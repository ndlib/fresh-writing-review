require 'spec_helper'


describe MarkdownMediaSplitter do
  subject { described_class }

  it "splits the content on the split tag " do
    ms = subject.new(one_media_tag)

    expect(ms.top_text).to eq(split_top_text)
    expect(ms.bottom_text).to eq(split_bottom_text)
  end


  it "puts all the content in the bottom if the split tag is not found" do
    ms = subject.new(no_media_tag)

    expect(ms.top_text).to eq("")
    expect(ms.bottom_text).to eq(no_media_tag)
  end


  it "splits on the first split tag" do
    ms = subject.new(multiple_media_tags)

    expect(ms.top_text).to eq(split_top_text)
    expect(ms.bottom_text).to eq(split_bottom_text)
  end


  it "removes any additional split tags from the bottom" do
    ms = subject.new(multiple_media_tags)
    expect(ms.bottom_text[subject::SPLIT_TAG]).to be_nil
  end


  let(:one_media_tag) {
"
    An h1 header
============

Paragraphs are separated by a blank line.

2nd paragraph. *Italic*, **bold**, `monospace`. Itemized lists
look like:

  * this one
  * that one
  * the other one
<!!media-bar!!>
Note that --- not considering the asterisk --- the actual text
content starts at 4-columns in.

> Block quotes are
> written like so.
>
> They can span multiple paragraphs,
> if you like.

Use 3 dashes for an em-dash. Use 2 dashes for ranges (ex. \"it's all in
chapters 12--14\"). Three dots ... will be converted to an ellipsis.
"
}
  let(:no_media_tag) {
"
    An h1 header
============

Paragraphs are separated by a blank line.

2nd paragraph. *Italic*, **bold**, `monospace`. Itemized lists
look like:

  * this one
  * that one
  * the other one

Note that --- not considering the asterisk --- the actual text
content starts at 4-columns in.

> Block quotes are
> written like so.
>
> They can span multiple paragraphs,
> if you like.

Use 3 dashes for an em-dash. Use 2 dashes for ranges (ex. \"it's all in
chapters 12--14\"). Three dots ... will be converted to an ellipsis.
"
  }


  let(:multiple_media_tags) {
"
    An h1 header
============

Paragraphs are separated by a blank line.

2nd paragraph. *Italic*, **bold**, `monospace`. Itemized lists
look like:

  * this one
  * that one
  * the other one
<!!media-bar!!>
Note that --- not considering the asterisk --- the actual text
content starts at 4-columns in.

> Block quotes are
> written like so.
>
> They can span multiple paragraphs,
> if you like.<!!media-bar!!>

Use 3 dashes for an em-dash. Use 2 dashes for ranges (ex. \"it's all in
chapters 12--14\"). Three dots ... will be converted to an ellipsis.
"
  }
  let(:split_top_text) {
"
    An h1 header
============

Paragraphs are separated by a blank line.

2nd paragraph. *Italic*, **bold**, `monospace`. Itemized lists
look like:

  * this one
  * that one
  * the other one
"
  }

  let(:split_bottom_text) {
"
Note that --- not considering the asterisk --- the actual text
content starts at 4-columns in.

> Block quotes are
> written like so.
>
> They can span multiple paragraphs,
> if you like.

Use 3 dashes for an em-dash. Use 2 dashes for ranges (ex. \"it's all in
chapters 12--14\"). Three dots ... will be converted to an ellipsis.
"
  }

end
