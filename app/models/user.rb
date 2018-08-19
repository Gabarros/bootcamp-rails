class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets

  has_many :active_relationships, class_name: 'Relationship',
  		    foreign_key: 'follower_id', dependent: :destroy

  has_many :passive_relationships, class_name: 'Relationship',
 			foreign_key: 'followed_id', dependent: :destroy

 has_many :following, through: :active_relationships, source: :followed 
 has_many :followers, through: :passive_relationships, source: :follower

	 def following?(other_user)
	 	following.include? other_user
	 end

	 def follow!(other_user)
	 	# if following
	 	# 	alert: 'Já está seguindo'
	 	# else
	 	# 	current_user.followers.include(other_user)
	 	# 	other_user.following.include(current_user)
	    # 	end

	 	following << other_user
	 	
	 end

	 def unfollow!(other_user)
	 	# passive_relationships.delete(following: other_user)

	 	following.destroy(other_user)
	 	
	 end

	 def feed

	 	#Método que gera feed ao Usuário

	 	# Outra abordagem

	 	users_ids = following.pluck(:id)
	 	users_ids << self.id
	 	Tweet.where(user_id: users_ids).order(created_at: :desc)
	 	# Tweet.where(user_id: following.pluck(:id)).order(created_at: :desc)
	 	
	 end

end
