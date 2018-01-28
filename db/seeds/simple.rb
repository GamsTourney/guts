# Tournaments

t1 = Tournament.create(name: 'small')
t2 = Tournament.create(name: 'large')

# Players

p1 = Player.create(name: 'Bob')
p2 = Player.create(name: 'Steve')
p3 = Player.create(name: 'Jim')
p4 = Player.create(name: 'Kate')
p5 = Player.create(name: 'Sue')
p6 = Player.create(name: 'Melissa')
p7 = Player.create(name: 'Jerry')
p8 = Player.create(name: 'Carl')

# Competitors

t1.players = [p1, p2, p3, p8]
t2.players = [p1, p2, p3, p4, p5, p6, p7, p8]

# Games

g1 = Game.create(name: 'shimmy', scoring: '4,3,2,1')
g2 = Game.create(name: 'shake', scoring: '4,3,2,1')

# Matches

m1 = Match.create(game: g1, competitors: t1.competitors)
m2 = Match.create(game: g1, competitors: t2.competitors[0..4])
m3 = Match.create(game: g2, competitors: t2.competitors[4..8])
