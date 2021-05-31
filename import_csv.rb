#!/home/peter/.rbenv/shims/ruby
require 'csv'
require 'active_record'
require 'mysql2'

ActiveRecord::Base.establish_connection(
  adapter:  'mysql2',
  host:     '192.168.0.3',
  database: 'mevo',
  username: 'root',
  password: 'rata'
)

class Session < ActiveRecord::Base
  has_many :session
end

class Club < ActiveRecord::Base
  has_many :shots
end

class Shot < ActiveRecord::Base
  belongs_to :club
  belongs_to :session
end


puts Club.all
some_class = Club.new

fields_map = {
  "Ball Speed (km/h)": "ball_speed",
  "Club Speed (km/h)": "club_speed",
  "Smash": "smash",
  "Carry Distance (m)": "carry_distance",
  "Launch Angle V (°)": "launch_angle",
  "Spin (rpm)": "spin",
  "Height (m)": "height",
  "Time (s)": "time",
  "Club": "club",
}

puts fields_map

CSV.foreach("stats.csv", headers: true) do |row|
  #puts row
end
