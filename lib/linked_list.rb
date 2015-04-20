require_relative 'linked_list_item'

class LinkedList

	attr_reader :size

	def initialize(*items)
		@size = 0
		items.each do |payload|
			push(payload)
		end
	end

	##########################################
	# Push item onto linked list
	##########################################
	def push(payload)
		# need to create a new linked list item
		lli = LinkedListItem.new(payload)

		# size = 0, this lli is first on our list
		if @size == 0
			lli.next_item = nil
			@first_item = lli 
			@size = @size + 1
		else
			node = @first_item
			if node.last? 
				lli.next_item = nil
				node.next_item = lli
				@size = @size + 1
			else
				until node.last?
					node = node.next_item
				end
				@size = @size + 1
				lli.next_item = nil
				node.next_item = lli
			end
		end
	end


	##########################################
	# Get item off of linked list based on 
	# the index
	##########################################

	def get(index)
		# raise error if neg index or 
		# index is > size of list
		if index < 0 or index > @size
			raise IndexError
		end
	
		if index == 0
			return @first_item.payload
		else
			node = @first_item
			index.times do
				node = node.next_item
				if node.nil?
					return nil
				end
			end
			return node.payload
		end
	end



	def last
	  if @size == 0
	    return nil
	  else
	  	return get(@size-1)
	  end	
	end


	def to_s
		if @size == 0
			return "| |"
		else
			s = "| "
			node = @first_item
			if node.last?
				return "| " + node.payload + " |"
			else
				until node.last?
					s += node.payload.to_s + ", "
					node = node.next_item
				end
				s += node.payload.to_s + " |" 
			end
		end
	end


	# Override brackets
	def [](index)
		get(index)
	end

	def []=(index, val)
		currentNode = @first_item
		(index).times do |i|
			currentNode = currentNode.next_item
		end
		currentNode.payload = val
	end




	def delete(index)
		if index < 0 or index > @size
			raise IndexError
		end

		currentNode = @first_item
		if index == 0
			# remove first item
			@first_item = currentNode.next_item
		else
			(index-1).times do |i|
				currentNode = currentNode.next_item
			end
			currentNode.next_item = currentNode.next_item.next_item
		end
		@size -= 1
	end


	def index(payload)
		if @size == 0
			return nil
		else
			index = 0
			node = @first_item
			if (node.payload == payload)
				return index
			end

			until node.last?
				node = node.next_item
				index += 1
				if (node.payload == payload)
				  return index
			    end
			end
		end
	end


	def sorted?
		if @size == 0 or @size == 1
			return true
		else
			node = @first_item
			nextNode = node.next_item
	
			# there are at least 2 things in list
			until node.last?
				if node.payload.class == nextNode.payload.class
					if(node.payload > nextNode.payload)
						return false
					end
				else
					# different classes
					if (node.payload.class.to_s < nextNode.payload.class.to_s)
						return false
					end
				end
				node = node.next_item
			end
			return true
		end
	end



	def sort! 
		if !self.sorted?
			#if not sort
		end
	end


end
