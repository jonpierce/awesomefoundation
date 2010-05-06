class AddTitleToSubmissions < ActiveRecord::Migration
  def self.up
    add_column :submissions, :title, :string
  end

  def self.down
    remove_column :submissions, :title
  end
end
