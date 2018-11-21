class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chairing,cog,rim,tire)
    @chainring = chairing
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def  ratio
    chainring / cog.to_f
  end

  def gear_inches
    # tire goes around rim twice for diameter
    ratio * (rim + (tire * 2))
  end
end

printf "%.2f\n",Gear.new(52, 11).ratio
printf "%.2f\n", Gear.new(30, 27).ratio