require 'rails_helper'

RSpec.describe Customer, type: :model do
  subject { create(:customer) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:avatar) }
end
