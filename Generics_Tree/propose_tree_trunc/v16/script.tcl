# Carrega o projeto
project_open generic_propose_tree
# Cria netlist de timing
create_timing_netlist

# Lê constraints
read_sdc

# Atualiza timing
update_timing_netlist

# Gera relatório (entrada -> saída)
report_path \
    -from [all_inputs] \
    -to [all_outputs] \
    -npaths 10000 \
    -file io_paths.txt
	
report_path -npaths 1 -file worst_path.txt

# Fecha projeto
project_close