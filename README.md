# Vermilion
Chordophone Cosmography

---

### Download

    git clone https://github.com/reidiiius/vermilion.git

---

### Usage
Command-line

    cd vermilion/

:

    ruby lib/chordophone.rb

:

    ruby lib/chordophone.rb n0

:

    ruby lib/chordophone.rb j6 k5

:

    ruby lib/chordophone.rb cgdae j6 k5

:

    ruby lib/chordophone.rb tonal

:

    ruby lib/chordophone.rb group HgAu

:

    ruby lib/chordophone.rb query 56

:

    ruby lib/chordophone.rb gamut | sensible-pager

REPL

    irb -r './lib/chordophone.rb'

;

    o = Chordophone::Cosmography.new(:beadgcf, false)

;

    puts o.instance_variables.sort

;

    puts o.public_methods.first(30).sort

;

    o.catalog

;

    o.tuning = :eadgbe

;

    args = [:n0, :j3]

;

    o.entryway(args)

;

    args.push 'tonal'

;

    o.entryway(args)

;

    rock = :uv

;

    o.excavate rock

;

    spat = 56

;

    o.similar spat

;

    args = ['group', :uv]

;

    o.entryway(args)

;

    args = ['query', 56]

;

    o.entryway(args)

;

    o.toggle = true

;

    args = [:k56, :j56]

;

    o.entryway(args)

;

    o.tuning = :cgdae

;

    o.entryway(args)

;

    o.catalog

;

    quit

---

### Distribution
MIT License

