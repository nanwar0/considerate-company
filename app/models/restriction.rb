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
end
