class User < ActiveRecord::Base
  serialize :bracket

  COUNTRIES = [:brazil, :croatia, :mexico, :cameroon,
    :spain, :netherlands, :chile, :australia,
    :colombia, :greece, :ivory_coast, :japan,
    :england, :italy, :uruguay, :costa_rica,
    :france, :ecuador, :switzerland, :honduras,
    :argentina, :bosnia, :iran, :nigeria,
    :germany, :portugal, :united_states, :ghana,
    :belgium, :algeria, :russia, :korea_republic]

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
end
