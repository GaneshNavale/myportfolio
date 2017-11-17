class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
			t.string :to
			t.string :from
			t.string :message, null: false
			t.string :name
			t.string :email
      t.timestamps null: false
    end
  end
end
