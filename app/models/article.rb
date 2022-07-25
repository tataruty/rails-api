class Article < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :slug, presence: true, uniqueness: {message: "should appear once per article"}
end
