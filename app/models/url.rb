class Url < ApplicationRecord

  before_create :generate_short_url, :sanitize

  def sanitize
    original_url.strip!
    sanitize_url = self.original_url.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
    "#{sanitize_url}"
  end

  def generate_short_url
    rand(36 ** 5).to_s(36)
  end
end
