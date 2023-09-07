#! /usr/bin/env ruby

require_relative File.path(File.join('..', 'lib', 'chordophone'))

# Software testing
module Softest

# Test harness
class Epitome

  # attribute: cosmo
  attr_reader :cosmo

  # attributes: stats, tasks
  attr_accessor :stats, :tasks


  # method: initialize

  def initialize
    @cosmo = Chordophone::Cosmography.new
    @stats = {
      :errors => 0,
      :failed => 0,
      :passed => 0,
      :tested => 0
    }
    @tasks = Array.new
  end


  # method: digitally

  def digitally
    style = "\n\tErrors: %d, Failed: %d, Passed: %d, Tested: %d\n\n"
    stout = sprintf( style,
      self.stats.fetch(:errors),
      self.stats.fetch(:failed),
      self.stats.fetch(:passed),
      self.stats.fetch(:tested))

    puts stout
    return nil
  end


  # method: report

  def report(anomaly)
    self.stats[:errors] += 1
    flaw = format("Error: %s\n", anomaly.message)

    warn flaw
    return nil
  end


  # method: update

  def update(name, bool)
    desc = name.to_s.tr(?_, ?\s)

    if bool then
      self.stats[:passed] += 1
      puts "Passed: #{desc}"
    else
      self.stats[:failed] += 1
      puts "Failed: #{desc}"
    end
  rescue => anomaly
    self.report(anomaly)
  else
    self.stats[:tested] += 1
  ensure
    return nil
  end


  # attribute: tuning

  def tuning_value_not_nil
    hold = self.cosmo.tuning
    bool = !hold.nil?
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: tuning

  def tuning_value_type_symbol
    hold = self.cosmo.tuning
    bool = hold.instance_of? Symbol
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: tuning

  def tuning_value_member_stocks
    pegs = self.cosmo.stocks.keys
    hold = self.cosmo.tuning
    bool = pegs.member? hold
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: gears

  def gears_value_type_hash
    hold = self.cosmo.gears
    bool = hold.is_a? Hash
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: gears

  def gears_member_values_integer
    hold = self.cosmo.gears.values
    bool = hold.all? { |item| item.kind_of? Integer }
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: stocks

  def stocks_value_type_hash
    hold = self.cosmo.stocks
    bool = hold.is_a? Hash
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: stocks

  def stocks_member_values_array
    hold = self.cosmo.stocks.values
    bool = hold.all? { |item| item.kind_of? Array }
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: scales

  def scales_value_type_hash
    hold = self.cosmo.scales
    bool = hold.is_a? Hash
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: scales

  def scales_member_values_string
    hold = self.cosmo.scales.values
    bool = hold.all? { |item| item.kind_of? String }
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: scales

  def scales_member_values_length
    hold = self.cosmo.scales.values
    bool = hold.all? { |item| item.length == 60 }
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: machine

  def machine_return_type_string
    hold = self.cosmo.machine
    bool = hold.is_a? String
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: machine

  def machine_return_value_length
    cord = self.cosmo.scales.fetch(:n0)
    numb = self.cosmo.gears.fetch(:Gn)
    hold = self.cosmo.machine(cord, numb)
    span = hold.length
    bool = span.eql? 60
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: machine

  def machine_return_value_match
    cord = self.cosmo.scales.fetch(:n0)
    numb = self.cosmo.gears.fetch(:Gn)
    hold = self.cosmo.machine(cord, numb)
    wire = 'AuAg ____ AgAu ____ FePb HgCu ____ SnSn ____ CuHg PbFe ____ '
    bool = hold.eql? wire
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: lattice

  def lattice_return_type_string
    cord = self.cosmo.scales[:n0]
    pegs = self.cosmo.stocks[:cgdae]
    hold = self.cosmo.lattice(cord, pegs)
    bool = hold.instance_of? String
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: compose

  def compose_without_argument
    hold = self.cosmo.compose
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: compose

  def compose_argument_mistake
    sign = :k9
    hold = self.cosmo.compose sign
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: compose

  def compose_argument_correct
    sign = :n0
    hold = self.cosmo.compose sign
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: entirety

  def entirety_return_type_nil
    hold = self.cosmo.entirety
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: tabulate

  def tabulate_without_arguments
    hold = self.cosmo.tabulate
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: tabulate

  def tabulate_arguments_received
    arcs = self.cosmo.scales.keys.sort
    pads = "\t"
    hold = self.cosmo.tabulate(arcs, pads)
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: refinery

  def refinery_return_type_nil
    hold = self.cosmo.refinery
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: excavate

  def excavate_without_argument
    hold = self.cosmo.excavate
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: excavate

  def excavate_argument_mistake
    rock = 'ZeTa'
    hold = self.cosmo.excavate rock
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: excavate

  def excavate_argument_correct
    rock = 'AuHg'
    hold = self.cosmo.excavate rock
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: similar

  def similar_without_argument
    hold = self.cosmo.similar
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: similar

  def similar_argument_mistake
    spat = '99'
    hold = self.cosmo.similar spat
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: similar

  def similar_argument_correct
    spat = '56'
    hold = self.cosmo.similar spat
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: catalog

  def catalog_return_type_nil
    hold = self.cosmo.catalog
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: vestibule

  def vestibule_without_argument
    hold = self.cosmo.vestibule
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: vestibule

  def vestibule_argument_mistake
    star = ['disco', 'polka']
    hold = self.cosmo.vestibule star
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: vestibule

  def vestibule_argument_correct
    star = ['group', 'AuHg']
    hold = self.cosmo.vestibule star
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: entryway

  def entryway_without_argument
    hold = self.cosmo.entryway
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: entryway

  def entryway_argument_mistake
    star = ['disco', 'polka', 'k9']
    hold = self.cosmo.entryway star
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: entryway

  def entryway_argument_correct
    star = ['cgdae', 'n0', 'j3']
    hold = self.cosmo.entryway star
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(anomaly)
  else
    name = __method__
    self.update(name, bool)
  ensure
    return nil
  end


  # method: casework

  def casework
    self.tasks.push(Proc.new { tuning_value_not_nil })
    self.tasks.push(Proc.new { tuning_value_type_symbol })
    self.tasks.push(Proc.new { tuning_value_member_stocks })
    self.tasks.push(Proc.new { gears_value_type_hash })
    self.tasks.push(Proc.new { gears_member_values_integer })
    self.tasks.push(Proc.new { stocks_value_type_hash })
    self.tasks.push(Proc.new { stocks_member_values_array })
    self.tasks.push(Proc.new { scales_value_type_hash })
    self.tasks.push(Proc.new { scales_member_values_string })
    self.tasks.push(Proc.new { scales_member_values_length })
    self.tasks.push(Proc.new { machine_return_type_string })
    self.tasks.push(Proc.new { machine_return_value_length })
    self.tasks.push(Proc.new { machine_return_value_match })
    self.tasks.push(Proc.new { lattice_return_type_string })
    self.tasks.push(Proc.new { compose_without_argument })
    self.tasks.push(Proc.new { compose_argument_mistake })
    self.tasks.push(Proc.new { compose_argument_correct })
    self.tasks.push(Proc.new { tabulate_without_arguments })
    self.tasks.push(Proc.new { tabulate_arguments_received })
    self.tasks.push(Proc.new { refinery_return_type_nil })
    self.tasks.push(Proc.new { excavate_without_argument })
    self.tasks.push(Proc.new { excavate_argument_mistake })
    self.tasks.push(Proc.new { excavate_argument_correct })
    self.tasks.push(Proc.new { similar_without_argument })
    self.tasks.push(Proc.new { similar_argument_mistake })
    self.tasks.push(Proc.new { similar_argument_correct })
    self.tasks.push(Proc.new { catalog_return_type_nil })
    self.tasks.push(Proc.new { vestibule_without_argument })
    self.tasks.push(Proc.new { vestibule_argument_mistake })
    self.tasks.push(Proc.new { vestibule_argument_correct })
    self.tasks.push(Proc.new { entryway_without_argument })
    self.tasks.push(Proc.new { entryway_argument_mistake })
    self.tasks.push(Proc.new { entryway_argument_correct })
    self.tasks.push(Proc.new { entirety_return_type_nil })
  rescue => anomaly
    self.report(anomaly)
  else
    title = format("\n\t\t%s %s\n", 'Testing', self.cosmo.class)
    puts title
  ensure
    return nil
  end


  # method: runt

  def runt
    self.casework
    sleep 2

    unless self.tasks.empty? then
      stack = self.tasks.reverse

      stack.each do |job|
        sleep 1
        job.call
      end

      sleep 2
    end

    self.digitally
    return nil
  end


end # close epitome

  if __FILE__ == $0 then
    epic = Epitome.new
    epic.runt
  end

end # close softest

