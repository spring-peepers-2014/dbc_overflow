require 'spec_helper'

describe 'Questions Features' do

	before(:each) do
		question = FactoryGirl.create(:question, name: "Example Question", body: "This text better be in the show question view")
	end

	describe '#index' do
		it 'shows all questions' do
			expect(@questions).to eq Question.all
		end
	end
	
	describe 'User should be able to click on a question to see its answers' do	
		it 'displays specific question and answers' do
			visit root_path
			click_link "Example Question"
			expect(page).to have_content "This text better be in the show question view"

		end
	end

	describe 'User should be able to create a new question' do
		context 'with valid input' do 
			it 'User should be able to enter data and post question' do
				visit new_question_path
				fill_in "name", with: "TESTING ME"
				fill_in "body", with: "So help me god I better be in a test database!"
				click_on "Submit"
				expect(page).to have_content "TESTING ME"
			end
		end
		
		context 'with invalid input' do 
			it 'should present the user with an error message regarding question length' do
				visit new_question_path
				fill_in "name", with: "TESTING ME"
				fill_in "body", with: "hi"
				click_on "Submit"
				expect(page).to have_content "Question is too short."
			end
		end
	end
end