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
  { name: "Kansas City Chiefs", logo: "KCCHiefs.jpg", league: "NFL", api_id: "KC", api_used: "sportsfeed" },
  { name: "Atlanta Falcons", logo: "AtlantsFalcons.jpg", league: "NFL", api_id: "ATL", api_used: "sportsfeed" },
  { name: "Golden State Warriors", logo: "GoldenState.jpg", league: "NBA", api_id: "GSW", api_used: "sportsfeed" },
  { name: "Atlanta Hawks", logo: "AtlantsHawks.jpg", league: "NBA", api_id: "ATL", api_used: "sportsfeed" },
  { name: "Dallas Mavericks", logo: "Mavericks.jpg", league: "NBA", api_id: "DAL", api_used: "sportsfeed" },
])

# user_team = UserTeam.create!([
#   { user_id: 1, team_id: 1 },
#   { user_id: 1, team_id: 3 },
#   { user_id: 2, team_id: 2 },
#   { user_id: 2, team_id: 1 },
#   { user_id: 3, team_id: 3 },
#   { user_id: 3, team_id: 2 },
# ])
