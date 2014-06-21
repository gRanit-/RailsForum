class Post < ActiveRecord::Base
    validates :text, presence: true
    belongs_to :topic
    belongs_to  :user
end
