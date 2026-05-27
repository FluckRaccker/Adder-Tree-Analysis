set paths [get_timing_paths -npaths 100 -setup -fall_from * -fall_to *]

set max_ff 0

foreach_in_collection path $paths {
    set delay [get_path_info $path -arrival_time]

    if {$delay > $max_ff} {
        set max_ff $delay
    }
}

puts "Maior FF delay = $max_ff"