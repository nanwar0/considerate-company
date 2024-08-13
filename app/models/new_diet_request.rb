# == Schema Information
#
# Table name: new_diet_requests
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class NewDietRequest < ApplicationRecord
  belongs_to :user
end
