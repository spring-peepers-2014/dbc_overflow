require 'spec_helper'

describe "Answer" do

  before :each do
    question = FactoryGirl.create(:question, name: "Example Question")
    # visit homepage
    visit root_path
    # click question link
    click_link "Example Question"
  end

  context "a user can create an answer for a question with VALID params" do
    it "by visiting a specified question page" do
      # visit question page
      expect(page.current_url).to eq question_url(question)
    end

    it "by creating an answer to a question" do
      # fill out _form_for answers
      fill_in 'Text', with: 'Have you tried turning it off and on again?'
      # click answer form submit button
      click_button 'Submit'
      # profit
      expect(page).to have_content "Have you tried turning it off and on again?"
    end
  end # describe "a user can create an answer for a question" do

  context "a user can NOT create an answer for a question with INVALID params" do
    it "by creating an answer to a question WITHOUT a body" do
      fill_in 'Text', with: ''
      click_button 'Submit'
      expect(page).to not_have_content "Have you tried turning it off and on again?"
    end
  end

  describe "a user can view all answers for a question" do
    it "by looking at the answers for that question" do
      answers = []
      3.times { answers << FactoryGirl.create(:answer, question: question) }
    end
  end

end # describe "Answer" do


