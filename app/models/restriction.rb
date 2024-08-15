# == Schema Information
#
# Table name: restrictions
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  diet_id    :integer
#  friend_id  :integer
#
class Restriction < ApplicationRecord
  belongs_to :friend, class_name: "Friend", foreign_key: "friend_id"
  belongs_to :diet, class_name: "Diet", foreign_key: "diet_id"
end
