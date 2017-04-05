# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
#
# t.string  "name", 
# t.string  "description",
# t.string  "location",
# t.integer "user_id",

Meetup.create(name: 'Trans Lunar Rocks', description: 'Studying tiny rocks beyond the moon of Earth', location: 'Lunar Base 1', user_id: 1)
Meetup.create(name: 'Astro Ballet', description: 'No clue what this would be', location: 'Deep Space 9', user_id: 1)
Meetup.create(name: 'Surfing Solar Flares',description: 'This cannot be safe...', location: 'Outer Corona of the Sun', user_id: 2)
Meetup.create(name: 'Zero Grav Juggling', description: 'Really hard to catch', location: 'Microgravity of the Kuiper Belt', user_id: 2)
