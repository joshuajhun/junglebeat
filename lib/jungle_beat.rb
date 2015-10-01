
class JungleBeats
  require_relative 'list_jungle_beats'
  attr_accessor :beats, :linked_list


  def initialize(beats)
    @beats = beats
    split_beats = beats.split
    first_beat = split_beats[0]
    @linked_list = List.new(first_beat)
    split_beats[1..-1].each do |beat|
      linked_list.append(beat)
    end
  end

  def prepened(beats)
    split_beats = beats.split
    split_beats[0..-1].each do |beat|
      linked_list.prepened(beat)
    end
  end

  def append(beats)
    split_beats = beats.split
    split_beats[0..-1].each do |beat|
      linked_list.append(beat)
    end
  end

  def all
    linked_list.print_list
  end

  def count
    linked_list.count
  end

  def insert
    linked_list.insert_
  end

  def pop(n = 1)
    linked_list.pop(n)
  end

  def insert(index,number)
    linked_list.insert(index,number)
  end

  def includes?(data)
    linked_list.includes?(data)
  end

  def find(index,position)
    linked_list.find(index,position)
  end

  def play
    `say -r 500 -v Boing #{beats}`
  end
end

run_from_file =  ($PROGRAM_NAME == __FILE__)

if run_from_file
  input_file = ARGV[0]
  beats_string = File.read(input_file)
  sounds_count = beats_string.split.length

  JungleBeats.new(beats_string).play
  puts "Played #{sounds_count} sounds from `#{input_file}`"
end
