require 'rails_helper'

describe Word do
  it { expect(subject).to validate_presence_of :word }
  it { expect(subject).to validate_presence_of :meaning }

  describe "#remove_trailing_spaces" do
    let(:word) do
      create(:word, word: "hoge  ", meaning: "fuga  ")
    end

    it "should remove trailing spaces" do
      expect(word.word).to eq "hoge"
      expect(word.meaning).to eq "fuga"
    end
  end
end
