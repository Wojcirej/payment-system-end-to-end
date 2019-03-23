require 'active_record'
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  self.establish_connection(YAML::load_file(File.join('config', 'database.yml'))['default'])
end
