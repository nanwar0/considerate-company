# == Schema Information
#
# Table name: diets
#
#  id          :bigint           not null, primary key
#  name        :string
#  sort_column :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Diet < ApplicationRecord
  has_many  :restrictions, class_name: "Restriction", foreign_key: "diet_id", dependent: :destroy
end
