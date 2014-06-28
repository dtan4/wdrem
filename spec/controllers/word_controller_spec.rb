require 'rails_helper'

describe WordController do
  describe "GET #show" do
    it "should render the :show template" do
      word = create(:word)
      get :show, id: word
      expect(response).to render_template :show
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "should save the new word in the database" do
        expect do
          post :create, word: attributes_for(:word)
        end.to change(Word, :count).by(1)
      end
    end

    context "with invalid params" do
      it "should save the new word in the database" do
        expect do
          post :create, word: attributes_for(:invalid_word)
        end.not_to change(Word, :count)
      end
    end
  end
end
