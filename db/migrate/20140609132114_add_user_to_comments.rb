class AddUserToComments < ActiveRecord::Migration
  def up
    add_column :comments, :user, :belongs_to
  end
  def down
    remove_column :comments, :user, :belongs_to
  end
end
