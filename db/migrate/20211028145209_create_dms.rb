class CreateDms < ActiveRecord::Migration[5.2]
  def change
    create_table :dms do |t|
      t.text :content
      t.references :sender, index: true
      t.references :recipient, index: true
      t.timestamps
    end
  end
end
