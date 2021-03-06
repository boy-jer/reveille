class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :label
      t.string :type
      t.references :contactable, polymorphic: true
      t.string :address
      t.string :uuid, null: false

      t.timestamps
    end
    add_index :contacts, :contactable_id
  end
end
