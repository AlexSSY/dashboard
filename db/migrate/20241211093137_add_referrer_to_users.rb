class AddReferrerToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :user_id, :integer
  end
end
