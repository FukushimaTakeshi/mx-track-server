# == Schema Information
#
# Table name: practice_records
#
#  id            :bigint           not null, primary key
#  practice_date :date             not null
#  hours         :integer          default(0), not null
#  minutes       :integer          default(0), not null
#  memo          :text
#  user_id       :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class PracticeRecord < ApplicationRecord
end
