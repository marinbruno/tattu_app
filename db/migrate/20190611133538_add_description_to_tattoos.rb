class AddDescriptionToTattoos < ActiveRecord::Migration[5.2]
  def change
    add_column :tattoos, :description, :string
  end
end
