FactoryBot.define do
  factory :insight do
    name { 'Problem' }
    certainty { Insight::CERTAINTY[0] } # We know
  end
end
