class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question, null: false
      t.references :commentable, polymorphic: true

      t.timestamps
    end
  end
end
