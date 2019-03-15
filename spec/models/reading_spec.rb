require 'rails_helper'

RSpec.describe Reading, :type => :model do
  it "has a valid factory" do
  	expect(FactoryBot.create(:reading)).to be_valid
  end
end