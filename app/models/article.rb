class Article < ActiveRecord::Base
  # rspec ./spec/models/article_spec.rb:24
  validates :content, presence: true
  validates :title, presence: true
  # validates_presence_of :content

  has_many :comments, inverse_of: :article, dependent: :destroy
end
