module Pyramid
  def self.get_upper_level(level)
    result = []
    level_size = level.size
    (0..level_size-2).each do |i|
      result << level[i] + level[i+1]
    end
    result
  end

# Recursion method
# Will not scale with large data sets. Will reach recursion level error
# Use iteration version if needed
  def self.get_pyramid_rec(pyramid)
    last_level = pyramid.last
    if last_level.size > 1
      pyramid << get_upper_level(last_level)
      return get_pyramid_rec(pyramid)
    end
    return pyramid
  end

# Iteration method
  def self.get_pyramid_iter(pyramid)
    levels = pyramid.last.size - 1
    levels.times do |i|
      pyramid << get_upper_level(pyramid[i])
    end
    pyramid
  end

  def self.get_pyramid(base)
    if base.size < 1
      raise ArgumentError.new('Base should have at least 1 element.')
    end

    if base.size > 9999
      get_pyramid_iter([base])
    else
      get_pyramid_rec([base])
    end
  end

  def self.display_pyramid(pyramid)
    puts(pyramid.map{|level| level.join(' ')})
  end
end


def sanitize_args(args)
  raise ArgumentError.new('You should provide at least 1 argument.') if args.size < 1
  args.map(&:to_i)
end

if __FILE__ == $0
  base = sanitize_args(ARGV)
  Pyramid::display_pyramid(Pyramid::get_pyramid(base))
end
