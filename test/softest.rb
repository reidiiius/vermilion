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
    @cosmo = Chordophone::Cosmography.new(:unison, false)
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

  def report(name, anomaly)
    self.stats[:errors] += 1
    flaw = format("Defect: %s, Caught: %s\n", name, anomaly.message)

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

    self.stats[:tested] += 1
    return nil
  end


  # attribute: tuning

  def tuning_value_not_nil
    name = __method__
    hold = self.cosmo.tuning
    bool = !hold.nil?
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: tuning

  def tuning_value_type_symbol
    name = __method__
    hold = self.cosmo.tuning
    bool = hold.instance_of? Symbol
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: tuning

  def tuning_value_member_stocks
    name = __method__
    pegs = self.cosmo.stocks.keys
    hold = self.cosmo.tuning
    bool = pegs.member? hold
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: toggle

  def toggle_value_type_boolean
    name = __method__
    hold = self.cosmo.toggle
    bool = (hold.is_a?(TrueClass) or hold.is_a?(FalseClass))
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: keyed

  def keyed_value_type_regexp
    name = __method__
    rexp = self.cosmo.keyed
    bool = rexp.instance_of? Regexp
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: keyed

  def keyed_match_keys_scales
    name = __method__
    rexp = self.cosmo.keyed
    hold = self.cosmo.scales.keys
    bool = hold.all? { |sign| rexp.match? sign }
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: gears

  def gears_value_type_hash
    name = __method__
    hold = self.cosmo.gears
    bool = hold.is_a? Hash
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: gears

  def gears_member_keys_symbol
    name = __method__
    hold = self.cosmo.gears.keys
    bool = hold.all? { |item| item.kind_of? Symbol }
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: gears

  def gears_member_values_integer
    name = __method__
    hold = self.cosmo.gears.values
    bool = hold.all? { |item| item.kind_of? Integer }
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: stocks

  def stocks_value_type_hash
    name = __method__
    hold = self.cosmo.stocks
    bool = hold.is_a? Hash
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: stocks

  def stocks_member_keys_symbol
    name = __method__
    hold = self.cosmo.stocks.keys
    bool = hold.all? { |item| item.kind_of? Symbol }
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: stocks

  def stocks_member_values_array
    name = __method__
    hold = self.cosmo.stocks.values
    bool = hold.all? { |item| item.kind_of? Array }
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: stocks

  def stocks_value_element_symbol
    name = __method__
    hold = self.cosmo.stocks.values.flatten
    bool = hold.all? { |item| item.kind_of? Symbol }
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: stocks

  def stocks_element_member_gears
    name = __method__
    bank = self.cosmo.gears.keys
    hold = self.cosmo.stocks.values.flatten
    bool = hold.all? { |item| bank.include? item }
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: decors

  def decors_value_type_array
    name = __method__
    hold = self.cosmo.decors
    bool = hold.instance_of? Array
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: decors

  def decors_members_type_integer
    name = __method__
    hold = self.cosmo.decors
    bool = hold.all? { |item| item.is_a? Integer }
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: metals

  def metals_value_type_array
    name = __method__
    hold = self.cosmo.metals
    bool = hold.instance_of? Array
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: metals

  def metals_members_type_symbol
    name = __method__
    hold = self.cosmo.metals
    bool = hold.all? { |item| item.is_a? Symbol }
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: scales

  def scales_value_type_hash
    name = __method__
    hold = self.cosmo.scales
    bool = hold.is_a? Hash
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: scales

  def scales_member_keys_symbol
    name = __method__
    hold = self.cosmo.scales.keys
    bool = hold.all? { |item| item.kind_of? Symbol }
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: scales

  def scales_member_values_string
    name = __method__
    hold = self.cosmo.scales.values
    bool = hold.all? { |item| item.kind_of? String }
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # attribute: scales

  def scales_member_values_length
    name = __method__
    hold = self.cosmo.scales.values
    bool = hold.all? { |item| item.length == 60 }
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: spindle

  def spindle_return_type_string
    name = __method__
    hold = self.cosmo.spindle
    bool = hold.is_a? String
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: spindle

  def spindle_return_value_length
    name = __method__
    yarn = self.cosmo.scales.fetch(:n0)
    hold = self.cosmo.spindle(yarn)
    span = hold.length
    bool = span.eql? 36
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: machine

  def machine_return_type_string
    name = __method__
    hold = self.cosmo.machine
    bool = hold.is_a? String
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: machine

  def machine_return_value_length
    name = __method__
    cord = self.cosmo.scales.fetch(:n0)
    numb = self.cosmo.gears.fetch(:Gn)
    hold = self.cosmo.machine(cord, numb)
    cars = self.cosmo.toggle ? 64 : 38
    span = hold.length
    bool = span.eql? cars
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: machine

  def machine_return_value_match
    name = __method__
    cord = self.cosmo.scales.fetch(:n0)
    numb = self.cosmo.gears.fetch(:Gn)
    hold = self.cosmo.machine(cord, numb)
    wire = self.cosmo.toggle ?
      'AuAg ____ AgAu ____ FePb HgCu ____ SnSn ____ CuHg PbFe ____ AuAg' :
      'us __ su __ qw vr __ tt __ rv wq __ us'
    bool = hold.eql? wire
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: lattice

  def lattice_return_type_string
    name = __method__
    cord = self.cosmo.scales[:n0]
    pegs = self.cosmo.stocks[:cgdae]
    hold = self.cosmo.lattice(cord, pegs)
    bool = hold.instance_of? String
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: epochal

  def epochal_return_type_string
    name = __method__
    hold = self.cosmo.epochal
    bool = hold.instance_of? String
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: compose

  def compose_without_argument
    name = __method__
    hold = self.cosmo.compose
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: compose

  def compose_argument_mistake
    name = __method__
    sign = 'k9'
    hold = self.cosmo.compose sign
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: compose

  def compose_argument_correct
    name = __method__
    sign = 'n0'
    seal = self.cosmo.epochal
    hold = self.cosmo.compose(sign, seal)
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: entirety

  def entirety_return_type_nil
    name = __method__
    hold = self.cosmo.entirety
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: tabulate

  def tabulate_without_arguments
    name = __method__
    hold = self.cosmo.tabulate
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: tabulate

  def tabulate_arguments_received
    name = __method__
    arcs = self.cosmo.scales.keys.sort
    pads = "\t"
    hold = self.cosmo.tabulate(arcs, pads)
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: refinery

  def refinery_return_type_nil
    name = __method__
    hold = self.cosmo.refinery
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: excavate

  def excavate_without_argument
    name = __method__
    hold = self.cosmo.excavate
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: excavate

  def excavate_argument_mistake
    name = __method__
    rock = self.cosmo.toggle ? 'ZeTa' : 'om'
    hold = self.cosmo.excavate rock
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: excavate

  def excavate_argument_correct
    name = __method__
    rock = self.cosmo.toggle ? 'AuHg' : 'uv'
    hold = self.cosmo.excavate rock
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: similar

  def similar_without_argument
    name = __method__
    hold = self.cosmo.similar
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: similar

  def similar_argument_mistake
    name = __method__
    spat = '99'
    hold = self.cosmo.similar spat
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: similar

  def similar_argument_correct
    name = __method__
    spat = '56'
    hold = self.cosmo.similar spat
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: catalog

  def catalog_return_type_nil
    name = __method__
    hold = self.cosmo.catalog
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: vestibule

  def vestibule_without_argument
    name = __method__
    hold = self.cosmo.vestibule
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: vestibule

  def vestibule_argument_mistake
    name = __method__
    star = ['disco', 'polka']
    hold = self.cosmo.vestibule star
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: vestibule

  def vestibule_argument_correct
    name = __method__
    star = self.cosmo.toggle ?
      ['group', 'AuHg'] : ['group', 'uv']
    hold = self.cosmo.vestibule star
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: entryway

  def entryway_without_argument
    name = __method__
    hold = self.cosmo.entryway
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: entryway

  def entryway_argument_mistake
    name = __method__
    star = ['disco', 'polka', 'k9']
    hold = self.cosmo.entryway star
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: entryway

  def entryway_argument_correct
    name = __method__
    star = ['cgdae', 'n0', 'j3']
    hold = self.cosmo.entryway star
    bool = hold.instance_of? NilClass
  rescue => anomaly
    self.report(name, anomaly)
  else
    self.update(name, bool)
  ensure
    return nil
  end


  # method: casework

  def casework
    name = __method__
    self.tasks = [
      -> { entirety_return_type_nil },
      -> { tuning_value_not_nil },
      -> { tuning_value_type_symbol },
      -> { tuning_value_member_stocks },
      -> { toggle_value_type_boolean },
      -> { keyed_value_type_regexp },
      -> { keyed_match_keys_scales },
      -> { gears_value_type_hash },
      -> { gears_member_keys_symbol },
      -> { gears_member_values_integer },
      -> { stocks_value_type_hash },
      -> { stocks_member_keys_symbol },
      -> { stocks_member_values_array },
      -> { stocks_value_element_symbol },
      -> { stocks_element_member_gears },
      -> { decors_value_type_array },
      -> { decors_members_type_integer },
      -> { metals_value_type_array },
      -> { metals_members_type_symbol },
      -> { scales_value_type_hash },
      -> { scales_member_keys_symbol },
      -> { scales_member_values_string },
      -> { scales_member_values_length },
      -> { spindle_return_type_string },
      -> { spindle_return_value_length },
      -> { machine_return_type_string },
      -> { machine_return_value_length },
      -> { machine_return_value_match },
      -> { lattice_return_type_string },
      -> { epochal_return_type_string },
      -> { compose_without_argument },
      -> { compose_argument_mistake },
      -> { compose_argument_correct },
      -> { tabulate_without_arguments },
      -> { tabulate_arguments_received },
      -> { refinery_return_type_nil },
      -> { excavate_without_argument },
      -> { excavate_argument_mistake },
      -> { excavate_argument_correct },
      -> { similar_without_argument },
      -> { similar_argument_mistake },
      -> { similar_argument_correct },
      -> { catalog_return_type_nil },
      -> { vestibule_without_argument },
      -> { vestibule_argument_mistake },
      -> { vestibule_argument_correct },
      -> { entryway_without_argument },
      -> { entryway_argument_mistake },
      -> { entryway_argument_correct },
    ]
  rescue => anomaly
    self.report(name, anomaly)
  else
    title = format("\n\t\t%s %s\n", 'Testing', self.cosmo.class)
    puts title
  ensure
    return nil
  end


  # method: runt

  def runt
    self.casework
    sleep 1

    unless self.tasks.empty? then
      stack = self.tasks

      stack.each do |job|
        sleep 1
        job.call
      end

      sleep 1
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

