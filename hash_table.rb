class MyHash
  attr_reader :buckets

  def initialize
    @buckets = []
  end

  def assign_or_find_index(k)
    special_function(k) % 100
  end

  def special_function(k)
    k = k.to_sym
    k.object_id
  end

  def insert(k, v)
    index = assign_or_find_index(k)
    buckets[index] ||= []
    buckets[index] << [k, v]
  end

  def find(k)
    index = assign_or_find_index(k)
    buckets[index].each do |k_v_pair|
      if k_v_pair[0] == k
        return k_v_pair[1]
      end
    end
  end

end