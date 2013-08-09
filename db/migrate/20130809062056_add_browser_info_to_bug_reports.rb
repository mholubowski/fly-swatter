class AddBrowserInfoToBugReports < ActiveRecord::Migration
  def change
    add_column :bug_reports, :browser_info, :string
  end
end
