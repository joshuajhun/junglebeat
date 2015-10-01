gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/emoji'
require './lib/list_jungle_beats'

class JungleBeatListTest < Minitest::Test

  def test_it_connects
    node = List.new('string')
    assert_equal ('string'), node.head.data
  end

  def test_it_can_understand_nil
    node = List.new(nil)
    assert_equal (nil), node.head.data
  end

  def test_can_it_find_the_tail
    node = List.new('tail')
    assert_equal "tail", node.find_tail.data
  end


  def test_it_can_append
    list = List.new("zero")
    # binding.pry
    list.append('hello')
    assert_equal "hello", list.find_tail.data
  end

  def test_it_can_prepend_alot
    list = List.new("zero")
    list.append("hello")
    list.append("goodbye")
    list.append("sushi")
    assert_equal"sushi", list.find_tail.data
  end

  def test_it_can_append_nil
    list = List.new(nil)
    list.append('nil')
    assert_equal"nil", list.find_tail.data
  end

  def test_it_can_prepend
    list = List.new("zero")
    list.prepened("hello")
    assert_equal "hello", list.head.data
  end

  def test_it_can_prepend_alot
    list = List.new("zero")
    list.prepened("goodbye")
    list.prepened("whatsgood")
    assert_equal"whatsgood", list.head.data
  end

  def test_it_can_prepend_nil
    list = List.new ("zero")
    list.prepened(nil)
    assert_equal nil, list.head.data
  end

  def test_it_can_count
    list = List.new ("zero")
    list.append('sup')
    list.append('bruh')
    list.append('sweet_beard_bro')
    assert_equal 4, list.count
  end

  def test_it_can_count_alot?
    list = List.new ('zero')
    list.append('sup')
    list.prepened('yup')
    list.append('i_wish_i_had_a_sweet_beard')
    list.append('i wish i didnt suck at coding')
    list.append("i hate nodes")
    list.append('this is the last one i swear')
    list.append("ilied")
    assert_equal 8, list.count
  end

  def test_it_pop
    list= List.new('zero')
    list.append('sup')
    list.append('yup')
    result = list.pop
    assert_equal 'yup', result
    assert_equal'sup', list.find_tail.data
  end

  def test_it_can_find_the_tail_again
    list = List.new('zero')
    list.append('hello')
    list.append('trust')
    list.append('me')
    assert_equal 'me', list.find_tail.data
  end

  def test_insert
    list= List.new('zero')
    list.append('amber_rox')
    list.append('jhun_has_no_sox')
    list.insert('insert_me', 1)
    assert_equal 'zero insert_me amber_rox jhun_has_no_sox', list.print_list
  end

  def test_insert
    list= List.new('zero')
    list.append('amber_rox')
    list.append('jhun_has_no_sox')
    list.append('lets go home')
    list.insert('insert_me', 2)
    assert_equal 'zero amber_rox insert_me jhun_has_no_sox lets go home', list.print_list
  end

  def test_print_list_cause_i_want_to?
    list = List.new("zero")
    list.append("amber_rox")
    list.append('I miss my wife')
    list.prepened('where am i')
    list.prepened('lets go home')
    assert_equal"lets go home where am i zero amber_rox I miss my wife", list.print_list
  end

  def test_to_see_if_its_false
    list = List.new("zero")
    list.append("amber_rox")
    list.append('I miss my wife')
    list.prepened('where am i')
    list.prepened('lets go home')
    assert_equal false, list.includes?("I ")
  end

  def test_to_see_if_its_true_that_a_word_is_included_in_the_list
    list = List.new("zero")
    list.append("amber_rox")
    list.append('I miss my wife')
    list.prepened('where am i')
    list.prepened('lets go home')
    assert_equal true, list.includes?("lets go home")
  end

  def test_head_is_not_data
    list = List.new("zero")
    list.append("amber_rox")
    list.append('I miss my wife')
    list.prepened('where am i')
    list.prepened('lets go home')
    assert_equal true, list.includes?('zero')
  end

  def test_insert
    list= List.new('zero')
    list.append('amber_rox')
    list.append('jhun_has_no_sox')
    list.append('lets go home')
    list.insert('insert_me', 1)
    assert_equal 'zero insert_me amber_rox jhun_has_no_sox lets go home', list.print_list
  end

  def test_if_it_can_find_shtuff
    list= List.new('zero')
    list.append('amber_rox')
    list.append('jhun_has_no_sox')
    list.append('lets go home')
    list.find(1,2)
    assert_equal 'amber_rox jhun_has_no_sox', list.find(1,2)
  end
end
