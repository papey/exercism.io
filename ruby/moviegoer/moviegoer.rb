# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  ADULT_AGE = 18
  OLDER_AGE = 60
  DISCOUNT_PRICE = 10
  NORMAL_PRICE = 15

  private_constant :OLDER_AGE, :DISCOUNT_PRICE, :NORMAL_PRICE, :ADULT_AGE

  attr_reader :age, :member

  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    age >= OLDER_AGE ? DISCOUNT_PRICE : NORMAL_PRICE
  end

  def watch_scary_movie?
    age >= ADULT_AGE
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    raise NotMovieClubMemberError unless member

    '🍿'
  end
end
