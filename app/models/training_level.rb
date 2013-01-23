require 'uri_validator'

class TrainingLevel < ActiveRecord::Base
  include ActsAsTree

  has_many :subjects, :dependent => :destroy
  has_one  :level_description
  has_many :competencies, :through => :level_description
  has_many :qualifications, :through => :level_description
  has_many :level_goals, :through => :level_description

  attr_accessible :description, :name, :short_name, :parent_id, :logo, :url
  acts_as_tree :order => "name"

  has_attached_file :logo, :styles => { :medium => "300x300>", 
                                        :small => "100x100>", 
                                        :tiny => "32x32>", 
                                        :invisible => "16x16>" },
                           :default_url => '/images/:attachment/missing_:style.png'
                                 
  before_create { |tl| tl.build_level_description }

  validates_uniqueness_of :name
  validates_uniqueness_of :short_name, :allow_blank => true
  validates_presence_of :name
  validates :url, :uri => { 
     :format => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix }

     scope :roots, where(:parent_id => nil)

     def self.leaves
       tl = arel_table
       where(tl[:id].in( 
		select(:parent_id).uniq.map(&:parent_id).compact).not
	     )
     end
      

     class << self
       alias_method :modules, :leaves
     end

    def is_leaf?
       self.class.leaves.include? self
    end

end
