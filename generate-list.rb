require 'json'
require 'csv'

adjectives = JSON.load(File.open('adjectives.json'))
nouns = JSON.load(File.open('nouns.json'))
domains = CSV.parse(File.open('domains.csv')).map{|l| l[0]}

email_list = []
20000.times do
  if rand < 0.99
    adj = adjectives.sample
    noun = nouns.sample
    domain = domains.sample
    sep = if rand < 0.6
            '.'
          else
            ''
          end
    email = "#{adj}#{sep}#{noun}@#{domain}"
    email_list << email
    if rand < 0.05
      ndups = rand(1..30)
      ndups.times do
        email = adj + "."*rand(0..15) + noun + "+" + nouns.sample + "@" + domain
        email_list << email
      end
    elsif rand < 0.02
      email = email_list.last
      email += ",#{adjectives.sample.capitalize} #{nouns.sample.capitalize}"
      email_list[email_list.length - 1] = email
    end
  else
    r = rand
    if r < 0.2
      email_list << "#{adjectives.sample}#{adjectives.sample}"
    elsif r < 0.5
      email_list << "#{nouns.sample}#{adjectives.sample}"
    elsif r < 0.8
      email_list << domains.sample
    else
      email_list << "#{adjectives.sample}@#{nouns.sample}"
    end
  end
end

email_list.shuffle!
email_list.each do |email|
  puts email
end
