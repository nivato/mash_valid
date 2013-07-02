class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.boolean :active

      t.timestamps
    end
  end
end
