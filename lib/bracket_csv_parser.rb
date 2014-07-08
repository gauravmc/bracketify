class BracketCsvParser
  def initialize(csv)
    @csv_array = csv.to_a
    @bracket = {
      1 => [],
      2 => [],
      4 => [],
      8 => [],
      15 => [],
      30 => [],
      50 => [],
      100 => []
    }
  end

  def bracket
    fetch_1_pointers
    fetch_2_pointers
    fetch_4_pointers
    fetch_8_pointers
    fetch_15_pointers
    fetch_30_pointers
    fetch_50_pointers
    fetch_100_pointers

    @bracket
  end

  def fetch_1_pointers
    @bracket[1].concat(Hash[*@csv_array[13][1..8]].values).concat(Hash[*@csv_array[20][1..8]].values)
  end

  def fetch_2_pointers
    @bracket[2].concat(Hash[*@csv_array[12][1..8]].values).concat(Hash[*@csv_array[19][1..8]].values)
  end

  def fetch_4_pointers
    @bracket[4].concat(Hash[*@csv_array[11][1..8]].values).concat(Hash[*@csv_array[18][1..8]].values)
  end

  def fetch_8_pointers
    @bracket[8].concat(Hash[*@csv_array[10][1..8]].values).concat(Hash[*@csv_array[17][1..8]].values)
  end

  def fetch_15_pointers
    @bracket[15] << @csv_array[24].compact << @csv_array[28].compact << @csv_array[32].compact << @csv_array[36].compact
    @bracket[15].flatten!
  end

  def fetch_30_pointers
    @bracket[30] << @csv_array[26].compact << @csv_array[34].compact
    @bracket[30].flatten!
  end

  def fetch_50_pointers
    @bracket[50] << @csv_array[30].compact.first << @csv_array[30].compact.last
    @bracket[50].flatten!
  end

  def fetch_100_pointers
    @bracket[100] << @csv_array[30].compact[1]
  end
end
