class CreateTags < ActiveRecord::Migration
  def create do |t|
    t.string :name

    t.timestamps
  end
end
