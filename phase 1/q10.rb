class ItemNotAvailableError < StandardError; end

class LibraryItem
  attr_reader :title, :author
  attr_accessor :checked_out

  def initialize(title,author)
    @title = title
    @author = author
    @checked_out = false
  end

  def check_out
    if @checked_out
      raise ItemNotAvailableError, "Error: #{@title} already checked out"
    end
    @checked_out = true
    puts "Success: Checked out #{@title}"
  end
  def return_item
    @checked_out = false
    puts "success: #{@title} returned"
  end
end

class Book < LibraryItem
  attr_accessor :page_count

  def initialize(title, author, page_count)
    super(title, author)
    @page_count = page_count
  end
end

class Magazine < LibraryItem
  attr_accessor :issue_number
  
  def initialize(title, author, issue_number)
    super(title, author)
    @issue_number = issue_number
  end
end

def library_demo
  gatsby = Book.new("The Great Gatsby", "F. Scott Fitzgerald",218)
  gatsby.check_out

  begin
    puts "Attempting to check #{gatsby.title} again"
    gatsby.check_out
  rescue ItemNotAvailableError => e
    puts "Exception caught: #{e.message}"
  end
  gatsby.return_item
end

library_demo