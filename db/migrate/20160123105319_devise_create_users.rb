class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :uid, null: false
      t.string :screen_name, null: false
      t.string :url, default: nil
      t.timestamps null: false
    end

    add_index :users, :uid, unique: true
    add_index :users, :screen_name, unique: true
  end
end
