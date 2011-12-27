class CommentReferencesUser < ActiveRecord::Migration
  def up
      change_table :comments do |t|
        t.remove :user
        t.references :user
      end
  end

  def down
      change_table :comments do |t|
        t.remove :user_id
        t.add :user
      end
  end
end
