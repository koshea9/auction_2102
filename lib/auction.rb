class Auction
  attr_reader :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    @items.map do |item|
      item.name
    end
  end

  def unpopular_items
    @items.find_all do |item|
      item.bids.length < 1
    end
  end

  def potential_revenue
    list = @items.find_all do |item|
      item.current_high_bid
    end.uniq
    list.map do |item|
      item.bids.values
    end.flatten.sum
  end

  def bidders
    names = []
    @items.map do |item|
      item.bids.each do |key, value|
        names << key.name
      end
    end
    names[1..3]
  end

  def bidder_info
    bidder_list = {}
    @items.each do |item|
      item.bids.each do |attendee, bid|
        bidder_list[attendee] = {budget: 0, items: []} if bidder_list[attendee].nil?
        bidder_list[attendee][:budget] += bid
        bidder_list[attendee][:items] << item
      end
    end
  bidder_list
  end
end
