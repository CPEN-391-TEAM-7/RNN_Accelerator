onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /rnn_tb/dut/state
add wave -noupdate /rnn_tb/clk
add wave -noupdate /rnn_tb/rst_n
add wave -noupdate /rnn_tb/read
add wave -noupdate /rnn_tb/write
add wave -noupdate -radix hexadecimal /rnn_tb/addr
add wave -noupdate -radix hexadecimal /rnn_tb/data_in
add wave -noupdate -radix hexadecimal /rnn_tb/data_out
add wave -noupdate -divider input_vector
add wave -noupdate -radix sfixed -childformat {{{/rnn_tb/dut/input_char/vector[1]} -radix sfixed} {{/rnn_tb/dut/input_char/vector[0]} -radix sfixed}} -expand -subitemconfig {{/rnn_tb/dut/input_char/vector[1]} {-height 15 -radix sfixed} {/rnn_tb/dut/input_char/vector[0]} {-height 15 -radix sfixed}} /rnn_tb/dut/input_char/vector
add wave -noupdate -divider {Rnn matrix 0}
add wave -noupdate -radix sfixed -childformat {{{/rnn_tb/dut/rnn_0/matrix[1]} -radix sfixed -childformat {{{/rnn_tb/dut/rnn_0/matrix[1][3]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[1][2]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[1][1]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[1][0]} -radix sfixed}}} {{/rnn_tb/dut/rnn_0/matrix[0]} -radix sfixed -childformat {{{/rnn_tb/dut/rnn_0/matrix[0][3]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][2]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][1]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0]} -radix sfixed}}}} -expand -subitemconfig {{/rnn_tb/dut/rnn_0/matrix[1]} {-height 15 -radix sfixed -childformat {{{/rnn_tb/dut/rnn_0/matrix[1][3]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[1][2]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[1][1]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[1][0]} -radix sfixed}}} {/rnn_tb/dut/rnn_0/matrix[1][3]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[1][2]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[1][1]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[1][0]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0]} {-height 15 -radix sfixed -childformat {{{/rnn_tb/dut/rnn_0/matrix[0][3]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][2]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][1]} -radix sfixed} {{/rnn_tb/dut/rnn_0/matrix[0][0]} -radix sfixed}}} {/rnn_tb/dut/rnn_0/matrix[0][3]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][2]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][1]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_0/matrix[0][0]} {-height 15 -radix sfixed}} /rnn_tb/dut/rnn_0/matrix
add wave -noupdate -divider {Rnn matrix 1}
add wave -noupdate -radix sfixed -childformat {{{/rnn_tb/dut/rnn_1/matrix[3]} -radix sfixed} {{/rnn_tb/dut/rnn_1/matrix[2]} -radix sfixed} {{/rnn_tb/dut/rnn_1/matrix[1]} -radix sfixed} {{/rnn_tb/dut/rnn_1/matrix[0]} -radix sfixed}} -expand -subitemconfig {{/rnn_tb/dut/rnn_1/matrix[3]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_1/matrix[2]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_1/matrix[1]} {-height 15 -radix sfixed} {/rnn_tb/dut/rnn_1/matrix[0]} {-height 15 -radix sfixed}} /rnn_tb/dut/rnn_1/matrix
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {99 ps} 0}
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
WaveRestoreZoom {0 ps} {120 ps}
