require './queues_and_piles.rb'

describe 'Stack (LIFO)' do
  let(:stack) { Stack.new }
  let(:pile) { [1, 2, 3, 4, 5] }
  
  it 'should return an empty list after initialization' do
    expect(stack.pile).to eq([])
  end
  
  it '#push should add an item on top of the pile' do
    stack.push(5)
    expect(stack.pile).to eq([5])
  end
  
  it '#pop should remove the first item of the pile' do
    pile.each{ |x| stack.push(x) }
    stack.pop
    expect(stack.pile).to eq(pile[0..3])
  end
  
  it '#peek should return the first item of the pile' do
    pile.each{ |x| stack.push(x) }
    expect(stack.peek).to eq(pile.last)
  end
  
  it '#empty? should return true if the pile is empty' do
    expect(stack.empty?).to eq(true)
  end
  
  it '#empty? should return false if the pile is populated' do
    stack.push(1)
    expect(stack.empty?).to eq(false)
  end
  
  it '#size should return number of items in the list' do
    size = rand(42) + 1
    size.times{ |i| stack.push(i) }
    expect(stack.size).to eq(size)
  end
end

describe 'Queue (FIFO)' do
  let(:queue) { Queue.new }
  let(:pile) { [1, 2, 3, 4, 5] }
  
  it 'should return an empty list after initialization' do
    expect(queue.pile).to eq([])
  end
  
  it '#queue should add an item at the end of the pile' do
    pile.each{ |x| queue.queue(x) }
    expect(queue.pile).to eq(pile.reverse)
  end
  
  it '#dequeue should remove the first item of the pile' do
    pile.each{ |x| queue.queue(x) }
    queue.dequeue
    expect(queue.pile).to eq(pile[1..-1].reverse)
  end
  
  it '#dequeue should return the first element of the pile' do
    pile.each{ |x| queue.queue(x) }
    expect(queue.dequeue).to eq(pile.last)
    
  end
  
  it '#empty? should return true if the pile is empty' do
    expect(queue.empty?).to eq(true)
  end
  
  it '#empty? should return false if the pile is populated' do
    queue.queue(1)
    expect(queue.empty?).to eq(false)
  end
  
  it '#size should return number of items in the list' do
    size = rand(42) + 1
    size.times{ |i| queue.push(i) }
    expect(queue.size).to eq(size)
  end
end