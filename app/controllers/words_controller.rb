class WordsController < ApplicationController
  def create
    word = Word.new(word_params)

    if word.save
      flash[:notice] = "保存しました: #{word.word}"
      head 201
    else
      render json: { errors: word.errors.full_messages }, status: 422
    end
  end

  def show
  end

  private

  def word_params
    params.require(:word).permit(:word, :meaning)
  end
end
