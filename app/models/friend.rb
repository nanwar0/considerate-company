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
end
