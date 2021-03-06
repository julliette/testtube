class StoryType < ActiveRecord::Base
  belongs_to :project
  has_many :baseline_tasks, :dependent => :destroy, :foreign_key => 'story_type_id'
  has_many :user_stories, :dependent => :destroy, :foreign_key => 'story_type_id'

  attr_accessible :story_type_name
  validates :story_type_name, 
    :uniqueness => {:message => "name must be unique", :scope => :project_id}
end
