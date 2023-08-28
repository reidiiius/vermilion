#! /usr/bin/env ruby

module Chordophone

class Cosmography
  attr_accessor :gears, :scales, :tuning

  def initialize(tuning = :unison)
    @tuning = tuning

    @scales = {
      :j2 => 'HgHg PuFe ____ ____ CuNp PbAu ____ AuPb ____ AgUr ____ FePu ',
      :j3 => 'HgSn ____ SnHg UrFe ____ PbAg ____ AuAu ____ AgPb ____ FeUr ',
      :j5 => 'PbCu ____ AuSn ____ AgHg TiFe FeTi ____ ____ SnAu ____ CuPb ',
      :j6 => 'HgAu ____ SnPb ____ CuUr PbSn ____ AuHg NpFe ____ ____ FeNp ',
      :k1 => '____ FeUr HgSn ____ SnHg UrFe ____ PbAg ____ AuAu ____ AgPb ',
      :k2 => 'NpCu ____ ____ FePu HgHg PuFe ____ UrAg ____ PbAu ____ AuPb ',
      :k5 => 'UrCu ____ PbSn ____ AuHg NpFe ____ ____ FeNp HgAu ____ SnPb ',
      :k6 => 'HgAg ____ SnAu ____ CuPb PbCu ____ AuSn ____ ____ TiFe FeTi ',
      :n0 => 'HgCu ____ SnSn ____ CuHg PbFe ____ AuAg ____ AgAu ____ FePb ',
     :j17 => '____ ____ SnAu ____ CuPb PbCu ____ AuSn ____ AgHg TiFe FeTi ',
     :j23 => 'HgHg PuFe ____ UrAg ____ PbAu ____ AuPb ____ AgUr ____ FePu ',
     :j25 => 'FeCu HgMn ____ ____ MnHg CuFe PbTi ____ ____ NpAu ____ TiPb ',
     :j26 => 'HgHg PuFe ____ ____ CuNp PbAu ____ AuPb NpCu ____ ____ FePu ',
     :j36 => 'HgAu ____ SnPb UrCu ____ PbSn ____ AuHg NpFe ____ ____ FeNp ',
     :j56 => 'UrCu ____ PbSn ____ AuHg NpFe AgTi ____ FeNp ____ ____ SnPb ',
     :k12 => '____ AgUr ____ FePu HgHg PuFe ____ UrAg ____ PbAu ____ AuPb ',
     :k15 => '____ CuUr PbSn ____ AuHg NpFe ____ ____ FeNp HgAu ____ SnPb ',
     :k25 => 'NpCu ____ ____ FePu HgHg PuFe ____ ____ CuNp PbAu ____ AuPb ',
     :k26 => 'HgMn ____ ____ MnHg CuFe PbTi ____ AuNp ____ ____ TiPb FeCu ',
     :k34 => 'PbCu ____ AuSn ____ ____ TiFe FeTi HgAg ____ SnAu ____ CuPb ',
     :k56 => 'HgAu ____ SnPb ____ CuUr PbSn ____ ____ NpFe ____ TiAg FeNp ',
    :j236 => 'HgHg PuFe ____ UrAg ____ PbAu ____ AuPb NpCu ____ ____ FePu ',
    :j256 => 'FeCu HgMn ____ ____ MnHg CuFe PbTi ____ AuNp ____ ____ TiPb ',
    :j2k5 => 'FeCu HgMn ____ ____ MnHg CuFe ____ ____ AuNp NpAu ____ TiPb ',
    :j2k6 => 'HgHg PuFe ____ ____ CuNp PbAu ____ AuPb ____ ____ TiSn FePu ',
    :j2y3 => 'HgHg PuFe SnTi ____ ____ PbAu ____ AuPb ____ AgUr ____ FePu ',
    :j3k5 => 'NpCu ____ TiSn FePu ____ PuFe ____ ____ CuNp PbAu ____ AuPb ',
    :j3k6 => 'HgTi ____ SnNp UrAu ____ PbPb ____ AuUr ____ ____ TiHg FeFe ',
    :j5y6 => 'PbCu ____ AuSn ____ AgHg TiFe FeTi HgAg ____ ____ ____ CuPb ',
    :k125 => '____ AgUr ____ FePu HgHg PuFe ____ ____ CuNp PbAu ____ AuPb ',
    :k1j5 => '____ AuUr NpSn ____ TiHg FeFe HgTi ____ ____ UrAu ____ PbPb ',
    :k1j6 => '____ PuFe SnTi ____ CuNp PbAu ____ AuPb NpCu ____ ____ FePu ',
    :k256 => 'HgMn ____ ____ MnHg CuFe PbTi ____ ____ NpAu ____ TiPb FeCu ',
    :k2j5 => 'NpCu ____ ____ FePu HgHg PuFe SnTi ____ ____ PbAu ____ AuPb ',
    :k2j6 => 'HgMn ____ ____ MnHg CuFe PbTi ____ AuNp NpAu ____ ____ FeCu ',
    :k2x1 => '____ ____ TiSn FePu HgHg PuFe ____ UrAg ____ PbAu ____ AuPb ',
    :k6x5 => 'HgAg ____ SnAu ____ CuPb PbCu ____ ____ ____ AgHg TiFe FeTi ',
    :n167 => 'NpCu ____ ____ FePu ____ PuFe SnTi ____ CuNp PbAu ____ AuPb ',
    :n345 => '____ PuFe ____ ____ CuNp PbAu ____ AuPb NpCu ____ TiSn FePu ',
    :n5y2 => 'HgMn ____ ____ MnHg CuFe ____ ____ AuNp NpAu ____ TiPb FeCu ',
    :n6x2 => 'FeCu HgMn ____ ____ MnHg CuFe PbTi ____ AuNp NpAu ____ ____ ',
   :j17y2 => 'HgAg ____ ____ ____ CuPb PbCu ____ AuSn ____ AgHg TiFe FeTi ',
   :j23k6 => 'HgHg PuFe ____ UrAg ____ PbAu ____ AuPb ____ ____ TiSn FePu ',
   :j25y6 => 'TiCu FeMn ____ ____ SnHg MnFe CuTi PbAg ____ ____ ____ AgPb ',
   :j26y3 => 'HgHg PuFe SnTi ____ ____ PbAu ____ AuPb NpCu ____ ____ FePu ',
   :j2k34 => 'TiCu FeMn ____ ____ ____ MnFe CuTi PbAg ____ AuAu ____ AgPb ',
   :j2k56 => 'HgHg PuFe ____ ____ CuNp PbAu ____ ____ NpCu ____ TiSn FePu ',
   :j34k6 => 'HgSn ____ SnHg MnFe CuTi ____ ____ AuAu ____ ____ TiCu FeMn ',
   :j56y7 => 'UrCu ____ PbSn ____ AuHg NpFe AgTi ____ FeNp HgAu ____ ____ ',
   :k12j5 => '____ AgUr ____ FePu HgHg PuFe SnTi ____ ____ PbAu ____ AuPb ',
   :k17j5 => 'TiCu FeMn HgSn ____ SnHg MnFe CuTi ____ ____ AuAu ____ ____ ',
   :k25x1 => '____ ____ TiSn FePu HgHg PuFe ____ ____ CuNp PbAu ____ AuPb ',
   :k26x5 => 'HgSn ____ ____ MnFe CuTi PbAg ____ ____ ____ AgPb TiCu FeMn ',
   :k2j17 => '____ ____ ____ MnFe CuTi PbAg ____ AuAu ____ AgPb TiCu FeMn ',
   :k2j56 => 'NpCu ____ ____ FePu HgHg PuFe SnTi ____ CuNp ____ ____ AuPb ',
   :k34x2 => 'PbCu ____ ____ ____ AgHg TiFe FeTi HgAg ____ SnAu ____ CuPb ',
   :k56x4 => 'HgAu ____ SnPb ____ CuUr ____ ____ AuHg NpFe ____ TiAg FeNp ',
   :n25x6 => 'TiCu FeMn HgSn ____ ____ MnFe CuTi PbAg ____ ____ ____ AgPb ',
   :n26y5 => '____ ____ SnHg MnFe CuTi PbAg ____ ____ ____ AgPb TiCu FeMn ',
   :n45y2 => 'HgTi ____ ____ UrAu ____ PbPb ____ AuUr NpSn ____ TiHg FeFe ',
   :n67x2 => '____ AuUr ____ ____ TiHg FeFe HgTi ____ SnNp UrAu ____ PbPb ',
  :j136y7 => '____ ____ SnPb UrCu ____ PbSn ____ AuHg NpFe AgTi ____ FeNp ',
  :j167y2 => 'HgAu ____ ____ ____ CuUr PbSn ____ AuHg NpFe ____ TiAg FeNp ',
  :j246y3 => 'HgHg PuFe SnTi ____ CuNp ____ ____ AuPb NpCu ____ ____ FePu ',
  :j26y34 => 'HgHg PuFe SnTi UrAg ____ ____ ____ AuPb NpCu ____ ____ FePu ',
  :j2k6x5 => 'HgHg PuFe ____ ____ CuNp PbAu ____ ____ ____ AgUr TiSn FePu ',
  :j2k6y3 => 'HgHg PuFe SnTi ____ ____ PbAu ____ AuPb ____ ____ TiSn FePu ',
  :j346y5 => 'NpCu ____ TiSn FePu HgHg PuFe ____ ____ CuNp ____ ____ AuPb ',
  :j3k5x4 => 'HgAu ____ SnPb UrCu ____ ____ ____ AuHg NpFe AgTi ____ FeNp ',
  :k135x4 => '____ CuUr PbSn ____ ____ NpFe ____ TiAg FeNp HgAu ____ SnPb ',
  :k157x6 => 'HgHg PuFe SnTi ____ CuNp PbAu ____ ____ NpCu ____ ____ FePu ',
  :k1j6y7 => '____ CuUr PbSn ____ AuHg NpFe ____ TiAg FeNp HgAu ____ ____ ',
  :k257x1 => 'NpCu ____ TiSn FePu HgHg PuFe ____ ____ CuNp PbAu ____ ____ ',
  :k25x17 => '____ AgUr TiSn FePu HgHg PuFe ____ ____ CuNp PbAu ____ ____ ',
  :k2j5x1 => '____ ____ TiSn FePu HgHg PuFe SnTi ____ ____ PbAu ____ AuPb ',
  :k2j5y6 => 'NpCu ____ ____ FePu HgHg PuFe SnTi UrAg ____ ____ ____ AuPb ',
  :k345x2 => 'UrCu ____ ____ ____ AuHg NpFe AgTi ____ FeNp HgAu ____ SnPb ',
  :n167x4 => 'HgAu ____ ____ UrCu ____ PbSn ____ AuHg NpFe AgTi ____ FeNp ',
  :n345y7 => '____ CuUr ____ ____ AuHg NpFe ____ TiAg FeNp HgAu ____ SnPb ',
 :j2k56x4 => 'HgHg PuFe ____ ____ CuNp ____ ____ AuPb NpCu ____ TiSn FePu ',
 :j3k56x4 => 'HgTi ____ SnNp UrAu ____ ____ ____ AuUr NpSn ____ TiHg FeFe ',
 :k1j56y7 => '____ AuUr NpSn ____ TiHg FeFe HgTi ____ SnNp UrAu ____ ____ ',
 :k2j56y7 => 'NpCu ____ ____ FePu HgHg PuFe SnTi ____ CuNp PbAu ____ ____ '}

    @gears = {
      :Bj => 50,
      :Fn => 25,
      :Cn =>  0,
      :Gn => 35,
      :Dn => 10,
      :An => 45,
      :En => 20,
      :Bn => 55,
      :Fk => 30
    }
  end


  def machine(str, ndx)
    str[ndx, 60] << str[ 0, ndx]
  end


  def lattice(cord, pegs)
    crows = pegs.map { |pitch|
      self.machine(cord, self.gears[pitch])
    }

    layout = "\t%s\n" * crows.length

    layout % crows
  end


  def pitchfork(tune)
    case tune
      when :bfbfb
        pegs = [:Bn, :Fn, :Bn, :Fn, :Bn]
      when :cgdae
        pegs = [:Cn, :Gn, :Dn, :An, :En].reverse
      when :dadgad
        pegs = [:Dn, :An, :Gn, :Dn, :An, :Dn]
      when :dgdgbd
        pegs = [:Dn, :Bn, :Gn, :Dn, :Gn, :Dn]
      when :eadgbe
        pegs = [:En, :Bn, :Gn, :Dn, :An, :En]
      when :beadgcf
        pegs = [:Fn, :Cn, :Gn, :Dn, :An, :En, :Bn]
      when :fkbjdn
        pegs = [:Dn, :Bj, :Fk, :Dn, :Bj, :Fk]
      else
        pegs = [:Cn]
    end
  end


  def headstock(sign)
    if (self.scales.key? sign) then
      tune = self.tuning
      pegs = pitchfork(tune)

      cord = self.scales[sign]
      board = self.lattice(cord, pegs)

      epoch = "%.3f" % Time.now.to_f

      puts "\t#{sign}-#{tune}-i#{epoch}"
      puts board
    else
      puts "\t#{sign} ?"
    end
  end


  def tabulate(star, pads="\t")
    cycle = 0
    colum = 7

    puts
    star.each do |item|
      cycle += 1
      print pads, item
      if cycle % colum == 0 then
        print "\n"
      end
    end
    print (cycle % colum != 0) ? "\n\n" : "\n"
  end


  def refinery
    ores = []
    mill = []
    numb = 0

    self.scales.each_value { |rock| ores.push(rock) }

    ores.each { |rock| mill.push(rock.split) }

    ores = mill.flatten
    mill.clear

    ores.uniq!
    ores.sort!
    ores.pop

    self.tabulate ores, "\x20\x20"
  end


  def periodic(rock)
    veins = []

    self.scales.each_pair { |clef, wire|
      if wire.include? rock then
        veins.push(clef)
      end
    }

    if veins.empty? then
      puts "\n  #{rock} ?\n"
      self.refinery
    else
      self.tabulate veins
    end
  end


  def similar(spat)
    clefs = self.scales.keys.sort
    kinds = []

    clefs.each { |sign|
      if /#{spat}/.match sign then
        kinds.push sign
      end
    }

    if kinds.empty? then
      puts "\n\t#{spat} ?\n"

      self.tabulate clefs
    else
      self.tabulate kinds
    end
  end


  def catalog
    clefs = self.scales.keys.sort

    self.tabulate clefs
  end


  def entryway(params)
    if params.length > 0 then

      if params.length > self.scales.length then
        puts "\n\tRequest denied!\n\n"
        return nil
      else
        params.reject! { |argot| argot.length > 16 }
      end

      if params.include?('group') then
        spot = params.index('group') + 1

        if params.length > spot then
          self.periodic params[-1]
        else
          self.refinery
        end

        return nil
      end

      if params.include?('query') then
        spot = params.index('query') + 1

        if params.length > spot then
          self.similar params[-1]
        else
          self.catalog
        end

        return nil
      end

      if params.include?('tonal') then
        self.refinery
        return nil
      end

      if /\A[^jknz].+\Z/.match params[0] then
        case params[0]
          when /bas|beadg|eadgc|[pP]4/
            self.tuning = :beadgcf
          when /^([aA]4|b5|bf|fb|tri)/
            self.tuning = :bfbfb
          when /cello|gda|mand|[pP]5|viol/
            self.tuning = :cgdae
          when /dadg|dgad|celt/
            self.tuning = :dadgad
          when /dgdg|dgbd|open|slack|taro/
            self.tuning = :dgdgbd
          when /dgbe|gtr|guitar|std|uk[ue]/
            self.tuning = :eadgbe
          when /fkbj|bjdn|dnfk|[mM]3/
            self.tuning = :fkbjdn
          else
            self.tuning = :unison
        end

        params.shift
      end

      params[0] ? puts(nil) : self.catalog
    else
      self.catalog
    end

    params.each do |argot|
      self.headstock argot.to_sym
      puts
    end
  end


end # close cosmography

  if __FILE__ == $0 then
    instrum = Cosmography.new(:eadgbe)
    instrum.scales[:z0] = '____ ' * 12
    instrum.entryway(ARGV)
  end

end # close chordophone

