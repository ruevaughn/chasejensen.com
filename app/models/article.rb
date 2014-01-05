class Article < ActiveRecord::Base
  # include FriendlyId
  # friendly_id :title

  acts_as_taggable
end
