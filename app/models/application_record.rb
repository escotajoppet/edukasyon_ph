require 'app_helper'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
