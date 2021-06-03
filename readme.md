#FlightScope & Metabase 

##Setup
`bundle`
`database`


##Metabase

Fix me: Persist DB - Mounting a mapped file storage volume
`docker run -d -p 3000:3000 --name metabase metabase/metabase`

http://192.168.0.3:3000/

##Database

CSV HEADER NAMES
`Ball Speed (km/h)	Club Speed (km/h)	Smash	Carry Distance (m)	Launch Angle V (°)	Spin (rpm)	Height (m)	Time (s)	Club`


##App

Note the `port` depends on you docker container
`mysql --port 49153 -h 192.168.0.3 -u root -prata`