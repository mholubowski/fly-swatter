class CreateBugReports < ActiveRecord::Migration
  def change
    create_table :bug_reports do |t|
      t.string :page_url
      t.text :description

      t.timestamps
    end
  end
end
