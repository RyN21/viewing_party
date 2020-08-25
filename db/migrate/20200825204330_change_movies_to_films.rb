class ChangeMoviesToFilms < ActiveRecord::Migration[5.2]
  def change
    rename_table :movies, :films
  end
end
