# This kata: http://codekata.com/kata/kata02-karate-chop/

# In my opinion the iterative version is the only relevant one, but the kata02
# specification includes the creation of different implementations to this,
# for training purposes

require "test/unit"

def chop(search, array)
  a = 0
  b = array.length - 1
  while true
    c = (a + b) / 2
    if a > b
      return -1
    elsif array[c] == search
      return c
    elsif array[c] > search
      b = c - 1
    else
      a = c + 1
    end
  end
end

def chop_recursive(search, array, a = 0, b = array.length - 1)
  c = (a + b) / 2
  if a > b
    -1
  elsif array[c] == search
    c
  elsif array[c] > search
    chop_recursive(search, array, a, c - 1)
  else
    chop_recursive(search, array, c + 1, b)
  end
end

class TestChop < Test::Unit::TestCase
  def test_chop
    assert_equal(-1, chop(3, []))
    assert_equal(-1, chop(3, [1]))
    assert_equal(0,  chop(1, [1]))
    #
    assert_equal(0,  chop(1, [1, 3, 5]))
    assert_equal(1,  chop(3, [1, 3, 5]))
    assert_equal(2,  chop(5, [1, 3, 5]))
    assert_equal(-1, chop(0, [1, 3, 5]))
    assert_equal(-1, chop(2, [1, 3, 5]))
    assert_equal(-1, chop(4, [1, 3, 5]))
    assert_equal(-1, chop(6, [1, 3, 5]))
    # #
    assert_equal(0,  chop(1, [1, 3, 5, 7]))
    assert_equal(1,  chop(3, [1, 3, 5, 7]))
    assert_equal(2,  chop(5, [1, 3, 5, 7]))
    assert_equal(3,  chop(7, [1, 3, 5, 7]))
    assert_equal(-1, chop(0, [1, 3, 5, 7]))
    assert_equal(-1, chop(2, [1, 3, 5, 7]))
    assert_equal(-1, chop(4, [1, 3, 5, 7]))
    assert_equal(-1, chop(6, [1, 3, 5, 7]))
    assert_equal(-1, chop(8, [1, 3, 5, 7]))
  end

  def test_chop_recursive
    assert_equal(-1, chop_recursive(3, []))
    assert_equal(-1, chop_recursive(3, [1]))
    assert_equal(0,  chop_recursive(1, [1]))
    #
    assert_equal(0,  chop_recursive(1, [1, 3, 5]))
    assert_equal(1,  chop_recursive(3, [1, 3, 5]))
    assert_equal(2,  chop_recursive(5, [1, 3, 5]))
    assert_equal(-1, chop_recursive(0, [1, 3, 5]))
    assert_equal(-1, chop_recursive(2, [1, 3, 5]))
    assert_equal(-1, chop_recursive(4, [1, 3, 5]))
    assert_equal(-1, chop_recursive(6, [1, 3, 5]))
    # #
    assert_equal(0,  chop_recursive(1, [1, 3, 5, 7]))
    assert_equal(1,  chop_recursive(3, [1, 3, 5, 7]))
    assert_equal(2,  chop_recursive(5, [1, 3, 5, 7]))
    assert_equal(3,  chop_recursive(7, [1, 3, 5, 7]))
    assert_equal(-1, chop_recursive(0, [1, 3, 5, 7]))
    assert_equal(-1, chop_recursive(2, [1, 3, 5, 7]))
    assert_equal(-1, chop_recursive(4, [1, 3, 5, 7]))
    assert_equal(-1, chop_recursive(6, [1, 3, 5, 7]))
    assert_equal(-1, chop_recursive(8, [1, 3, 5, 7]))
  end
end
