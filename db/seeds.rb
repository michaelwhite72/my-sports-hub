# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
  { name: "John Doe", password_digest: "kdsjafhiuvnu", email: "jdoe@gmail.com" },
  { name: "Jane Smith", password_digest: "eiwuyrtioqewpni", email: "jsmith@gmail.com" },
  { name: "IM Nuts", password_digest: "easkdjfhi", email: "imnuts@gmail.com" },
])

teams = Team.create!([
  { name: "Dallas Cowboys", logo: "dallas.jpg", league: "NFL", api_id: "DAL", api_used: "sportsfeed" },
  { name: "San Antonio Spurs", logo: "SASpurs.jpg", league: "NBA", api_id: "27", api_used: "balldontlie" },
  { name: "Texas Longhorns", logo: "longhorns.jpg", league: "NCAAF", api_id: "texas", api_used: "NCAAF" },
])

user_team = UserTeam.create!([
  { user_id: 1, team_id: 1 },
  { user_id: 1, team_id: 3 },
  { user_id: 2, team_id: 2 },
  { user_id: 2, team_id: 1 },
  { user_id: 3, team_id: 3 },
  { user_id: 3, team_id: 2 },
])
