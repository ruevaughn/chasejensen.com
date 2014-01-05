class Article < ActiveRecord::Base
  include FriendlyId
  friendly_id :title
end
