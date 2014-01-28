require 'spec_helper'

describe Article do
  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
  context "with attributes" do
    it 'is valid' do
      expect(Article.create(title: 'title', body: 'this is a body')).to be_valid
    end
  end

  context "#add_tags" do
    let(:article) { FactoryGirl.create (:article) }
    let(:tags) { %w( chef rspec ) }

    context("tags already exist") do
      before(:each) do
        tags.each { |tag_name| Tag.create(name: tag_name ) }
      end

      it "adds tags to articles association passsed" do
        article = FactoryGirl.create (:article)
        expect{ article.add_tags(tags) }.to change(article.tags, :count).by(2)
      end

      it "doesn't create the tags again" do
        expect{ article.add_tags(tags) }.to change(Tag, :count).by(0)
      end
    end

    context("tags don't already exist") do
      it "creates the tags" do
        expect{ article.add_tags(tags) }.to change(Tag, :count).by(2)
      end
      it "creates the association" do
        expect{ article.add_tags(tags) }.to change(article.tags, :count).by(2)
      end
    end
  end
end
