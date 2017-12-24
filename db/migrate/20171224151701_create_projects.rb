class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string  :name, null: false
      t.string  :url
      t.text :description
      t.timestamps null: false
    end
  end
end
