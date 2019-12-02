class Human < Sprite
    attr_accessor :health, :frequency, :damage, :last_time

    def shoot(wolf)
        if Time.now - @last_time > @frequency
            @last_time = Time.now
            wolf.health -= @damage
        end
    end
end
  