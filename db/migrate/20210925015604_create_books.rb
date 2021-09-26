class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|

      t.string     :title,       null:false
      t.string     :author,      null:false
      t.integer    :genre_id,    null:false
      t.text       :thoughts,  null:false
      t.string     :sentence,    null:false
      t.text       :synopsis,    null:false
      t.string     :begining,    null:false
      t.references :user,        null:false, foreign_key: true

      t.timestamps
    end
  end
end
