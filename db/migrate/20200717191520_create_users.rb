class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email
      t.boolean :email_confirmed
      t.string :confirm_token
      t.string :username
      t.string :password_digest
      t.string :title
      t.string :major
      t.boolean :officer

      t.timestamps
    end
  end
end
