class Article < ActiveRecord::Base
     
    has_many  :article_categories
    has_many  :categories , through: :article_categories
    paginates_per 5
    belongs_to  :user
    #before_save {self.email= email.downcase}
    validates :title, presence: true, length:{minimum:3, maximum:50}
    validates :description, presence: true, length:{minimum:10, maximum:300}
    validates  :user_id, presence: true
    
end