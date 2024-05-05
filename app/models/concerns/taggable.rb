module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, as: :taggable, :dependent => :destroy
    has_many :tags, through: :taggings
  end

  def save_tags(tag_list)
    self.tags.clear
    tag_list.each do |tag_name|
      tag = Tag.find_or_create_by(name: tag_name.strip)
      self.tags << tag unless self.tags.include?(tag)
    end
  end

  def tag_list(category)
    tags.where(category: category).pluck(:name).join(', ')
  end
end
