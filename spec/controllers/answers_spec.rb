require 'spec_helper'

describe AnswersController do

  describe "POST #create" do
    context "with VALID attributes" do
      it "saves the new answer in the database" do
        expect {
          post :create, answer: FactoryGirl.attributes_for(:answer)
        }.to change(Answer, :count).by(1)
      end

      it "redirects back to the question page" do
        post :create, answer: FactoryGirl.attributes_for(:answer)
        exepect(response).to redirect_to question_url
      end
    end

    context "with INVALID attributes" do
      it "does NOT save the new answer in the database" do
        expect {
          post :create, answer: FactoryGirl.attributes_for(:answer, body: '')
        }.to change(Answer, :count).by(0)
      end

      it "displays error" do
        post :create, answer: FactoryGirl.attributes_for(:answer, body: '')
        expect (response).to display_alert
      end
    end # context "with INVALID attributes" do

  end # describe "POST #create" do
end # describe AnswersController do

### on submit, action => answers#new
# class Answer

#   def new
# @answer = Answer.new
#   end

# end

### questions/show.html.erb
# <p>@question.name</p>
# <p>@question.body</p>
# <% render "answers/new %>

### answers/new.html.erb
# <form>
#
# </form>

# questions/show.html.erb
# <% render "answers" %>
