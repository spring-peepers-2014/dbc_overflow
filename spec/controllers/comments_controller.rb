require 'spec_helper'

describe "#new" do
  it "assigns a new Comment to @comment" do
    get :new
    expect(assigns(:comment)).to be_a_new(Comment)
  end

  it "renders the :new template" do
    get :new
    expect(response).to render_template :new
  end

end


describe "#create" do
  before :each do
    comment = FactoryGirl.build(:comment)
  end

  context "with valid attributes" do
    it "saves the new comment in the database" do
      expect {
        post :create, :comment => attributes_for(:comment)
        expect(response).to be_success
        }.to change { Comment.count }.by(1)
    end

    it "with invalid attributes" do
      expect {
        post :create
        expect(response.status).to eq 422
        }.to_not change { Comment.count}
    end
  end
end


describe "#edit" do
  it "assigns to the requested comment to @comment" do
    comment = FactoryGirl.build(:comment)
    get :edit, id: comment
    expect(assigns(:comment)).to eq comment
  end
end


describe "#update" do
  before :each do
    comment = FactoryGirl.build(:comment)
  end

  it "changes @comment with updated attributes" do
    post :update, id: comment.id, comment: attributes_for(:comment, title: "DID IT")
    comment.reload
    expect(comment.title).to eq("DID IT")
  end


end
