# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# users = User.create!([
#   { name: "John Doe", password_digest: "kdsjafhiuvnu", email: "jdoe@gmail.com" },
#   { name: "Jane Smith", password_digest: "eiwuyrtioqewpni", email: "jsmith@gmail.com" },
#   { name: "IM Nuts", password_digest: "easkdjfhi", email: "imnuts@gmail.com" },
# ])

teams = Team.create!([
  { name: "Texas Longhorns", logo: "Longhorns.jpg", league: "NCAAF", api_id: "Texas", api_used: "NCAAF_API" },
# { name: "New York Yankees", logo: "Yankees.jpg", league: "MLB", api_id: "OAK", api_used: "sportsfeed" },
# { name: "Ottawa Senators", logo: "Senators.jpg", league: "NHL", api_id: "OTT", api_used: "sportsfeed" },
# { name: "San Jose Sharks", logo: "SJSharks.jpg", league: "NHL", api_id: "SJS", api_used: "sportsfeed" },
# { name: "Dallas Mavericks", logo: "Mavericks.jpg", league: "NBA", api_id: "DAL", api_used: "sportsfeed" },
])

# user_team = UserTeam.create!([
#   { user_id: 1, team_id: 1 },
#   { user_id: 1, team_id: 3 },
#   { user_id: 2, team_id: 2 },
#   { user_id: 2, team_id: 1 },
#   { user_id: 3, team_id: 3 },
#   { user_id: 3, team_id: 2 },
# ])
