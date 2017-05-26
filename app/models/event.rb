class Event < ApplicationRecord
  acts_as_taggable_on :categorys # post.label_list が追加される
  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス
end
