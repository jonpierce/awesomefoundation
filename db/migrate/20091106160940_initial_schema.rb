class InitialSchema < ActiveRecord::Migration
  def self.up
    create_table :submissions, :force => true do |t|
      t.string   :name
      t.string   :url
      t.string   :email
      t.string   :phone
      t.text     :description
      t.integer  :chapter
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index :submissions, :chapter
  end

  def self.down
    drop_table :submissions
  end
end
