#! /usr/bin/env ruby

# String instrument
module Chordophone

# Tonality monograph
class Cosmography

  # Public: get instance variable
  attr_reader :decors, :keyed, :metals

  # Public: get and set instance variable
  attr_accessor :escape, :gears, :scales, :stocks, :toggle, :tuning


  # Public: initialize instrument
  #
  # decors - array of decimal codepoints
  #
  # gears  - pitch symbols mapped to range integers
  #
  # keyed  - regexp pattern of signature accidentals
  #
  # metals - array of chemical element symbols
  #
  # escape - boolean latch that determines ANSI status
  #
  # scales - signature symbols mapped to tonal strings
  #
  # stocks - tuning symbols mapped to pitch symbol arrays
  #
  # toggle - boolean latch that designates tonal graphics
  #
  # tuning - symbol that designates instrument tuning
  #
  # Example
  #
  #   o = Chordophone::Cosmography.new(:cgdae, false)

  def initialize(tuning = :unison, toggle = true)
    @tuning = tuning

    @toggle = toggle

    @escape = true

    @keyed = /\A(?>
      (?:[ijknz]{1}[0-7]{1,3}){1,2}
      (?:[lmwx]{1}[1-7]{1,2})?
      (?:[hi]{,3})?
    )\Z/uix

    @gears = {
      :Gj => 30,
      :Dj =>  5,
      :Aj => 40,
      :Ej => 15,
      :Bj => 50,
      :Fn => 25,
      :Cn =>  0,
      :Gn => 35,
      :Dn => 10,
      :An => 45,
      :En => 20,
      :Bn => 55,
      :Fk => 30,
      :Ck =>  5,
      :Gk => 40,
      :Dk => 15,
      :Ak => 50
    }

    @stocks = {
      :beadgcf => [:Fn, :Cn, :Gn, :Dn, :An, :En, :Bn],
      :bfbfb   => [:Bn, :Fn, :Bn, :Fn, :Bn],
      :cgcgc   => [:Cn, :Gn, :Cn, :Gn, :Cn],
      :cgdae   => [:En, :An, :Dn, :Gn, :Cn],
      :dadgad  => [:Dn, :An, :Gn, :Dn, :An, :Dn],
      :dgdgbd  => [:Dn, :Bn, :Gn, :Dn, :Gn, :Dn],
      :eadgbe  => [:En, :Bn, :Gn, :Dn, :An, :En],
      :fkbjdn  => [:Dn, :Bj, :Fk, :Dn, :Bj, :Fk],
      :unison  => [:Cn]
    }

    @decors = [
      111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122
    ]

    @metals = [
      :Ti, :Mn, :Fe, :Cu, :Ag, :Sn, :Au, :Hg, :Pb, :Ur, :Np, :Pu
    ]

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


  # Public: stylize mistake message with ANSI escape code
  #
  # flax - string to stylize
  #
  # Example
  #
  #   flax = 'mistake ?'
  #
  #   puts o.flawed(flax)
  #
  # returns string

  def flawed(flax=nil)
    flax = escape ? "\e[1;33m#{flax}\e[0m" : flax

    return flax
  end


  # Public: transforms substrata of given string
  #
  # yarn - string to transform
  #
  # Example
  #
  #   yarn = o.scales[:n0]
  #
  #   puts o.spindle(yarn)
  #
  # returns new string

  def spindle(yarn=(?- * 60))
    ores = metals.length
    jots = decors.length

    if ores == jots then
      wire = yarn.tr("\x5F", ?-)
      rock = String.new(encoding: 'UTF-8', capacity: 16)
      mask = String.new(encoding: 'UTF-8', capacity: 16)
      code = 0
      item = 0

      while item < ores do
        rock = metals[item].to_s
        code = decors[item]
        mask = code.chr(Encoding::UTF_8)
        wire = wire.gsub(rock, mask)
        item += 1
      end

      yarn = wire.gsub('--', ?\u{5F}) # 2014
    end

    return yarn
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
    jute = cord[numb, 60] << cord[ 0, numb]
    yarn = jute.concat(jute[0, 4]) # octave
    yarn = spindle(yarn) unless toggle

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
    grid = String.new(encoding: 'UTF-8', capacity: 1024)

    if cord && pegs then
      beams = pegs.map { |pitch|
        machine(cord, gears[pitch])
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
    crypt = rand(10_000_000).to_s(16)
    stamp = sprintf("%s-%s", epoch, crypt)

    return stamp
  end


  # Public: print table for given key
  #
  # sign - scales key string
  #
  # seal - sequential string
  #
  # Example
  #
  #   sign = 'n0'
  #
  #   seal = o.epochal
  #
  #   o.compose(sign, seal)
  #
  # returns nil

  def compose(sign=nil, seal=nil)
    if sign and keyed.match? sign then
      sign = sign.intern

      if scales.key? sign then
        tune = tuning
        pegs = stocks[tune]

        cord = scales[sign]
        grid = lattice(cord, pegs)

        seal = epochal() unless seal

        pres = '%s-%s-%s'
        fest = escape ? "\e[0;33m#{pres}\e[0m" : pres

        brim = format("\t#{fest}", sign, tune, seal)

        puts(brim, grid)
      else
        puts("\t%s ?" % flawed(sign))
      end
    else
      puts("\t%s ?" % flawed(sign))
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
    clefs = scales.keys.sort
    stamp = epochal

    puts
    clefs.each do |sign|
      compose(sign, stamp)
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
      largo = arcs.map { |elm| elm.length }
      width = largo.max
      stout = String.new(encoding: 'UTF-8', capacity: 16)
      cycle = 0
      colum = 7

      puts
      arcs.each do |item|
        stout = item.to_s.rjust(width)
        cycle += 1

        print(pads, stout)
        print("\n") if cycle % colum == 0
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
    ores = scales.values
    mill = []

    ores.each do |rock|
      rock = spindle(rock) unless toggle

      mill.push(rock.split)
    end

    ores = mill.flatten
    mill.clear

    ores.uniq!
    ores.sort!
    toggle ? ores.pop : ores.shift

    tabulate ores, "\s\s"

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
    alloy = toggle ?
      /\A(?:[A-Z][a-z]){2}\Z/ : /\A(?:[o-z]){2}\Z/

    rock = rock.to_s unless rock.is_a? String

    if alloy.match? rock then
      veins = []

      scales.each_pair { |clef, wire|
        wire = spindle(wire) unless toggle

        if wire.include? rock then
          veins.push(clef)
        end
      }

      if veins.empty? then
        puts("\n  %s ?\n" % flawed(rock))
        refinery
      else
        veins.sort!

        tabulate veins
      end
    else
      puts("\n  %s ?\n" % flawed(rock))
      refinery
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
    clefs = scales.keys.sort
    model = /\A\b(?:[i-nw-z]?[0-7]{,3}){,3}\Z/

    spat = spat.to_s unless spat.is_a? String

    if model.match? spat then
      kinds = []

      clefs.each { |sign|
        if sign.to_s.include? spat then
          kinds.push sign
        end
      }

      if kinds.empty? then
        puts("\n\t%s ?\n" % flawed(spat))

        tabulate clefs
      else
        tabulate kinds
      end
    else
      puts("\n\t%s ?\n" % flawed(spat))

      tabulate clefs
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
    clefs = scales.keys.sort
    tuned = stocks.keys.sort

    puts
    tuned.each do |stock|
      print "\s\s" << stock.to_s
    end
    puts

    tabulate clefs

    return nil
  end


  # Public: branches betwixt search utilities
  #
  # args - array of argument strings
  #
  # Example
  #
  #   args = ['group', 'AuHg']
  #
  #   o.cluster(args, 'group')
  #
  #   args = ['query', '56']
  #
  #   o.cluster(args, 'query'}
  #
  # returns nil

  def cluster(args=[], tool=nil)
    if args.is_a? Array then
      spot = args.index(tool)
      spot = 0 unless spot

      if args.length > spot + 1 then
        case tool
          when 'group' then excavate args[-1]
          when 'query' then similar args[-1]
          else printf "\n\t%s ?\n\n", flawed(tool)
        end
      else
        case tool
          when 'group' then refinery
          when 'query' then catalog
          else printf "\n\t%s ?\n\n", flawed(tool)
        end
      end

    end

    return nil
  end


  # Public: parse arguments for logical branching
  #
  # args - array of argument strings
  #
  # Example
  #
  #   args = ['group', 'AuHg']
  #
  #   o.vestibule(args)
  #
  # returns nil

  def vestibule(args=[])
    if args.length > 0 then
      tunes = stocks.keys

      if tunes.include? args[0].to_sym then
        self.tuning = args[0].to_sym
        args.shift

        if args.empty? then
          catalog
          return nil
        end
      end

      if args.include?('gamut') then
        self.escape = false
        entirety
      elsif args.include?('group') then
        cluster(args, 'group')
      elsif args.include?('query') then
        cluster(args, 'query')
      elsif args.include?('tonal') then
        refinery
      else
        stamp = epochal

        puts
        args.each do |argot|
          compose(argot, stamp)
          puts
        end
      end

    else
      catalog
    end

    return nil
  end


  # Public: application entry point
  #
  # args - array of argument strings
  #
  # Example
  #
  #   args = ['cgdae', 'n0', 'j3']
  #
  #   o.entryway(args)
  #
  # returns nil

  def entryway(args=[])
    if args.length > 0 then

      if args.length > scales.length then
        puts 'Request denied'
      else
        args.map! do |argot|
          argot.to_s
        end

        args.reject! do |argot|
          argot.length > 16
        end

        if args.empty? then
          catalog
        else
          vestibule(args)
        end
      end

    else
      catalog
    end

    return nil
  end


end # close cosmography

  if __FILE__ == $0 then
    instrum = Cosmography.new(:eadgbe, true)
    instrum.scales.store(:z0, '____ ' * 12)
    instrum.entryway(ARGV)
  end

end # close chordophone

