class CreateAnswers < ActiveRecord::Migration
  def change
    create_table do |t|
      t.text :body
      t.belongs_to :user
      t.belongs_to :question

      t.timestamps
    end
  end
end
