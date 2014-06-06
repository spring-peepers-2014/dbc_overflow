require 'spec_helper'


describe "User can add a comment" do
  let(:question) { Question.new(title: "this is a question", body: "this is the body!")}

  context "with valid title" do
    it "by going on the question's page" do
      visit questions_show(question)
      fill_in "Comment", :with => "this is a comment!!"
      click_on "Submit"
      wait_for_ajax_to_finish
      expect(page).to have_content "this is a comment!!"
    end
  end

  context "with invalid title" do
    it "blank title" do
      visit questions_show(question)
      fill_in "Comment", :with => nil
      click_on "Submit"
      wait_for_ajax_to_finish
      expect(page).to have_content "comment can't be blank"
    end
  end
end


