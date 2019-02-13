FactoryBot.define do
  factory :comment do
    commentable { Section.new(id: 1, name: 'State your problem') }
    author { 'John Doe' }
    body { 'What should I work on next?' }
  end
end
