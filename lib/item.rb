class Item
  attr_reader :name,
              :bids

  def initialize(name)
    @name = name
    @bids = Hash.new(0)
  end

  def add_bid(attendee, bid)
    @bids[attendee] = 0 if @bids[attendee].nil?
    @bids[attendee] = bid
  end

  def current_high_bid
    0 if @bids.values.nil?
    @bids.values.max
  end
end
