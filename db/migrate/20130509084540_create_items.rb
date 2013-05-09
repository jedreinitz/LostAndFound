class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :user
      t.string :name
      t.string :description
      t.boolean :is_lost

      t.timestamps
    end
    add_index :items, :user_id
  end
end
