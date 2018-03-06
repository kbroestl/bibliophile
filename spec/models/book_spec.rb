require 'rails_helper'

RSpec.describe Book, :type => :model do
  it "has a valid factory" do
    expect(FactoryBot.create(:book)).to be_valid
  end

  it "returns sortable English title" do
    book = FactoryBot.create(:book, title: "The Rise and Fall of the Roman Empire")
    expect(book.sortby_title).to eq("Rise and Fall of the Roman Empire")
  end

  it "returns sortable German title" do
    book = FactoryBot.create(:book, title: "Die Elixiere des Teufels")
    expect(book.sortby_title).to eq("Elixiere des Teufels")
  end
end
