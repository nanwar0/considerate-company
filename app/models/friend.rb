# == Schema Information
#
# Table name: friends
#
#  id         :bigint           not null, primary key
#  address    :text
#  birthday   :date
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Friend < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  has_many  :restrictions, class_name: "Restriction", foreign_key: "friend_id", dependent: :destroy
end
