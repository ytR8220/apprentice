class Article < ApplicationRecord
  after_create :generate_slug

  private

  def generate_slug
    update(slug: "#{title.parameterize}-#{id}") if title.present?
  end
end
