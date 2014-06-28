require "rails_helper"

describe WelcomeController do
  describe "GET #index" do
    before do
      5.times { create(:word) }
    end

    it "should show list of words" do
      get :index
      expect(assigns(:words).length).to eq 5
    end
  end
end
