class AddBelongsToToUserGroupToUser < ActiveRecord::Migration[5.2]
  def change
    add_belongs_to :users, :user_group, index: true
  end
end
