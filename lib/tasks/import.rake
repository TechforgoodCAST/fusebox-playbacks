require 'csv'
require 'open-uri'

namespace :import do
  desc 'Create new playbacks from CSV `rake import:transcriptions URL=http://example.com/remote.csv`'
  task transcriptions: :environment do
    CSV.parse(open(ENV['URL']), headers: :first_row, encoding: 'utf-8') do |row|
      playback = Playback.new(
        source: row[0],
        organisation_name: row[1],
        email: row[2],
        project_name: row[3],
        author_name: row[4]
      )

      if playback.save
        {
          'State your problem' => [5, 6],
          'Explain your solution' => [7, 8],
          'Why are you best placed to deliver it?' => [9, 10],
          'What are your key assumptions and questions?' => [11, 12],
          'What resources do you need and what do you need them for?' => [13, 14],
          'What will the impact be?' => [15, 16],
          'This would help me communicate my work today' => [17],
          'This would help me move forwards' => [18]
        }.each do |name, rows|
          playback.sections.create(
            name: name,
            description: row[rows[0]],
            confidence: row[rows[1]]
          )
        end
        print '.'
      else
        print '*'
      end
    end
    puts
  end
end
