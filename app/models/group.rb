# == Schema Information
#
# Table name: groups
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  friend_id  :integer
#  user_id    :integer
#
class Group < ApplicationRecord
  belongs_to :user
  belongs_to :friend
end
