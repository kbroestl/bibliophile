require 'rails_helper'

RSpec.describe Author, :type => :model do
  it "has a valid factory" do
    expect(FactoryBot.create(:author)).to be_valid
  end

  it "returns an author's full name as a string" do
    author = FactoryBot.create(:author, author_first: "Isaac", author_last: "Asimov")
    expect(author.name).to eq("Isaac Asimov")
  end
end
