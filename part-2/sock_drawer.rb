require_relative 'sock'
require_relative 'sock_matcher'

class SockDrawer
  attr_reader :socks, :matcher

  def initialize(args = {})
    @socks = args.fetch(:socks) { Array.new }
    @matcher = args.fetch(:matcher)
  end

  def supply_match_for(sock_to_match)
    match = @socks.select {|sock| sock.color == sock_to_match.color}
    @socks.delete(match[0])
    match[0]
  end

  def supply_one_pair_of_socks
    result = @socks.group_by {|sock| sock.color }.select {|key, value| value.size > 1}
    @socks.delete_if {|sock| sock.color }
    result.values[0]
  end
end


#Driver Code


# first_white_sock = Sock.new(brand: "Nike", style: "quarter", color: "white")
# second_white_sock = Sock.new(brand: "Nike", style: "quarter", color: "white")
# first_red_sock = Sock.new(brand: "Nike", style: "quarter", color: "red")
# first_black_sock = Sock.new(brand: "Nike", style: "quarter", color: "black")
# socks = [first_white_sock, first_black_sock, first_red_sock, second_white_sock]
# matcher = SockMatcher.new
# drawer =SockDrawer.new(socks: socks, matcher: matcher)
# second_red_sock = Sock.new(brand: "Nike", style: "quarter", color: "red")


# non_matching_socks = [first_white_sock, first_red_sock]
# drawer_with_no_matching_socks = SockDrawer.new(socks: non_matching_socks, matcher: matcher)
# p drawer_with_no_matching_socks.supply_one_pair_of_socks
