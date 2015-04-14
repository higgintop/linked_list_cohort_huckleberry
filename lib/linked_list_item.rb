class LinkedListItem
  include Comparable

  # automatically makes getter for payload and next_item
  attr_reader :payload, :next_item


  # Initialize method called for new
  def initialize(payload = "defaultPayload", next_item = nil) 
  	@payload = payload
  	@next_item = next_item
  end


  # Setter method for next_item
  def next_item=(nextItem)
  	 if nextItem === self
  		raise ArgumentError
  	 else
  	 	@next_item = nextItem
  	 end
  end

  # Last? method
  def last?
  	if @next_item == nil
  		return true
  	else
  		return false
  	end
  end


  # Comparable method
  def <=>(other)
  	return self.payload.to_s <=> other.payload.to_s
  end

  # reset the === method functionality 
  # Comparable messes it up
  def ===(other)
  	return self.equal?(other)
  end
 

end
