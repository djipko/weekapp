class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start
      t.text :description
      t.references :venue

      t.timestamps
    end
    add_index :events, :venue_id
  end
end
