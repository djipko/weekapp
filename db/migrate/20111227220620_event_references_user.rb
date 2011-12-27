class EventReferencesUser < ActiveRecord::Migration
  def up
      change_table :events do |t|
        t.references :user
      end
  end

  def down
      change_table :events do |t|
        t.remove :user_id
      end
  end
end
