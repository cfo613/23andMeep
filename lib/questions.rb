require 'active_record'

class Question < ActiveRecord::Base
  has_many :options
end
