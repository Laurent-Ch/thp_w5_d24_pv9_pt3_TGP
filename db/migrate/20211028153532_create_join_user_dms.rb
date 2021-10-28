class CreateJoinUserDms < ActiveRecord::Migration[5.2]
  def change
    create_table :join_user_dms do |t|
      t.belongs_to :recipient, index: true
      t.belongs_to :dm, index: true

      t.timestamps
    end
  end
end
