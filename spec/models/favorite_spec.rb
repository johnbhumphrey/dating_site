require 'spec_helper'

describe Favorite do
  let(:profile) { create(:profile, user: create(:user)) }
  let(:other_profile) { create(:profile, user: create(:user)) }

  it "should create a new hidden user given valid attributes" do
	profile.favorites.create!(favoritee_id: other_profile).should be_valid	
  end

  it "should not be able to mass assign favoriter_id" do
  	expect { Favorite.new(favoriter_id: profile, favoritee_id: other_profile) }.to raise_error
  end

  it "requires both a sender and receiver id" do
  	Favorite.new(favoritee_id: profile).should_not be_valid
  end

  it "should not create 2 objects with the same favoritee/favoriter id" do
  	profile.favorites.create!(favoritee_id: other_profile)
  	profile.favorites.build(favoritee_id: other_profile).should_not be_valid
  end

  describe "associations" do
  	it { should respond_to(:favoriter) }
  	it { should respond_to(:favoritee) }
  end
end
# == Schema Information
#
# Table name: favorites
#
#  id           :integer         not null, primary key
#  favoriter_id :integer
#  favoritee_id :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

