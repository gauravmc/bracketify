require 'test_helper'

class BracketCsvParserTest < ActiveSupport::TestCase
  test "fetches and returns expected bracket from given .csv" do
    expected_bracket = {
      1 => ["Cameroon", "Australia", "Greece", "Costa Rica", "Honduras", "Iran", "Ghana", "Algeria"],
      2 => ["Mexico", "Chile", "Japan", "Uruguay", "Switzerland", "Bosnia", "United States", "Russia"],
      4 => ["Croatia", "Netherlands", "Ivory Coast", "England", "Ecuador", "Nigeria", "Portugal", "Korea Republic"],
      8 => ["Brazil", "Spain", "Columbia", "Italy", "France", "Argentina", "Germany", "Belgium"],
      15 => ["Brazil", "Spain", "Columbia", "Italy", "France", "Argentina", "Germany", "Portugal"],
      30 => ["Brazil", "Spain", "Germany", "Argentina"],
      50 => ["Germany", "Argentina"],
      100 => ["Argentina"]
    }
    csv = CSV.open(Rails.root.join('test', 'fixtures', 'files', 'sample_bracket.csv'))
    parser = BracketCsvParser.new(csv)

    assert_equal expected_bracket, parser.bracket
  end
end
