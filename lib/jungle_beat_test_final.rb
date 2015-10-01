gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/emoji'
require_relative 'jungle_beat.rb'

class JungleBeatTestFinal  < Minitest::Test
  def test_jungle_beats_exist
    assert JungleBeats
  end

  def test_it_takes_beats
    assert JungleBeats.new("deep dep dep deep")
  end

  def test_it_append
    jb = JungleBeats.new('deep dep dep deep')
    jb.append("deep bop bop deep")
    assert_equal "deep dep dep deep deep bop bop deep", jb.all
  end

  def test_it_can_do_it_all
    jb = JungleBeats.new("deep dep dep deep deep bop bop deep")
    jb.all
    assert_equal "deep dep dep deep deep bop bop deep", jb.all
  end

  def test_it_can_include?
    jb = JungleBeats.new("deep dep dep deep deep bop bop deep")
    jb.includes?("dep")
    jb.append('yup')
    jb.prepened('doode')
    assert true, jb.includes?("dep")
  end

  def test_dat_can_pop_doe
    jb = JungleBeats.new("deep dep dep deep deep bop bop deep")
    jb.pop(4)
    assert_equal "deep dep dep deep", jb.all
  end

  def test_it_can_count
    jb = JungleBeats.new ("deep dep dep deep deep bop bop deep")
    jb.prepened('dep dep')
    jb.count
    assert_equal 10, jb.count
  end

  def test_it_can_prepened
    jb = JungleBeats.new("deep bop bop deep")
    jb.append('sup')
    jb.append('grup dup')
    jb.prepened("deep dep dep deep")
    assert_equal "deep dep dep deep deep bop bop deep sup grup dup", jb.all
  end

  def test_it_can_insert
    jb = JungleBeats.new ("deep bop bop deep")
    jb.append('cool')
    jb.insert('boop',1)
    assert_equal "deep boop bop bop deep cool", jb.all
  end

  def test_it_can_find
    jb = JungleBeats.new("deep bop bop deep beep")
    jb.find(1,4)
    assert_equal"bop bop deep beep", jb.find(1,4)
  end
end
