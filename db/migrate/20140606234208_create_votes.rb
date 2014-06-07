class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :vote_value
      t.belongs_to :user
      t.references :voteable, polymorphic: true

      t.timestamps
    end
  end
end
