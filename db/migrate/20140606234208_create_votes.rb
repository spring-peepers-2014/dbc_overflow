class CreateVotes < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :vote_value
      t.belongs_to :user
      t.voteable, polymorphic: true

      t.timestamps
    end
  end
end
