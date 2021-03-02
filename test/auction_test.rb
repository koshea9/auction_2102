require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/auction'
require './lib/attendee'

class AuctionTest < Minitest::Test

  def test_it_exists
    auction = Auction.new

    assert_instance_of Auction, auction
  end

  def test_it_has_items
    auction = Auction.new

    assert_equal [], auction.items
  end

  def test_it_can_add_items
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    Attendee.new(name: 'Megan', budget: '$50')
    auction = Auction.new

    auction.add_item(item1)
    auction.add_item(item2)

    assert_equal [item1, item2], auction.items
  end

def test_it_can_show_item_names
  item1 = Item.new('Chalkware Piggy Bank')
  item2 = Item.new('Bamboo Picture Frame')
  Attendee.new(name: 'Megan', budget: '$50')
  auction = Auction.new

  auction.add_item(item1)
  auction.add_item(item2)

  assert_equal ["Chalkware Piggy Bank", "Bamboo Picture Frame"], auction.item_names
end

def test_it_can_add_bids
  item1 = Item.new('Chalkware Piggy Bank')
  item2 = Item.new('Bamboo Picture Frame')
  item3 = Item.new('Homemade Chocolate Chip Cookies')
  item4 = Item.new('2 Days Dogsitting')
  item5 = Item.new('Forever Stamps')
  attendee1 = Attendee.new(name: 'Megan', budget: '$50')
  attendee2 = Attendee.new(name: 'Bob', budget: '$75')
  attendee3 = Attendee.new(name: 'Mike', budget: '$100')
  auction = Auction.new
  auction.add_item(item1)
  auction.add_item(item2)
  auction.add_item(item3)
  auction.add_item(item4)
  auction.add_item(item5)

  assert_equal ({}), item1.bids

  item1.add_bid(attendee2, 20)
  item1.add_bid(attendee1, 22)

  assert_equal ({
    attendee2 => 20,
    attendee1 => 22
    }), item1.bids
end

def test_it_can_find_high_bid
  item1 = Item.new('Chalkware Piggy Bank')
  item2 = Item.new('Bamboo Picture Frame')
  item3 = Item.new('Homemade Chocolate Chip Cookies')
  item4 = Item.new('2 Days Dogsitting')
  item5 = Item.new('Forever Stamps')
  attendee1 = Attendee.new(name: 'Megan', budget: '$50')
  attendee2 = Attendee.new(name: 'Bob', budget: '$75')
  attendee3 = Attendee.new(name: 'Mike', budget: '$100')
  auction = Auction.new
  auction.add_item(item1)
  auction.add_item(item2)
  auction.add_item(item3)
  auction.add_item(item4)
  auction.add_item(item5)

  assert_equal ({}), item1.bids

  item1.add_bid(attendee2, 20)
  item1.add_bid(attendee1, 22)

  assert_equal 22, item1.current_high_bid
end

def test_it_can_list_unpopular_items
  item1 = Item.new('Chalkware Piggy Bank')
  item2 = Item.new('Bamboo Picture Frame')
  item3 = Item.new('Homemade Chocolate Chip Cookies')
  item4 = Item.new('2 Days Dogsitting')
  item5 = Item.new('Forever Stamps')
  attendee1 = Attendee.new(name: 'Megan', budget: '$50')
  attendee2 = Attendee.new(name: 'Bob', budget: '$75')
  attendee3 = Attendee.new(name: 'Mike', budget: '$100')
  auction = Auction.new
  auction.add_item(item1)
  auction.add_item(item2)
  auction.add_item(item3)
  auction.add_item(item4)
  auction.add_item(item5)
  item1.add_bid(attendee2, 20)
  item1.add_bid(attendee1, 22)
  item4.add_bid(attendee3, 50)

  assert_equal [item2, item3, item5], auction.unpopular_items

  item3.add_bid(attendee2, 15)

  assert_equal [item2, item5], auction.unpopular_items
  end

  def test_it_can_calculate_potential_revenue
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')
    attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    attendee3 = Attendee.new(name: 'Mike', budget: '$100')
    auction = Auction.new
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    item4.add_bid(attendee3, 50)
    item3.add_bid(attendee2, 15)

    assert_equal 87,auction.potential_revenue
  end
end
