require 'rails_helper'

RSpec.describe Book, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:book)).to be_valid
  end

  it "returns sortable title" do
    book = FactoryGirl.create(:book, title: "The Rise and Fall of the Roman Empire")
    expect(book.sortby_title).to eq("Rise and Fall of the Roman Empire")
  end

  it "returns sortable German title" do
    book = FactoryGirl.create(:book, title: "Des Teufels General")
    expect(book.sortby_title).to eq("Teufels General")
  end
end