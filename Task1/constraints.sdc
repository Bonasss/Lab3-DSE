#**************************************************************
# Time Information
#**************************************************************
set_time_format -unit ns -decimal_places 3
#**************************************************************
# Create Clock
#**************************************************************
create_clock -name {CK} -period 10.000 -waveform { 0.000 5.000 }[get_ports {CK}]