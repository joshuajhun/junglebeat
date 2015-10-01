class List
require 'pry'                   # ~> LoadError: cannot load such file -- pry
attr_reader :head
require_relative 'node'

  def initialize(data)
    @head = Node.new(data)
  end

  def find_tail
    temp = @head
      until temp.link == nil
        temp = temp.link
      end
    temp
  end

  def append(data)
    new_node = Node.new(data)
    find_tail.link = new_node
  end

  def prepened(data)
    temp = @head
    @head = Node.new(data)
    @head.link = temp
  end


  def pop(data = 1)
    data.times do
    temp = @head
    until temp.link == find_tail
    temp = temp.link
    end
    temp.link = nil
    end
  end

  def count
    counter = 1
    temp = @head
      until temp.link == nil
        temp = temp.link
        counter +=1
      end
    counter
  end

  def insert (data,position)
    count = 0
    temp = @head
    new_node = Node.new(data)
    until count == position
      count += 1
      temp = temp.link
    end
    new_node.link = temp
    temp = @head
    count = 0
    until count == position - 1
      count += 1
      temp = temp.link
    end
    temp.link = new_node
  end

  def print_list
  temp = @head
  string = ""
    until temp.link == nil
      string << temp.data + " "
      temp = temp.link
    end
    string + find_tail.data
  end

  def includes?(data)
    temp = @head
    until temp == nil
      return true if temp.data == data
      temp = temp.link
    end
    false
  end

  def find (position,num)
    count = 0
    temp = @head
    until count == position
      count += 1
      temp = temp.link
    end
    string = ""
    num.times do
      string << temp.data + " "
      temp = temp.link
      end
    string.strip
  end
end
