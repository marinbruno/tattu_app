class AddBusinessEmailToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :business_email, :string
  end
end
