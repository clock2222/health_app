class Status < ApplicationRecord
  belongs_to :user, optional: true

  enum sex: {
    default: 0,
    male: 1,
    female: 2,
    other: 3
  }, _prefix: true

  enum age: {
    default: 0,
    up_to_nine: 1,
    up_to_fourteen: 2,
    up_to_nineteen: 3,
    up_to_twenty_four: 4,
    up_to_twenty_nine: 5,
    up_to_thirty_four: 6,
    up_to_thirty_nine: 7,
    up_to_forty_four: 8,
    up_to_forty_nine: 9,
    up_to_fifty_four: 10,
    up_to_fifty_nine: 11,
    up_to_sixty_four: 12,
    up_to_sixty_nine: 13,
    up_to_seventy_four: 14,
    up_to_feventy_nine: 15,
    up_to_eighty_four: 16,
    up_to_eighty_nine: 17,
    up_to_ninety_four: 18,
    up_to_ninety_nine: 19,
    up_to_one_hundred_four: 20,
    up_to_one_hundred_nine: 21,
    up_to_one_hundred_fourteen: 22,
    up_to_one_hundred_nineteen: 23
  }, _prefix: true

  enum height: {
    default: 0,
    up_to_ninety_nine: 1,
    up_to_one_hundred_four: 2,
    up_to_one_hundred_nine: 3,
    up_to_one_hundred_fourteen: 4,
    up_to_one_hundred_nineteen: 5,
    up_to_one_hundred_twenty_four: 6,
    up_to_one_hundred_twenty_nine: 7,
    up_to_one_hundred_thirty_four: 8,
    up_to_one_hundred_thirty_nine: 9,
    up_to_one_hundred_forty_four: 10,
    up_to_one_hundred_forty_nine: 11,
    up_to_one_hundred_fifty_four: 12,
    up_to_one_hundred_fifty_nine: 13,
    up_to_one_hundred_sixty_four: 14,
    up_to_one_hundred_sixty_nine: 15,
    up_to_one_hundred_seventy_four: 16,
    up_to_one_hundred_seventy_nine: 17,
    up_to_one_hundred_eighty_four: 18,
    up_to_one_hundred_eighty_nine: 19,
    up_to_one_hundred_ninety_four: 20,
    up_to_one_hundred_ninety_nine: 21,
    up_to_two_hundred_four: 22,
    up_to_two_hundred_nine: 23,
    up_to_two_hundred_fourteen: 24,
    up_to_two_hundred_nineteen: 25,
    up_to_two_hundred_twenty_four: 26,
    up_to_two_hundred_twenty_nine: 27
  }, _prefix: true

  enum weight: {
    default: 0,
    up_to_ten: 1,
    up_to_nineteen: 2,
    up_to_twenty_nine: 3,
    up_to_thirty_nine: 4,
    up_to_forty_four: 5,
    up_to_forty_nine: 6,
    up_to_feventy_four: 7,
    up_to_feventy_nine: 8,
    up_to_sixty_four: 9,
    up_to_sixty_nine: 10,
    up_to_seventy_four: 11,
    up_to_seventy_nine: 12,
    up_to_eighty_four: 13,
    up_to_eighty_nine: 14,
    up_to_ninety_four: 15,
    up_to_ninety_nine: 16,
    up_to_one_hundred_four: 17,
    up_to_one_hundred_nine: 18,
    up_to_one_hundred_fourteen: 19,
    up_to_one_hundred_nineteen: 20,
    up_to_one_hundred_twenty_four: 21,
    up_to_one_hundred_twenty_nine: 22,
    up_to_one_hundred_thirty_four: 23,
    up_to_one_hundred_thirty_nine: 24,
    up_to_one_hundred_forty_four: 25,
    up_to_one_hundred_forty_nine: 26
  }, _prefix: true

  enum body_type: {
    default: 0,
    under_weight: 1,
    normal_range: 2,
    pre_muscle: 3,
    muscle_class_one: 4,
    muscle_class_two: 5,
    muscle_class_three: 6,
    pre_obese: 7,
    obese_class_one: 8,
    obese_class_two: 9,
    obese_class_three: 10
  }, _prefix: true

  enum meal: {
    default: 0,
    one_on_less_than: 1,
    one_on_one: 2,
    one_on_two: 3,
    one_on_three: 4,
    two_on_less_than: 5,
    two_on_one: 6,
    two_on_two: 7,
    two_on_three: 8,
    three_on_less_than: 9,
    three_on_one: 10,
    three_on_two: 11,
    three_on_three: 12,
    four_on_less_than: 13,
    four_on_one: 14,
    four_on_two: 15,
    four_on_three: 16,
    five_on_less_than: 17,
    five_on_one: 18,
    five_on_two: 19,
    five_on_three: 20,
    six_on_less_than: 21,
    six_on_one: 22,
    six_on_two: 23,
    six_on_three: 24

  }, _prefix: true

  enum movement: {
    default: 0,
    low_activities: 1,
    middle_activities: 2,
    high_activities: 3

  }, _prefix: true

  enum sleep: {
    default: 0,
    six_hours_or_less_zero: 1,
    six_hours_or_less_one: 2,
    six_hours_or_less_tw0: 3,
    six_hours_or_less_three: 4,
    six_seven_hours_and_zero: 5,
    six_seven_hours_and_one: 6,
    six_seven_hours_and_two: 7,
    six_seven_hours_and_three: 8,
    eight_hours_or_more_zero: 9,
    eight_hours_or_more_one: 10,
    eight_hours_or_more_two: 11,
    eight_hours_or_more_three: 12,
    other_hours: 13
  }, _prefix: true

  enum environment: {
    default: 0,
    low: 1,
    high: 2,
    low_preferred: 3,
    high_preferred: 4,
    equivalent: 5
  }, _prefix: true

  enum annual_income: {
    default: 0,
    ninety_nine: 1,
    million: 2,
    twenty_million: 3,
    thirty_million: 4,
    fourty_million: 5,
    fivety_million: 6,
    sixty_million: 7,
    seventy_million: 8,
    eighty_million: 9,
    ninety_million: 10,
    thousand: 11,
    twenty_thousand: 12,
    thirty_thousand: 13,
    one_hundred_million: 14
  }, _prefix: true
end
