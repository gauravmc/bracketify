class User < ActiveRecord::Base
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

  def default_bracket
    [
      group_stage_default_bracket,
      get_final_16_from_group_stage_bracket(group_stage_default_bracket),
      [:brazil, :italy, :france, :germany, :spain, :england, :argentina, :portugal],
      [:brazil, :germany, :england, :portugal],
      [:brazil, :portugal],
      [:portugal]
    ]
  end

  def group_stage_default_bracket
    COUNTRIES.in_groups(8)
  end

  def get_final_16_from_group_stage_bracket(group_stage_bracket)
    gb = group_stage_bracket

    [
      gb[0][0], gb[1][1], gb[2][0], gb[3][1], gb[4][0], gb[5][1], gb[6][0], gb[7][1],
      gb[0][1], gb[1][0], gb[2][1], gb[3][0], gb[4][1], gb[5][0], gb[6][1], gb[7][0]
    ]
  end
end
