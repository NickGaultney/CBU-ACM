class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.title :string
      t.major :string
      t.boolean :officer

      t.timestamps
    end
  end
end
