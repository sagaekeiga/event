class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :image
      t.string :hp
      t.string :leader
      t.date :date
      t.time :start
      t.time :close
      t.string :capacity
      t.string :place
      t.string :contact
      t.string :target
      t.integer :rank,              null: false, default: 0

      t.timestamps
    end
  end
end
