class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :code
    end

    add_index :roles, :code, unique: true
  end
end
