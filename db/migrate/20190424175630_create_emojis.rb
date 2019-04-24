class CreateEmojis < ActiveRecord::Migration[5.2]
  def change
    create_table :emojis do |t|
      t.references :user, foreign_key: true
      t.text :image
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
