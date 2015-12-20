class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :surgeon
      t.string :email
      t.string :device
      t.string :annotation
      t.string :hospital

      t.timestamps null: false
    end
  end
end
