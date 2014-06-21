class Topic < ActiveRecord::Base
    validates :title, presence: true
    validates :text, presence: true
    belongs_to :user
    has_many :posts, :dependent=>:delete_all
end
