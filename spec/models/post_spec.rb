require 'rails_helper'

RSpec.describe Post, type: :model do
  it "body,place_name,difficult,user_idがあれば投稿できる。" do
    expect(FactoryBot.create(:post)).to be_valid
  end

  it "bodyがなければ投稿できない。" do
    expect(FactoryBot.build(:post, body: "")).not_to be_valid
  end
  it "bodyが140文字以上ならば投稿できない。" do
    expect(FactoryBot.build(:post, body: "#{'a' * 141}")).not_to be_valid
  end

  it "place_nameがなければ投稿できない。" do
    expect(FactoryBot.build(:post, place_name: "")).not_to be_valid
  end

  it "difficultがなければ投稿できない。" do
    expect(FactoryBot.build(:post, difficult: "")).not_to be_valid
  end
end
