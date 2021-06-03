require 'active_record'
require 'mysql2'

ActiveRecord::Base.establish_connection(
  adapter:  'mysql2',
  host:     '192.168.0.3',
  port: 49153,
  database: 'mevo',
  username: 'root',
  password: 'rata'
)

class Session < ActiveRecord::Base
  has_many :shots

  def to_s
    "#{name} - #{occured_at}"
  end
end

class Club < ActiveRecord::Base
  has_many :shots
  
  def to_s
    name.to_s
  end
end

class Shot < ActiveRecord::Base
  belongs_to :club
  belongs_to :session

  def to_s
    "#{club} - #{carry} - #{smash}"
  end
end