require 'active_record'

class Response < ActiveRecord::Base
  belongs_to :users
end
