class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def self.find_by_slug(param)
  #   if resource = find_by(slug: param)
  #     return resource
  #   elsif resource = find(param)
  #     return resource
  #   else
  #     raise params.inspect
  #   end
  # end
end
