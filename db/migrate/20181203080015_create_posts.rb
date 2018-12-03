class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
    	t.string :caption
    	t.string :photo
    	t.integer :total_votes
    	t.belongs_to :user
    	
    	t.timestamps
    end
  end
end
