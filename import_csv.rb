#!/home/peter/.rbenv/shims/ruby
require 'csv'
require './models.rb'
require 'pathname'
require 'pry'

Shot.destroy_all

fields_map = {
   ball_speed: "Ball Speed (km/h)",
   club_speed: "Club Speed (km/h)",
   smash: "Smash",
   carry: "Carry Distance (m)",
   launch_angle: "Launch Angle V (°)",
   spin: "Spin (rpm)",
   height: "Height (m)",
   flight_time: "Time (s)",
   club: "Club"}

Dir.glob('data/*.csv').each do| f |
  filenmame = File.basename(f, ".csv")
  session = Session.find_or_create_by(name: filenmame) do |session|
    session.occured_at = File.mtime(f)
  end

  CSV.foreach(f, headers: true) do |row|
    club_str = row[fields_map[:club]]
    return unless club_str
    club = Club.find_or_create_by(name: club_str)
    values = fields_map.transform_values{ |v| row[v] }
    values = values.merge({club_id: club.id, session_id: session.id})
    values.delete(:club)
    begin
      Shot.create(values)
    rescue
      binding.pry
    end
  end
end

puts Session.all
puts Club.all
puts Shot.all