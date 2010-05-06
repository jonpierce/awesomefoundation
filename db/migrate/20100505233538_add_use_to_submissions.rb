class AddUseToSubmissions < ActiveRecord::Migration
  def self.up
    add_column :submissions, :use, :text
  end

  def self.down
    remove_column :submissions, :use
  end
end
