require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "default_bracket is as expected" do
    user = User.first
    expected = [
      [[:brazil, :croatia, :mexico, :cameroon], [:spain, :netherlands, :chile, :australia], [:colombia, :greece, :ivory_coast, :japan], [:england, :italy, :uruguay, :costa_rica], [:france, :ecuador, :switzerland, :honduras], [:argentina, :bosnia, :iran, :nigeria], [:germany, :portugal, :united_states, :ghana], [:belgium, :algeria, :russia, :korea_republic]],
      [:brazil, :netherlands, :colombia, :italy, :france, :bosnia, :germany, :algeria, :croatia, :spain, :greece, :england, :ecuador, :argentina, :portugal, :belgium],
      [:brazil, :italy, :france, :germany, :spain, :england, :argentina, :portugal],
      [:brazil, :germany, :england, :portugal],
      [:brazil, :portugal],
      [:portugal]
    ]

    assert_equal expected, user.default_bracket
  end
end
