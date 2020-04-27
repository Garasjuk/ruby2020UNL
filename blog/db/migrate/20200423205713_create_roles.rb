class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.boolean :create_at
      t.boolean :read_at
      t.boolean :update_at
      t.boolean :delete_at
      t.boolean :admin_at

      t.timestamps
    end
  end
end
