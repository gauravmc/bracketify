module UsersHelper
  COUNTRY_CODES = {
    dz: "Algeria",
    ar: "Argentina",
    au: "Australia",
    be: "Belgium",
    ba: "Bosnia",
    br: "Brazil",
    cm: "Cameroon",
    cl: "Chile",
    co: "Columbia",
    cr: "Costa Rica",
    hr: "Croatia",
    ec: "Ecuador",
    gb: "England",
    fr: "France",
    de: "Germany",
    gh: "Ghana",
    gr: "Greece",
    hn: "Honduras",
    ir: "Iran",
    it: "Italy",
    ci: "Ivory Coast",
    jp: "Japan",
    kr: "Korea Republic",
    mx: "Mexico",
    nl: "Netherlands",
    ng: "Nigeria",
    pt: "Portugal",
    ru: "Russia",
    es: "Spain",
    ch: "Switzerland",
    us: "United States",
    uy: "Uruguay"
  }

  def get_groups_from_bracket(bracket)
    {
      A: [bracket[8][0], bracket[4][0], bracket[2][0], bracket[1][0]],
      B: [bracket[8][1], bracket[4][1], bracket[2][1], bracket[1][1]],
      C: [bracket[8][2], bracket[4][2], bracket[2][2], bracket[1][2]],
      D: [bracket[8][3], bracket[4][3], bracket[2][3], bracket[1][3]],
      E: [bracket[8][4], bracket[4][4], bracket[2][4], bracket[1][4]],
      F: [bracket[8][5], bracket[4][5], bracket[2][5], bracket[1][5]],
      G: [bracket[8][6], bracket[4][6], bracket[2][6], bracket[1][6]],
      H: [bracket[8][7], bracket[4][7], bracket[2][7], bracket[1][7]]
    }
  end

  def country_code(name)
    COUNTRY_CODES.key(name)
  end
end
