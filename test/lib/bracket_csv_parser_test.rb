require 'test_helper'

class BracketCsvParserTest < ActiveSupport::TestCase
  test "fetches and returns expected bracket from given .csv" do
    expected_bracket = {
      1 => ["Brazil", "Spain", "Columbia", "Italy", "France", "Argentina", "Germany", "Belgium"],
      2 => ["Croatia", "Netherlands", "Ivory Coast", "England", "Ecuador", "Nigeria", "Portugal", "Korea Republic"],
      4 => ["Mexico", "Chile", "Japan", "Uruguay", "Switzerland", "Bosnia", "United States", "Russia"],
      8 => ["Cameroon", "Australia", "Greece", "Costa Rica", "Honduras", "Iran", "Ghana", "Algeria"],
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
