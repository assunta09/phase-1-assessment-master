require_relative 'sock'
require_relative 'sock_matcher'

class SockDrawer
  attr_reader :socks, :matcher

  def initialize(args = {})
    @socks = args.fetch(:socks) { Array.new }
    @matcher = args.fetch(:matcher)
  end

  def supply_match_for(sock_1)
    sock_match = @socks.select {|sock_2| @matcher.match?(sock_1, sock_2)}
    @socks.delete(sock_match[0])
    sock_match[0]
  end

  def supply_one_pair_of_socks
    matching_pair = ''
    i = 1
    while i < @socks.length
      j = 0
      while j < @socks.length
        if @matcher.match?(@socks[i], @socks[j])
          matching_pair = [@socks[i], @socks[j]]
          @socks.delete(@socks[i])
          @socks.delete(@socks[j])
        end
        j+=1
      end
      i += 1
    end
    matching_pair
  end

end




first_white_sock = Sock.new(brand: "Nike", style: "quarter", color: "white")
second_white_sock = Sock.new(brand: "Nike", style: "quarter", color: "white")
first_red_sock = Sock.new(brand: "Nike", style: "quarter", color: "red")
first_black_sock= Sock.new(brand: "Nike", style: "quarter", color: "black")

socks = [first_white_sock, first_black_sock, first_red_sock, second_white_sock]
matcher = SockMatcher.new
drawer = SockDrawer.new(socks: socks, matcher: matcher)
second_red_sock = Sock.new(brand: "Nike", style: "quarter", color: "red")
p drawer.supply_one_pair_of_socks
