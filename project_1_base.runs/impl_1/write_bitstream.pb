
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0452default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0452default:defaultZ17-349h px� 
x
,Running DRC as a precondition to command %s
1349*	planAhead2#
write_bitstream2default:defaultZ12-1349h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
Rule violation (%s) %s - %s
20*drc2
PDRC-1532default:default2%
Gated clock check2default:default2�
�Net dut/dac_config/data_in_reg[15]_i_2_n_0 is a gated clock net sourced by a combinational pin dut/dac_config/data_in_reg[15]_i_2/O, cell dut/dac_config/data_in_reg[15]_i_2. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
PDRC-1532default:default2%
Gated clock check2default:default2�
�Net dut/dac_config1/dac_num_reg[3]_i_2_n_0 is a gated clock net sourced by a combinational pin dut/dac_config1/dac_num_reg[3]_i_2/O, cell dut/dac_config1/dac_num_reg[3]_i_2. This is not good design practice and will likely impact performance. For SLICE registers, for example, use the CE pin to control the loading of data.2default:defaultZ23-20h px� 
�
Rule violation (%s) %s - %s
20*drc2
	RTSTAT-102default:default2%
No routable loads2default:default2�

�
803 net(s) have no routable loads. The problem bus(es) and/or net(s) are dut/vio_0/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT[10].PROBE_OUT0_INST/PROBE_OUT[31:0], dut/vio_0/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT[9].PROBE_OUT0_INST/PROBE_OUT[31:0], dut/vio_0/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT[18].PROBE_OUT0_INST/PROBE_OUT[0], dut/vio_0/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT[21].PROBE_OUT0_INST/PROBE_OUT[31:0], dut/vio_0/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT[17].PROBE_OUT0_INST/PROBE_OUT[31:0], dut/vio_0/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT[16].PROBE_OUT0_INST/PROBE_OUT[31:0], dut/vio_0/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT[22].PROBE_OUT0_INST/PROBE_OUT[31:0], dut/vio_0/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT[19].PROBE_OUT0_INST/PROBE_OUT[31:0], dut/vio_0/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT[20].PROBE_OUT0_INST/PROBE_OUT[31:0], dut/vio_0/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT[12].PROBE_OUT0_INST/PROBE_OUT[31:0], dut/vio_0/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT[15].PROBE_OUT0_INST/PROBE_OUT[31:0], dut/vio_0/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT[2].PROBE_OUT0_INST/PROBE_OUT[0], dut/vio_0/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT[11].PROBE_OUT0_INST/PROBE_OUT[31:0], dut/vio_0/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT[8].PROBE_OUT0_INST/PROBE_OUT[31:0], dut/vio_0/inst/PROBE_OUT_ALL_INST/G_PROBE_OUT[13].PROBE_OUT0_INST/PROBE_OUT[31:0] (the first 15 of 28 listed).2default:defaultZ23-20h px� 
f
DRC finished with %s
1905*	planAhead2(
0 Errors, 3 Warnings2default:defaultZ12-3199h px� 
i
BPlease refer to the DRC report (report_drc) for more information.
1906*	planAheadZ12-3200h px� 
?
Loading data files...
1271*designutilsZ12-1165h px� 
>
Loading site data...
1273*designutilsZ12-1167h px� 
?
Loading route data...
1272*designutilsZ12-1166h px� 
?
Processing options...
1362*designutilsZ12-1514h px� 
<
Creating bitmap...
1249*designutilsZ12-1141h px� 
7
Creating bitstream...
7*	bitstreamZ40-7h px� 
e
Writing bitstream %s...
11*	bitstream2(
./system_wrapper.bit2default:defaultZ40-11h px� 
F
Bitgen Completed Successfully.
1606*	planAheadZ12-1842h px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2%
write_bitstream: 2default:default2
00:01:072default:default2
00:01:052default:default2
2404.2342default:default2
456.8522default:defaultZ17-268h px� 


End Record