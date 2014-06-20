class Topic < ActiveRecord::Base
    belongs_to :user
    has_many :posts
    attr_accessor :title,:text
end
