require 'rails_helper'

# Build an article using factory bot
RSpec.describe Article, type: :model do
  describe '#validations' do
    it 'should test that the factory is valid' do
      expect(FactoryBot.build :article).to be_valid
    end

    it 'should validate the presence of the title' do
      article = FactoryBot.build :article, title: ''
      #article = build :article, title: '' (b/c factorybot config added)
      expect(article).not_to be_valid
      expect(article.errors.messages[:title]).to include("can't be blank")
    end

    it 'should validate the presence of the content' do
      article = FactoryBot.build :article, content: ''
      expect(article).not_to be_valid
      expect(article.errors.messages[:content]).to include("can't be blank") 
    end

    it 'should validate the presence of the slug' do
      article = FactoryBot.build :article, slug: ''
      expect(article).not_to be_valid
      expect(article.errors.messages[:slug]).to include("can't be blank")
    end

    it 'should validate the uniqueness of the slug' do
      article = FactoryBot.create :article
      invalid_article = FactoryBot.build :article, slug: article.slug
      expect(invalid_article).not_to be_valid
    end
  end
#currently articles are in default order, newer articles are at the end, write test to make sure newer articles are first
  describe '.recent' do
    it 'should list recent article first' do
      old_article = create :article
      newer_article = create :article
      expect(described_class.recent).to eq(
        [ newer_article, old_article ]
      )
      old_article.update_column :created_at, Time.now
      expect(described_class.recent).to eq(
        [old_article, newer_article ]
      )
    end
  end
end
