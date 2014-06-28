class WelcomeController < ApplicationController
  def index
    @words = Word.order("created_at DESC").first(10)
  end
end
