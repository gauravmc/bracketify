require 'csv'
require 'bracket_csv_parser'

class User < ActiveRecord::Base
  serialize :bracket

  FINAL_BRACKET = {
    1 => ["Cameroon", "Australia", "Japan", "England", "Honduras", "Iran", "Ghana", "Korea Republic"],
    2 => ["Croatia", "Spain", "Ivory Coast", "Italy", "Ecuador", "Bosnia", "Portugal", "Russia"],
    4 => ["Mexico", "Chile", "Greece", "Uruguay", "Switzerland", "Nigeria", "United States", "Algeria"],
    8 => ["Brazil", "Netherlands", "Columbia", "Costa Rica", "France", "Argentina", "Germany", "Belgium"],
    15 => ["Brazil", "Netherlands", "Columbia", "Coast Rica", "France", "Argentina", "Germany", "Belgium"],
    30 => ["Brazil", "Netherlands", "Germany", "Argentina"],
    50 => ["Germany", "Argentina"],
    100 => ["Germany"]
  }

  def self.from_omniauth(auth)
    where(auth.slice(:uid)).first_or_initialize.tap do |user|
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def image_url
    hash = Digest::MD5.hexdigest(email)
    "http://www.gravatar.com/avatar/#{hash}"
  end

  def save_bracket
    csv = CSV.open(Rails.root.join('public', 'uploads', "#{email.parameterize}.csv"))
    self.bracket = BracketCsvParser.new(csv).bracket
    save
  end

  def points
    @points ||= calculate_points
  end

  private

  def calculate_points
    if bracket.present?
      points = 0
      points += total_points_for_level(1)
      points += total_points_for_level(2)
      points += total_points_for_level(4)
      points += total_points_for_level(8)
      points += total_points_for_level(15)
      points += total_points_for_level(30)
      points += total_points_for_level(50)
      points += total_points_for_level(100)
      points
    end
  end

  def total_points_for_level(level)
    countries = bracket[level] & FINAL_BRACKET[level]
    countries.size * level
  end
end
