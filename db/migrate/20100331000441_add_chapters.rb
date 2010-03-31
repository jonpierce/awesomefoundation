class AddChapters < ActiveRecord::Migration
  def self.up
    rename_column :submissions, :chapter, :chapter_id
    create_table :chapters do |t|
      t.string :name
      t.string :slug
    end
    remove_index :submissions, :chapter
    add_index :submissions, :chapter_id
  end

  def self.down
    rename_column :submissions, :chapter_id, :chapter
    drop_table :chapters
    remove_index :submissions, :chapter_id
    add_index :submissions, :chapter
  end
end
