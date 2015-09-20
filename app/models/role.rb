class Role < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

 # Returns an array of strings or symbols with available roles
  def self.available_roles(options = {})
    symbolArray = options[:symbolize] || false
    available_roles = %w(manager editor viewer)
    return available_roles.map(&:to_sym) if (symbolArray)

    available_roles
  end
end
