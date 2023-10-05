#! /usr/bin/env ruby

# String instrument
module Chordophone

# Tonality monograph
class Cosmography

  # Public: get instance variable
  attr_reader :decors, :metals

  # Public: get and set instance variable
  attr_accessor :escape, :gears, :scales, :stocks, :toggle, :tuning


  # Public: initialize instrument
  #
  # decors - array of decimal codepoints
  #
  # gears  - pitch symbols mapped to range integers
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
  #   p o.spindle yarn
  #
  # returns new string

  def spindle(yarn=nil)
    ores = metals.length
    jots = decors.length
    unit = ?\u{2D}

    if yarn and (ores == jots) then
      wire = yarn.to_s.tr("\x5F", unit)
      rock = String.new(unit * 2)
      mask = String.new unit
      code = 0
      numb = 0

      while numb < ores do
        rock = metals[numb].to_s
        code = decors[numb]
        mask = code.chr
        wire = wire.gsub(rock, mask)
        numb += 1
      end

      yarn = wire.gsub((unit * 2), ?\u{5F}) # 2014
    else
      yarn = String.new(unit * 36)
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
  #   p o.machine(cord, numb)
  #
  # returns new string

  def machine(cord=nil, numb=0)
    span = 60
    yarn = String.new(?- * span)

    if (cord.is_a? String) and (numb.is_a? Integer) and
      (cord.length >= span) and (numb <= cord.length) then
      numb = numb.abs if numb.negative?
      jute = cord[numb, span] << cord[ 0, numb]
      yarn = jute.concat(jute[0, 4]) # octave
      yarn = spindle(yarn) unless toggle
    end

    return yarn
  end


  # Public: creates matrix for given tuning and signature
  #
  # harp - tuning symbol from stocks keys
  #
  # clef - signature symbol from scales keys
  #
  # Example
  #
  #   harp = :beadgcf
  #   clef = :j23
  #
  #   grid = o.matrix(harp, clef)
  #   grid = grid.reverse.transpose
  #
  #   face = grid.map { |crow| "\t%s\n" % crow.join(?\s) }
  #
  #   puts face.join
  #
  # returns multidimensional array

  def matrix(harp=:beadgcf, clef=:n0)
    straw = String.new
    crows = Array.new

    stocks[harp].each do |tone|
      straw = machine(scales[clef], gears[tone])
      crows.push(straw.split.map { |duet| duet.intern })
    end

    return crows
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

    if cord and pegs then
      beams = pegs.map do |pitch|
        machine(cord, gears[pitch])
      end

      truss = "\t%s\n" * beams.count
      grid = truss % beams
    end

    return grid
  end


  # Public: generate and return sequential string
  #
  # Example
  #
  #   seal = o.epochal()
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
  # sign - scales key string or symbol
  #
  # seal - sequential string
  #
  # Example
  #
  #   sign = :n0
  #
  #   seal = o.epochal()
  #
  #   o.compose(sign, seal)
  #
  # returns nil

  def compose(sign=nil, seal=nil)
    sign = sign.intern if sign.is_a? String

    if (sign.is_a? Symbol) and (scales.include? sign) then
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

    return nil
  end


  # Public: print all tables
  #
  # Example
  #
  #   o.entirety()
  #
  # returns nil

  def entirety
    odes = scales.keys.sort
    seal = epochal()
    self.escape = false

    puts
    odes.each do |sign|
      compose(sign, seal)
      puts
    end

    self.escape = true

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
  #   pads = ?\t
  #
  #   o.tabulate(arcs, pads)
  #
  # returns nil

  def tabulate(arcs=[], pads="\t")
    unless arcs.empty? then
      largo = arcs.map { |elm| elm.length }
      width = largo.max
      stout = String.new
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


  # Public: populates array of unique tonalities from scales values
  #
  # Example
  #
  #   ores = o.refinery()
  #
  #   o.tabulate(ores, ?\s)
  #
  # returns array

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

    return ores
  end


  # Public: validates tonality string
  #
  # rock - tonality string or symbol
  #
  # Example
  #
  #   rock = :AuHg
  #
  #   o.excavate rock
  #
  # returns boolean

  def monotone?(rock=nil)
    bool = false

    if rock then
      rock = rock.to_s.strip
      ores = refinery()
      bool = true if ores.include? rock
    end

    return bool
  end


  # Public: search values of scales for given tonality string
  #
  # rock - tonality string or symbol
  #
  # Example
  #
  #   rock = :AuHg
  #
  #   o.excavate rock
  #
  # returns nil

  def excavate(rock=nil)
    rock = rock.to_s.strip

    if monotone?(rock) then
      veins = []

      scales.each_pair do |clef, wire|
        wire = spindle(wire) unless toggle

        veins.push(clef) if wire.include? rock
      end

      if veins.empty? then
        puts("\n  %s ?\n" % flawed(rock))
        tabulate(refinery(), "\s\s")
      else
        tabulate veins.sort
      end
    else
      puts("\n  %s ?\n" % flawed(rock)) unless rock.empty?
      tabulate(refinery(), "\s\s")
    end

    return nil
  end


  # Public: search keys of scales for given pattern string
  #
  # spat - pattern string
  #
  # Example
  #
  #   spat = 56
  #
  #   o.similar spat
  #
  # returns nil

  def similar(spat=nil)
    arks = scales.keys.sort
    spat = spat.to_s.strip
    clad = Array.new

    arks.each do |sign|
      if sign.to_s.include? spat
      then clad.push sign
      end
    end

    if clad.empty? then
      puts("\n\t%s ?\n" % flawed(spat))
      tabulate arks
    else
      tabulate clad
    end

    return nil
  end


  # Public: print keys of stocks and scales tabulated
  #
  # Example
  #
  #   o.catalog()
  #
  # returns nil

  def catalog
    clefs = scales.keys.sort
    harps = stocks.keys.sort

    puts
    harps.each do |stock|
      print "\s\s" << stock.to_s
    end
    puts

    tabulate clefs

    return nil
  end


  # Public: branches between search utilities
  #
  # args - array of numbers, strings or symbols
  #
  # tool - symbol utility name group or query
  #
  # Example
  #
  #   args = %i[group AuHg]
  #
  #   o.cluster(args, :group)
  #
  #   args = [:query, 56]
  #
  #   o.cluster(args, :query)
  #
  # returns nil

  def cluster(args=nil, tool=nil)
    if (args.is_a? Array) and (tool.is_a? Symbol) then
      pars = args.map do |item|
        (item.is_a? Integer) ? item.to_s : item.intern
      end

      spot = pars.index(tool)

      if spot then
        kind = pars.delete_at(spot)

        case kind
          when :group then excavate pars.last
          when :query then similar pars.last
          else printf "\n\t%s ?\n\n", flawed(tool)
        end
      else
        printf "\n\t%s ?\n\n", flawed(tool)
      end
    end

    return nil
  end


  # Public: parse arguments for logical branching
  #
  # args - array of argument strings or symbols
  #
  # Example
  #
  #   args = %i[group AuHg]
  #
  #   o.vestibule args
  #
  # returns nil

  def vestibule(args=[])
    if args.all? then
      parts = args.map { |item| item.intern }
      harps = stocks.keys
      where = parts.index do |item|
        harps.include? item
      end

      if where then
        tuned = parts.delete_at(where)
        self.tuning = tuned

        if parts.empty? then
          catalog()
          return nil
        end
      end

      if    parts.include?(:gamut) then entirety()
      elsif parts.include?(:group) then cluster(parts, :group)
      elsif parts.include?(:query) then cluster(parts, :query)
      elsif parts.include?(:tonal) then tabulate(refinery(), "\s\s")
      else
        stamp = epochal()

        puts
        parts.each do |argot|
          compose(argot, stamp)
          puts
        end
      end

    else
      catalog()
    end

    return nil
  end


  # Public: application entry point
  #
  # args - array of argument strings or symbols
  #
  # Example
  #
  #   args = %i[cgdae n0 j3]
  #
  #   o.entryway args
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
          catalog()
        else
          vestibule(args)
        end
      end

    else
      catalog()
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

