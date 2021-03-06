require 'spec_helper'
require 'flapjack/redis_pool'

describe Flapjack::RedisPool do

  it "is initialized" do
    EM.synchrony do
      redis_count = 3

      redis_conns = redis_count.times.collect {
        redis = double('redis')
        redis
      }
      ::Redis.should_receive(:new).exactly(redis_count).times.and_return(*redis_conns)

      frp = Flapjack::RedisPool.new(:size => redis_count)

      EM.stop
    end
  end

end