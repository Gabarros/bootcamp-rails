class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|

    	t.integer :follower_id
    	t.integer :followed_id

    	t.belongs_to :user, foreign_key: true



      t.timestamps
    end
  end
end
