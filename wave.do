onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Top Level Controls}
add wave -noupdate -color Magenta /rnn_tb/dut/state
add wave -noupdate /rnn_tb/clk
add wave -noupdate /rnn_tb/rst_n
add wave -noupdate /rnn_tb/read
add wave -noupdate /rnn_tb/write
add wave -noupdate -radix hexadecimal /rnn_tb/addr
add wave -noupdate -radix hexadecimal /rnn_tb/data_in
add wave -noupdate -radix hexadecimal /rnn_tb/data_out
add wave -noupdate -divider {Input Vector}
add wave -noupdate -radix sfixed -childformat {{{/rnn_tb/dut/input_char/vector[1]} -radix sfixed} {{/rnn_tb/dut/input_char/vector[0]} -radix sfixed}} -subitemconfig {{/rnn_tb/dut/input_char/vector[1]} {-height 15 -radix sfixed} {/rnn_tb/dut/input_char/vector[0]} {-height 15 -radix sfixed}} /rnn_tb/dut/input_char/vector
add wave -noupdate -divider {Hidden State}
add wave -noupdate /rnn_tb/dut/hidden/param_in
add wave -noupdate -radix sfixed /rnn_tb/dut/hidden/vector
add wave -noupdate -divider {Weight Matrix}
add wave -noupdate -radix sfixed -childformat {{{/rnn_tb/dut/rnn_0/matrix[1]} -radix sfixed -childformat {{{/rnn_tb/dut/rnn_0/matrix[1][3]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[1][2]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[1][1]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[1][0]} -radix sfixed}}} {{/rnn_tb/dut/rnn_0/matrix[0]} -radix sfixed -childformat {{{/rnn_tb/dut/rnn_0/matrix[0][3]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][2]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][1]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0]} -radix sfixed -childformat {{{/rnn_tb/dut/rnn_0/matrix[0][0][15]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][14]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][13]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][12]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][11]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][10]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][9]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][8]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][7]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][6]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][5]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][4]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][3]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][2]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][1]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][0]} -radix sfixed}}}}}} -subitemconfig {{/rnn_tb/dut/rnn_0/matrix[1]} {-height 15 -radix sfixed -childformat {{{/rnn_tb/dut/rnn_0/matrix[1][3]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[1][2]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[1][1]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[1][0]} -radix sfixed}}} {/rnn_tb/dut/rnn_0/matrix[1][3]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[1][2]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[1][1]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[1][0]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0]} {-height 15 -radix sfixed -childformat {{{/rnn_tb/dut/rnn_0/matrix[0][3]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][2]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][1]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0]} -radix sfixed -childformat {{{/rnn_tb/dut/rnn_0/matrix[0][0][15]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][14]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][13]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][12]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][11]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][10]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][9]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][8]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][7]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][6]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][5]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][4]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][3]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][2]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][1]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][0]} -radix sfixed}}}}} {/rnn_tb/dut/rnn_0/matrix[0][3]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][2]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][1]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][0]} {-height 15 -radix sfixed -childformat {{{/rnn_tb/dut/rnn_0/matrix[0][0][15]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][14]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][13]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][12]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][11]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][10]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][9]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][8]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][7]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][6]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][5]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][4]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][3]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][2]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][1]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0][0]} -radix sfixed}}} {/rnn_tb/dut/rnn_0/matrix[0][0][15]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][0][14]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][0][13]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][0][12]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][0][11]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][0][10]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][0][9]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][0][8]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][0][7]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][0][6]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][0][5]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][0][4]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][0][3]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][0][2]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][0][1]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][0][0]} {-height 15 -radix sfixed}} /rnn_tb/dut/rnn_0/matrix
add wave -noupdate -divider {Recurrent Matrix}
add wave -noupdate -radix sfixed -childformat {{{/rnn_tb/dut/rnn_1/matrix[3]} -radix sfixed} {{/rnn_tb/dut/rnn_1/matrix[2]} -radix sfixed} {{/rnn_tb/dut/rnn_1/matrix[1]} -radix sfixed} {{/rnn_tb/dut/rnn_1/matrix[0]} -radix sfixed -childformat {{{/rnn_tb/dut/rnn_1/matrix[0][3]} -radix sfixed} {{/rnn_tb/dut/rnn_1/matrix[0][2]} -radix sfixed} {{/rnn_tb/dut/rnn_1/matrix[0][1]} -radix sfixed} {{/rnn_tb/dut/rnn_1/matrix[0][0]} -radix sfixed}}}} -subitemconfig {{/rnn_tb/dut/rnn_1/matrix[3]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_1/matrix[2]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_1/matrix[1]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_1/matrix[0]} {-height 15 -radix sfixed -childformat {{{/rnn_tb/dut/rnn_1/matrix[0][3]} -radix sfixed} {{/rnn_tb/dut/rnn_1/matrix[0][2]} -radix sfixed} {{/rnn_tb/dut/rnn_1/matrix[0][1]} -radix sfixed} {{/rnn_tb/dut/rnn_1/matrix[0][0]} -radix sfixed}}} {/rnn_tb/dut/rnn_1/matrix[0][3]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_1/matrix[0][2]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_1/matrix[0][1]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_1/matrix[0][0]} {-height 15 -radix sfixed}} /rnn_tb/dut/rnn_1/matrix
add wave -noupdate -divider {RNN Bias}
add wave -noupdate /rnn_tb/dut/rnn_bias/param_out
add wave -noupdate -radix sfixed /rnn_tb/dut/rnn_bias/vector
add wave -noupdate -divider {Weight Multiplier}
add wave -noupdate /rnn_tb/dut/weight_multiplier/ready
add wave -noupdate -radix sfixed -childformat {{{/rnn_tb/dut/weight_multiplier/imm_vec/vector[3]} -radix sfixed} {{/rnn_tb/dut/weight_multiplier/imm_vec/vector[2]} -radix sfixed} {{/rnn_tb/dut/weight_multiplier/imm_vec/vector[1]} -radix sfixed} {{/rnn_tb/dut/weight_multiplier/imm_vec/vector[0]} -radix sfixed}} -expand -subitemconfig {{/rnn_tb/dut/weight_multiplier/imm_vec/vector[3]} {-height 15 -radix sfixed} {/rnn_tb/dut/weight_multiplier/imm_vec/vector[2]} {-height 15 -radix sfixed} {/rnn_tb/dut/weight_multiplier/imm_vec/vector[1]} {-height 15 -radix sfixed} {/rnn_tb/dut/weight_multiplier/imm_vec/vector[0]} {-height 15 -radix sfixed}} /rnn_tb/dut/weight_multiplier/imm_vec/vector
add wave -noupdate -radix sfixed /rnn_tb/dut/weight_multiplier/data_out
add wave -noupdate -divider {Recurrent Multiplier}
add wave -noupdate /rnn_tb/dut/recurrent_multiplier/ready
add wave -noupdate -radix sfixed /rnn_tb/dut/recurrent_multiplier/imm_vec/vector
add wave -noupdate -radix sfixed /rnn_tb/dut/recurrent_multiplier/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {170 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 226
configure wave -valuecolwidth 123
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {182 ps}
