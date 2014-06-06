require 'spec_helper'

describe 'Comment' do
  context "validations" do
    it { should validate_presence_of :body }
  end
end

