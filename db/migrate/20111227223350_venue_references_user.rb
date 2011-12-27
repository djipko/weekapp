class VenueReferencesUser < ActiveRecord::Migration
  def up
      change_table :venues do |t|
        t.references :user
      end
  end

  def down
      change_table :venues do |t|
        t.remove :user_id
      end
  end
end
