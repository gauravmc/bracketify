require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#points returns correct number based on the bracket comparison with final bracket" do
    user = User.first
    user.bracket = {
      1 => ["Cameroon", "Australia", "Greece", "Costa Rica", "Honduras", "Iran", "Ghana", "Algeria"],
      2 => ["Mexico", "Chile", "Japan", "Uruguay", "Switzerland", "Bosnia", "United States", "Russia"],
      4 => ["Croatia", "Netherlands", "Ivory Coast", "England", "Ecuador", "Nigeria", "Portugal", "Korea Republic"],
      8 => ["Brazil", "Spain", "Columbia", "Italy", "France", "Argentina", "Germany", "Belgium"],
      15 => ["Brazil", "Spain", "Columbia", "Italy", "France", "Argentina", "Germany", "Portugal"],
      30 => ["Brazil", "Spain", "Germany", "Argentina"],
      50 => ["Germany", "Argentina"],
      100 => ["Argentina"]
    }
    user.save

    assert_equal 226, user.points
  end
end
