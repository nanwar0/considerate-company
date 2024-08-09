# == Schema Information
#
# Table name: diets
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Diet < ApplicationRecord
end
