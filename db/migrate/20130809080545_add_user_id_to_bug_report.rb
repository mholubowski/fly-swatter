class AddUserIdToBugReport < ActiveRecord::Migration
  def change
    add_column :bug_reports, :user_id, :integer
  end
end
