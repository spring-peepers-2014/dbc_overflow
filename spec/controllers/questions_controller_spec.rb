require 'spec_helper'

describe 'Question controller' do

	before(:each) do
		@test_question = Question.create(body: 'Do all of these tests work?')
		@test_question.answers << Answer.create(body: 'Let me google that for you') 
		@test_question.comments << Comment.create(body: 'These tests are so helpful!')
	end

	describe '#index' do
		it 'it pulls all questions from database' do
			expect(assigns(:questions)).to eq Question.all
		end
	end

	describe '#new' do
		it 'displays an error msg and does not proceed if question is below a certain length' do
			expect { Question.new(body: 'too short').valid? }.to raise_error QuestionLengthError
		end
	end

	describe '#create' do
		it 'saves the newly created question to the database' do
			expect(Question.find(@test_question.id).body).to eq 'Do all of these tests work?'
		end
	end

	describe '#show' do
		it 'finds the requested question in the database' do
			expect(@test_question).to eq Question.find(@test_question.id)
		end

		it 'finds the answers associated with the requested question' do
			expect(@test_question.answers).to eq Answer.where(question_id: @test_question.id)
			expect(@test_question.answers.first).to eq Answer.where(body: 'Let me google that for you')
		end

		it 'finds the comments associated with the requested question' do
			expect(@test_question.comments).to eq Comment.where(question_id: @test_question.id)
			expect(@test_question.comments.first).to eq Comment.where(body: 'These tests are so helpful!')
		end
	end
end



# NOT IMPLEMENTED IN R0

# describe '#edit' do
# 	it 'finds the requested question to be edited' do
# 	end
# end

# describe '#update' do
# 	it 'updates the requested question with the new values' do
# 	end
# end