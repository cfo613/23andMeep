require 'active_record'

class Option < ActiveRecord::Base
  belongs_to :questions
end
