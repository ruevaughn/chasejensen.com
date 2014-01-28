require 'spec_helper'

describe Tag do
  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :name }
  context "attributes" do
    it("is valid") do
      expect(Tag.new(name: 'hi')).to be_valid
    end
    it("is invalid") do
      expect(Tag.new).to be_invalid
    end
  end
end
