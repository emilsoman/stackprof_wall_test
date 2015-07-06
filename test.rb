require 'stackprof'

def find_many_squares
  10_000.times do |x|
    x * x
  end
end

def find_many_square_roots
  10_000.times do |x|
    Math.sqrt(x)
  end
end

def idle
  sleep 7
end


def main
  100.times do
    find_many_squares
    find_many_square_roots
  end
  idle
end

StackProf.run(mode: :wall, out: 'profile.dump') do
  main
end
