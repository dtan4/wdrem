class Word < ActiveRecord::Base
  validates :word, length: { maximum: 50 }, presence: true
  validates :meaning, length: { maximum: 140 }, presence: true

  before_save :remove_trailing_spaces

  private

  def remove_trailing_spaces
    word.strip!
    meaning.strip!
  end
end
