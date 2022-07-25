require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#validations' do
    let(:article) {build(:article)}

    it "tests article object" do
      expect(article).to be_valid
    end

    it "has invalid title" do
      article.title = ''
      expect(article).not_to be_valid
      expect(article.errors[:title]).to include("can't be blank")
    end

    it "has invalid content" do
      article.content = ''
      expect(article).not_to be_valid
      expect(article.errors[:content]).to include("can't be blank")
    end

    it "has invalid slug" do
      article.slug = ''
      expect(article).not_to be_valid
      expect(article.errors[:slug]).to include("can't be blank")
    end

    it "has unique slug" do
      # article2 = Article.create(title:'Sample article', content: 'Article content', slug: 'sample-article5')
      # expect(article2).to be_valid
      # puts article2.slug
      # expect(article).not_to be_valid
      article1 = create(:article)
      expect(article1).to be_valid
      article2 = build(:article, slug: article1.slug)
      expect(article2).not_to be_valid
      expect(article2.errors[:slug]).to include("should appear once per article")
    end
  end
end
