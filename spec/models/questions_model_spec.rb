require 'spec_helper'

describe 'Questions Model' do

	context 'With valid data' do
		it 'Saves question to database' do
			expect { Question.create!(name: "Test me please", body: "This should go into the DB") }.to_not raise_error
			expect { Question.create!(name: "Test me please", body: "This should go into the DB") }.to change(Question, :count).by(1)
		end
	end

	context 'With invalid data' do
		it 'should reject questions that are too short' do
			expect { Question.create!(name: "Bad Data", body: "hi") }.to raise_error
		end
	end
end