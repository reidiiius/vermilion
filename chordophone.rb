#!/usr/bin/env ruby

module Chordophone

class Cosmography
  attr_accessor :squama, :tuning

  def initialize(tuning = :unison)
    @tuning = tuning
    @squama = {
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
  end

  def peg_Bj(str)
    str[50,60] << str[ 0,50]
  end

  def peg_Fn(str)
    str[25,60] << str[ 0,25]
  end

  def peg_Cn(str)
    str[ 0,60]
  end

  def peg_Gn(str)
    str[35,60] << str[ 0,35]
  end

  def peg_Dn(str)
    str[10,60] << str[ 0,10]
  end

  def peg_An(str)
    str[45,60] << str[ 0,45]
  end

  def peg_En(str)
    str[20,60] << str[ 0,20]
  end

  def peg_Bn(str)
    str[55,60] << str[ 0,55]
  end

  def peg_Fk(str)
    str[30,60] << str[ 0,30]
  end

  def bfbfb(str)
    layout = "\t%s\n" * 5
    bn = self.peg_Bn(str)
    fn = self.peg_Fn(str) 
    pitches = [bn, fn, bn, fn, bn]
    layout % pitches
  end

  def cgdae(str)
    layout = "\t%s\n" * 5
    pitches = [
      self.peg_En(str),
      self.peg_An(str),
      self.peg_Dn(str),
      self.peg_Gn(str),
      self.peg_Cn(str)
    ]
    layout % pitches
  end

  def dadgad(str)
    layout = "\t%s\n" * 6
    gn = self.peg_Gn(str)
    dn = self.peg_Dn(str)
    an = self.peg_An(str)
    pitches = [dn, an, dn, gn, an, dn].reverse
    layout % pitches
  end

  def dgdgbd(str)
    layout = "\t%s\n" * 6
    bn = self.peg_Bn(str)
    gn = self.peg_Gn(str)
    dn = self.peg_Dn(str)
    pitches = [dn, gn, dn, gn, bn, dn].reverse
    layout % pitches
  end

  def eadgbe(str)
    layout = "\t%s\n" * 6
    gn = self.peg_Gn(str)
    dn = self.peg_Dn(str)
    an = self.peg_An(str)
    en = self.peg_En(str)
    bn = self.peg_Bn(str)
    pitches = [en, an, dn, gn, bn, en].reverse
    layout % pitches
  end

  def ennead(str)
    layout = "\t%s\n" * 9
    pitches = [
      self.peg_Bj(str),
      self.peg_Fn(str),
      self.peg_Cn(str),
      self.peg_Gn(str),
      self.peg_Dn(str),
      self.peg_An(str),
      self.peg_En(str),
      self.peg_Bn(str),
      self.peg_Fk(str)
    ]
    layout % pitches
  end

  def fkbjdn(str)
    layout = "\t%s\n" * 6
    fk = self.peg_Fk(str)
    dn = self.peg_Dn(str)
    bj = self.peg_Bj(str)
    pitches = [fk, bj, dn, fk, bj, dn].reverse
    layout % pitches
  end

  def unison(str)
    "\t#{self.peg_Cn(str)}"
  end

  def headstock(signat)
    if (self.squama.key? signat) then
      case @tuning
        when :bfbfb
          board = self.bfbfb(self.squama[signat])
          tuned = 'bfbfb'
        when :cgdae
          board = self.cgdae(self.squama[signat])
          tuned = 'cgdae'
        when :dadgad
          board = self.dadgad(self.squama[signat])
          tuned = 'dadgad'
        when :dgdgbd
          board = self.dgdgbd(self.squama[signat])
          tuned = 'dgdgbd'
        when :eadgbe
          board = self.eadgbe(self.squama[signat])
          tuned = 'eadgbe'
        when :ennead
          board = self.ennead(self.squama[signat])
          tuned = 'ennead' 
        when :fkbjdn
          board = self.fkbjdn(self.squama[signat])
          tuned = 'fkbjdn'
        else
          board = self.unison(self.squama[signat])
          tuned = 'unison'
      end
      epoch = Time.now.to_i
      puts "\t#{signat}-#{tuned}-qe#{epoch}"
      puts board
    else
      puts "\t#{signat}?"
    end
  end

  def menu
    i, a = 0, self.squama.keys.sort
    puts
    a.each do |k|
      print "\t", k
      i += 1
      if i % 7 == 0 then
        print "\n"
      end
    end
    puts 
  end

  def fingerboard(params)
    self.squama[:z0] = '____ ' * 12

    if params.count > 0 then
      if /\A[^jknz].+\Z/.match params[0] then
        case params[0]
          when /cello|gda|fiddl|mando|[pP]5|viol/
            self.tuning = :cgdae
          when /^([aA]4|b5|bf|fb|tri)/
            self.tuning = :bfbfb
          when /dgbe|guitar|std|ukule/
            self.tuning = :eadgbe
          when /dgdg|dgbd|slack|open/
            self.tuning = :dgdgbd
          when /dadg|dgad|celt/
            self.tuning = :dadgad
          when /fkbj|bjdn|dnfk|[mM]3/
            self.tuning = :fkbjdn
          when /bead|eadg|enne|[pP]4/
            self.tuning = :ennead
          else
            self.tuning = :unison
        end
        params.shift
      end
      params[0] ? puts(nil) : self.menu
    else
      self.menu
    end

    params.each do |qp|
      self.headstock qp.to_sym
      puts
    end
  end

end # close cosmography

  if __FILE__ == $0 then
    instrum = Cosmography.new(:eadgbe)
    instrum.fingerboard(ARGV)
  end

end # close chordophone

