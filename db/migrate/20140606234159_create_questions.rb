class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :body
      t.belongs_to :user

      t.timestamps
    end
  end
end
