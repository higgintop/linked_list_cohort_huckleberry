class LinkedListItem
  include Comparable

  # automatically makes getter for payload and next_item
  attr_reader :payload, :next_item


  # Initialize method called for new
  def initialize(payload) 
  	@payload = payload
  end

  def payload=(val)
    @payload = val
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
    return @next_item.nil?
  	#if @next_item == nil
  	#	return true
  	#else
  	#	return false
  	#end
  end


  # Comparable method
  def <=>(other)
    if self.payload.class == other.payload.class
      return self.payload <=> other.payload
    else
      # can be symbol vs. string
      # can be fixnum vs. string
      return self.payload.class.to_s <=> other.payload.class.to_s
    end
  end


  # reset the === method functionality 
  # Comparable messes it up
  def ===(other)
  	return self.equal?(other)
  end
 

end
