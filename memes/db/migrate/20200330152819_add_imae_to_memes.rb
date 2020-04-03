class AddImaeToMemes < ActiveRecord::Migration[6.0]
  def change
    add_column :memes, :image, :string
  end
end
