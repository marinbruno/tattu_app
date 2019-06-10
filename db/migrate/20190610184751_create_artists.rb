class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.string :instagram_username

      t.timestamps
    end
  end
end
