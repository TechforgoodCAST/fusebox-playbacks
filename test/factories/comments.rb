FactoryBot.define do
  factory :comment do
    step { nil }
    author { 'John Doe' }
    body { 'What should I work on next?' }
  end
end
