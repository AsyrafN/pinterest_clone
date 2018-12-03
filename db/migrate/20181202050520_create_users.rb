class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	t.string :email, null: false
    	t.string :first_name
    	t.string :last_name
    	t.string :gender
    	t.string :avatar
        t.integer :total_post
    	t.integer :role, default: 0
    	t.string :password_digest

    	t.timestamps
    end
  end
end
