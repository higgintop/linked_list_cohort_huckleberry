class LinkedList

	attr_reader :size

	def initialize
		@size = 0
		@first_item = nil
	end

	def push(payload)
		# need to create a new linked list item
		lli = LinkedListItem.new(payload)

		# size = 0, this lli is first on our list
		if @size == 0
			puts " ADD FIRST EVER ITEM TO LIST"
			lli.next_item = nil
			@first_item = lli 
			@size = @size + 1
		else
			node = @first_item
			if node.last? 
				puts "ADD SECOND ITEM EVER"
				lli.next_item = nil
				node.next_item = lli
				@size = @size + 1
			else
				puts "ADD THIRD ITEM OR MORE"
				until node.last?
					node = node.next_item
				end
				@size = @size + 1
				lli.next_item = nil
				node.next_item = lli
			end
		end
	end




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







end
