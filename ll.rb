#!/usr/bin/env ruby

require_relative 'lib/linked_list'

payloads = ARGV # ARGV holds the command line arguments that were passed in

# Now, build a LinkedList
ll = LinkedList.new

# add values from payloads array into our linkedList
payloads.each do |item|
	ll.push(item) 
end

# next goal, print to screen
ll_string = '* -> '

if payloads.any? == false
	print '* -> nil'
else
	count = 0
	while ll.get(count) != nil
		ll_string += "\"" + ll.get(count) + "\" -> "
		count += 1
	end
	print ll_string += "nil"
end