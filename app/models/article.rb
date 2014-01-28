class Article < ActiveRecord::Base
  validates_presence_of :title, :body
  has_and_belongs_to_many :tags

  def add_tags(tags)
    tags.each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name)
      self.tags.push(tag)
    end
  end

end
