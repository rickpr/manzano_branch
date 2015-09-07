class AddForbiddenToMember < ActiveRecord::Migration
  def change
    add_column :members, :forbidden, :boolean
  end
end
