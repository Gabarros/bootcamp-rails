class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.text :content
      t.belongs_to :user, foreign_key: true

     
    end
  end
end
