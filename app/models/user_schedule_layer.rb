# == Schema Information
#
# Table name: user_schedule_layers
#
#  id                :integer          not null, primary key
#  uuid              :string(255)      not null
#  position          :integer          not null
#  schedule_layer_id :integer
#  user_id           :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class UserScheduleLayer < ActiveRecord::Base
  include Identifiable
  hound
  
  belongs_to :schedule_layer
  belongs_to :user

  acts_as_list scope: :schedule_layer

  validates :user_id, uniqueness: { scope: :schedule_layer_id }
  validates :schedule_layer_id, uniqueness: { scope: :user_id }

  scope :for, ->(user, schedule_layer) { where(user_id: user.id, schedule_layer_id: schedule_layer.id) }

  def to_schedule
    UserSchedule.new(user, schedule_layer).build
  end

end
