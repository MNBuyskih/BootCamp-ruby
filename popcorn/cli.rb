require_relative 'letter'
require_relative 'popcorn'

r = Letter.new('r')
p = Letter.new('p')
n = Letter.new('n')
o = Letter.new('o')
_o = Letter.new('o')
a = Letter.new('a')
c = Letter.new('c')
_p = Letter.new('p')

r.connections = [p, n, o]
p.connections = [r, _o, a, n]
n.connections = [r, p, _o, a, c, o]
o.connections = [r, n, a, c]
_o.connections = [p, _p, a, n]
a.connections = [_o, _p, c, o, n, p]
c.connections = [a, _p, o, n]
_p.connections = [_o, a, c]

popcorn = Popcorn.new([r, p, n, o, _o, a, c, _p], %w[cat dog pop corn popcorn crop corp])
puts popcorn.words
