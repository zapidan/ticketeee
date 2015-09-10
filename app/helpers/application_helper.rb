module ApplicationHelper
  def admins_only(&block)
    block.call if current_user.try(:admin?) #avoid exception if current_user is nil
  end
end
