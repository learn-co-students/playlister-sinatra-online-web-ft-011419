class ChangeArtistTableNameToArtists < ActiveRecord::Migration

  def change
    rename_table :artist, :artists
  end
end
