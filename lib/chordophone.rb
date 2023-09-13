#! /usr/bin/env ruby

# String instrument
module Chordophone

# Tonality monograph
class Cosmography

  # Public: get instance variable
  attr_reader :keyed

  # Public: get and set instance variable
  attr_accessor :gears, :scales, :stocks, :tuning


  # Public: initialize instrument
  #
  # gears  - pitch symbols mapped to range integers
  #
  # keyed  - regexp pattern of signature accidentals
  #
  # scales - signature symbols mapped to metallic strings
  #
  # stocks - tuning symbols mapped to pitch symbol arrays
  #
  # tuning - symbol that designates instrument tuning
  #
  # Example
  #
  #   o = Chordophone::Cosmography.new(:cgdae)

  def initialize(tuning = :unison)
    @tuning = tuning

    @keyed = /\A
      (?:[ijknz]{1}[0-7]{1,3}){1,2}
      (?:[lmwx]{1}[1-7]{1,2})?
      (?:[hi]{,3})?
    \Z/ix

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

    @stocks = {
      :beadgcf => [:Fn, :Cn, :Gn, :Dn, :An, :En, :Bn],
      :bfbfb   => [:Bn, :Fn, :Bn, :Fn, :Bn],
      :cgdae   => [:Cn, :Gn, :Dn, :An, :En].reverse,
      :dadgad  => [:Dn, :An, :Gn, :Dn, :An, :Dn],
      :dgdgbd  => [:Dn, :Bn, :Gn, :Dn, :Gn, :Dn],
      :eadgbe  => [:En, :Bn, :Gn, :Dn, :An, :En],
      :fkbjdn  => [:Dn, :Bj, :Fk, :Dn, :Bj, :Fk],
      :unison  => [:Cn]
    }

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
    :j2w3 => 'HgHg PuFe SnTi ____ ____ PbAu ____ AuPb ____ AgUr ____ FePu ',
    :j3k5 => 'NpCu ____ TiSn FePu ____ PuFe ____ ____ CuNp PbAu ____ AuPb ',
    :j3k6 => 'HgTi ____ SnNp UrAu ____ PbPb ____ AuUr ____ ____ TiHg FeFe ',
    :j5w6 => 'PbCu ____ AuSn ____ AgHg TiFe FeTi HgAg ____ ____ ____ CuPb ',
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
    :n5w2 => 'HgMn ____ ____ MnHg CuFe ____ ____ AuNp NpAu ____ TiPb FeCu ',
    :n6x2 => 'FeCu HgMn ____ ____ MnHg CuFe PbTi ____ AuNp NpAu ____ ____ ',
   :j17w2 => 'HgAg ____ ____ ____ CuPb PbCu ____ AuSn ____ AgHg TiFe FeTi ',
   :j23k6 => 'HgHg PuFe ____ UrAg ____ PbAu ____ AuPb ____ ____ TiSn FePu ',
   :j25w6 => 'TiCu FeMn ____ ____ SnHg MnFe CuTi PbAg ____ ____ ____ AgPb ',
   :j26w3 => 'HgHg PuFe SnTi ____ ____ PbAu ____ AuPb NpCu ____ ____ FePu ',
   :j2k34 => 'TiCu FeMn ____ ____ ____ MnFe CuTi PbAg ____ AuAu ____ AgPb ',
   :j2k56 => 'HgHg PuFe ____ ____ CuNp PbAu ____ ____ NpCu ____ TiSn FePu ',
   :j34k6 => 'HgSn ____ SnHg MnFe CuTi ____ ____ AuAu ____ ____ TiCu FeMn ',
   :j56w7 => 'UrCu ____ PbSn ____ AuHg NpFe AgTi ____ FeNp HgAu ____ ____ ',
   :k12j5 => '____ AgUr ____ FePu HgHg PuFe SnTi ____ ____ PbAu ____ AuPb ',
   :k17j5 => 'TiCu FeMn HgSn ____ SnHg MnFe CuTi ____ ____ AuAu ____ ____ ',
   :k25x1 => '____ ____ TiSn FePu HgHg PuFe ____ ____ CuNp PbAu ____ AuPb ',
   :k26x5 => 'HgSn ____ ____ MnFe CuTi PbAg ____ ____ ____ AgPb TiCu FeMn ',
   :k2j17 => '____ ____ ____ MnFe CuTi PbAg ____ AuAu ____ AgPb TiCu FeMn ',
   :k2j56 => 'NpCu ____ ____ FePu HgHg PuFe SnTi ____ CuNp ____ ____ AuPb ',
   :k34x2 => 'PbCu ____ ____ ____ AgHg TiFe FeTi HgAg ____ SnAu ____ CuPb ',
   :k56x4 => 'HgAu ____ SnPb ____ CuUr ____ ____ AuHg NpFe ____ TiAg FeNp ',
   :n25x6 => 'TiCu FeMn HgSn ____ ____ MnFe CuTi PbAg ____ ____ ____ AgPb ',
   :n26w5 => '____ ____ SnHg MnFe CuTi PbAg ____ ____ ____ AgPb TiCu FeMn ',
   :n45w2 => 'HgTi ____ ____ UrAu ____ PbPb ____ AuUr NpSn ____ TiHg FeFe ',
   :n67x2 => '____ AuUr ____ ____ TiHg FeFe HgTi ____ SnNp UrAu ____ PbPb ',
  :j136w7 => '____ ____ SnPb UrCu ____ PbSn ____ AuHg NpFe AgTi ____ FeNp ',
  :j167w2 => 'HgAu ____ ____ ____ CuUr PbSn ____ AuHg NpFe ____ TiAg FeNp ',
  :j246w3 => 'HgHg PuFe SnTi ____ CuNp ____ ____ AuPb NpCu ____ ____ FePu ',
  :j26w34 => 'HgHg PuFe SnTi UrAg ____ ____ ____ AuPb NpCu ____ ____ FePu ',
  :j2k6x5 => 'HgHg PuFe ____ ____ CuNp PbAu ____ ____ ____ AgUr TiSn FePu ',
  :j2k6w3 => 'HgHg PuFe SnTi ____ ____ PbAu ____ AuPb ____ ____ TiSn FePu ',
  :j346w5 => 'NpCu ____ TiSn FePu HgHg PuFe ____ ____ CuNp ____ ____ AuPb ',
  :j3k5x4 => 'HgAu ____ SnPb UrCu ____ ____ ____ AuHg NpFe AgTi ____ FeNp ',
  :k135x4 => '____ CuUr PbSn ____ ____ NpFe ____ TiAg FeNp HgAu ____ SnPb ',
  :k157x6 => 'HgHg PuFe SnTi ____ CuNp PbAu ____ ____ NpCu ____ ____ FePu ',
  :k1j6w7 => '____ CuUr PbSn ____ AuHg NpFe ____ TiAg FeNp HgAu ____ ____ ',
  :k257x1 => 'NpCu ____ TiSn FePu HgHg PuFe ____ ____ CuNp PbAu ____ ____ ',
  :k25x17 => '____ AgUr TiSn FePu HgHg PuFe ____ ____ CuNp PbAu ____ ____ ',
  :k2j5x1 => '____ ____ TiSn FePu HgHg PuFe SnTi ____ ____ PbAu ____ AuPb ',
  :k2j5w6 => 'NpCu ____ ____ FePu HgHg PuFe SnTi UrAg ____ ____ ____ AuPb ',
  :k345x2 => 'UrCu ____ ____ ____ AuHg NpFe AgTi ____ FeNp HgAu ____ SnPb ',
  :n167x4 => 'HgAu ____ ____ UrCu ____ PbSn ____ AuHg NpFe AgTi ____ FeNp ',
  :n345w7 => '____ CuUr ____ ____ AuHg NpFe ____ TiAg FeNp HgAu ____ SnPb ',
 :j2k56x4 => 'HgHg PuFe ____ ____ CuNp ____ ____ AuPb NpCu ____ TiSn FePu ',
 :j3k56x4 => 'HgTi ____ SnNp UrAu ____ ____ ____ AuUr NpSn ____ TiHg FeFe ',
 :k1j56w7 => '____ AuUr NpSn ____ TiHg FeFe HgTi ____ SnNp UrAu ____ ____ ',
 :k2j56w7 => 'NpCu ____ ____ FePu HgHg PuFe SnTi ____ CuNp PbAu ____ ____ '}
  end


  # Public: permute given string with given range
  #
  # cord - string to permute
  #
  # numb - integer for range
  #
  # Example
  #
  #   cord = o.scales[:n0]
  #   numb = o.gears[:Gn]
  #
  #   puts o.machine(cord, numb)
  #
  # returns new string

  def machine(cord=(?- * 60), numb=0)
    yarn = cord[numb, 60] << cord[ 0, numb]

    return yarn
  end


  # Public: assemble table with given string and array
  #
  # cord - string to process
  #
  # pegs - array of pitch symbols
  #
  # Example
  #
  #   cord = o.scales[:n0]
  #   pegs = o.stocks[:cgdae]
  #
  #   puts o.lattice(cord, pegs)
  #
  # returns new string

  def lattice(cord=nil, pegs=nil)
    grid = String.new

    if cord && pegs then
      beams = pegs.map { |pitch|
        self.machine(cord, self.gears[pitch])
      }

      truss = "\t%s\n" * beams.count

      grid = truss % beams
    end

    return grid
  end


  # Public: generate and return sequential string
  #
  # Example
  #
  #   seal = o.epochal
  #
  #   puts seal
  #
  # returns string

  def epochal
    epoch = "i%d" % Time.now.to_i
    crypt = rand(999999999).to_s(16)
    stamp = sprintf("%s-%s", epoch, crypt)

    return stamp
  end


  # Public: print table for given key
  #
  # sign - symbol key of scales
  #
  # seal - sequential string
  #
  # Example
  #
  #   sign = :n0
  #
  #   seal = o.epochal
  #
  #   o.compose(sign, seal)
  #
  # returns nil

  def compose(sign=nil, seal=nil)
    if sign then
      if (self.scales.key? sign) then
        tune = self.tuning
        pegs = self.stocks[tune]

        cord = self.scales[sign]
        grid = self.lattice(cord, pegs)

        seal = self.epochal unless seal
        brim = format("\t%s-%s-%s", sign, tune, seal)

        puts(brim, grid)
      else
        puts "\t#{sign} ?"
      end
    end

    return nil
  end


  # Public: print all tables
  #
  # Example
  #
  #   o.entirety
  #
  # returns nil

  def entirety
    clefs = self.scales.keys.sort
    stamp = self.epochal

    puts
    clefs.each do |sign|
      self.compose(sign, stamp)
      puts
    end

    return nil
  end


  # Public: print array elements tabulated
  #
  # arcs - array of printable data
  #
  # pads - padding string (optional)
  #
  # Example
  #
  #   arcs = o.scales.keys.sort
  #
  #   pads = "\t"
  #
  #   o.tabulate(arcs, pads)
  #
  # returns nil

  def tabulate(arcs=[], pads="\t")
    unless arcs.empty? then
      cycle = 0
      colum = 7

      puts
      arcs.each do |item|
        cycle += 1
        print pads, item
        if cycle % colum == 0 then
          print "\n"
        end
      end
      print (cycle % colum != 0) ? "\n\n" : "\n"
    end

    return nil
  end


  # Public: print tonalities tabulated
  #
  # Example
  #
  #   o.refinery
  #
  # returns nil

  def refinery
    ores = self.scales.values
    mill = []

    ores.each { |rock| mill.push(rock.split) }

    ores = mill.flatten
    mill.clear

    ores.uniq!
    ores.sort!
    ores.pop

    self.tabulate ores, "\s\s"

    return nil
  end


  # Public: search values of scales for given tonality string
  #
  # rock - tonality string
  #
  # Example
  #
  #   rock = 'AuHg'
  #
  #   o.excavate rock
  #
  # returns nil

  def excavate(rock=nil)
    alloy = /\A(?:[A-Z][a-z]){2}\Z/

    if alloy.match? rock then
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
        veins.sort!

        self.tabulate veins
      end
    else
      puts "\n  #{rock} ?\n"
      self.refinery
    end

    return nil
  end


  # Public: search keys of scales for given pattern string
  #
  # spat - pattern string
  #
  # Example
  #
  #   spat = '56'
  #
  #   o.similar spat
  #
  # returns nil

  def similar(spat=nil)
    clefs = self.scales.keys.sort
    model = /\A\b(?:[i-nw-z]?[0-7]{,3}){,3}\Z/

    if model.match? spat then
      kinds = []

      clefs.each { |sign|
        if sign.to_s.include? spat then
          kinds.push sign
        end
      }

      if kinds.empty? then
        puts "\n\t#{spat} ?\n"

        self.tabulate clefs
      else
        self.tabulate kinds
      end
    else
      puts "\n\t#{spat} ?\n"

      self.tabulate clefs
    end

    return nil
  end


  # Public: print keys of stocks and scales tabulated
  #
  # Example
  #
  #   o.catalog
  #
  # returns nil

  def catalog
    clefs = self.scales.keys.sort
    tuned = self.stocks.keys.sort

    puts
    tuned.each do |stock|
      print "\s\s" << stock.to_s
    end
    puts

    self.tabulate clefs

    return nil
  end


  # Public: parse arguments for logical branching
  #
  # params - array of argument strings
  #
  # Example
  #
  #   params = ['group', 'AuHg']
  #
  #   o.vestibule(params)
  #
  # returns nil

  def vestibule(params=[self.tuning])
    tunes = self.stocks.keys

    if tunes.include? params[0].to_sym then
      self.tuning = params[0].to_sym

      params.shift

      if params.empty? then
        self.catalog
        return nil
      end
    end

    if params.include?('gamut') then
      self.entirety
    elsif params.include?('group') then
      spot = params.index('group') + 1

      if params.length > spot then
        self.excavate params[-1]
      else
        self.refinery
      end
    elsif params.include?('query') then
      spot = params.index('query') + 1

      if params.length > spot then
        self.similar params[-1]
      else
        self.catalog
      end
    elsif params.include?('tonal') then
      self.refinery
    else
      stamp = self.epochal

      puts
      params.each do |argot|
        if self.keyed.match? argot then
          self.compose(argot.to_sym, stamp)
          puts
        else
          puts "\t#{argot} ?\n\n"
        end
      end
    end

    return nil
  end


  # Public: application entry point
  #
  # params - array of argument strings
  #
  # Example
  #
  #   params = ['cgdae', 'n0', 'j3']
  #
  #   o.entryway(params)
  #
  # returns nil

  def entryway(params=[])
    if params.length > 0 then

      if params.length > self.scales.length then
        puts 'Request denied'
      else
        params.reject! do |argot|
          argot.length > 16
        end

        if params.empty? then
          self.catalog
        else
          self.vestibule(params)
        end
      end

    else
      self.catalog
    end

    return nil
  end


end # close cosmography

  if __FILE__ == $0 then
    instrum = Cosmography.new(:eadgbe)
    instrum.scales.store(:z0, '____ ' * 12)
    instrum.entryway(ARGV)
  end

end # close chordophone

