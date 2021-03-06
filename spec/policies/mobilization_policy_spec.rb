require 'rails_helper'

RSpec.describe MobilizationPolicy do
  context "for a visitor" do
    subject { described_class.new(nil, Mobilization.make!) }
    it { should allow(:index) }
    it { should allow(:show) }
    it { should_not allow(:create) }
    it { should_not allow(:new) }
    it { should_not allow(:update) }
    it { should_not allow(:edit) }
    it { should_not allow(:destroy) }
    it "should have complete scope" do
      expect(subject.scope).to eq Mobilization
    end
    it "should return empty permitted attributes" do
      expect(subject.permitted_attributes).to eq []
    end
  end

  context "for a non-owner user" do
    subject { described_class.new(User.make!, Mobilization.make!) }
    it { should allow(:index) }
    it { should allow(:show) }
    it { should allow(:create) }
    it { should allow(:new) }
    it { should_not allow(:update) }
    it { should_not allow(:edit) }
    it { should_not allow(:destroy) }
    it "should have complete scope" do
      expect(subject.scope).to eq Mobilization
    end
    it "should return permitted attributes" do
      expect(subject.permitted_attributes).to eq [
        :name,
        :color_scheme,
        :google_analytics_code,
        :goal,
        :facebook_share_title,
        :facebook_share_description,
        :facebook_share_image,
        :twitter_share_text,
        :header_font,
        :body_font,
        :custom_domain,
        :slug,
        :organization_id
      ]
    end
  end

  context "for the owner" do
    let(:user) { User.make! }
    subject { described_class.new(user, Mobilization.make!(user: user)) }
    it { should allow(:index) }
    it { should allow(:show) }
    it { should allow(:create) }
    it { should allow(:new) }
    it { should allow(:update) }
    it { should allow(:edit) }
    it { should allow(:destroy) }
    it "should have complete scope" do
      expect(subject.scope).to eq Mobilization
    end
    it "should return permitted attributes" do
      expect(subject.permitted_attributes).to eq [
        :name,
        :color_scheme,
        :google_analytics_code,
        :goal,
        :facebook_share_title,
        :facebook_share_description,
        :facebook_share_image,
        :twitter_share_text,
        :header_font,
        :body_font,
        :custom_domain,
        :slug,
        :organization_id
      ]
    end
  end
end
