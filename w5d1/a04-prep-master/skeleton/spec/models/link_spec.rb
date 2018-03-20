# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  title      :string
#  url        :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Link, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
  it 'should validate that :user cannot be empty/falsy' do
    should validate_presence_of(:user).with_message(:required)
  end
  it { should belong_to(:user) }
  it { should have_many(:comments) }
end
