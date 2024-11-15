-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Thu Oct 17 13:41:47 2019
-- Host        : ICFC-9MBJXP2 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               D:/program_4k/project_1_base_v3.00_2018/project_1_base.runs/vio_0_synth_1/vio_0_stub.vhdl
-- Design      : vio_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z015clg485-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity vio_0 is
  Port ( 
    clk : in STD_LOGIC;
    probe_in0 : in STD_LOGIC_VECTOR ( 0 to 0 );
    probe_in1 : in STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_in2 : in STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_in3 : in STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_in4 : in STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_out0 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out1 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out2 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out3 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out4 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out5 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out6 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out7 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out8 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out9 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out10 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out11 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out12 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out13 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out14 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out15 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out16 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out17 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out18 : out STD_LOGIC_VECTOR ( 0 to 0 );
    probe_out19 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out20 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out21 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out22 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out23 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_out24 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_out25 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_out26 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_out27 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_out28 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_out29 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_out30 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_out31 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_out32 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_out33 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_out34 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_out35 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_out36 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_out37 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_out38 : out STD_LOGIC_VECTOR ( 255 downto 0 );
    probe_out39 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    probe_out40 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out41 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out42 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out43 : out STD_LOGIC_VECTOR ( 31 downto 0 );
    probe_out44 : out STD_LOGIC_VECTOR ( 127 downto 0 );
    probe_out45 : out STD_LOGIC_VECTOR ( 127 downto 0 )
  );

end vio_0;

architecture stub of vio_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,probe_in0[0:0],probe_in1[255:0],probe_in2[255:0],probe_in3[255:0],probe_in4[255:0],probe_out0[0:0],probe_out1[0:0],probe_out2[0:0],probe_out3[31:0],probe_out4[31:0],probe_out5[31:0],probe_out6[31:0],probe_out7[31:0],probe_out8[31:0],probe_out9[31:0],probe_out10[31:0],probe_out11[31:0],probe_out12[31:0],probe_out13[31:0],probe_out14[31:0],probe_out15[31:0],probe_out16[31:0],probe_out17[31:0],probe_out18[0:0],probe_out19[31:0],probe_out20[31:0],probe_out21[31:0],probe_out22[31:0],probe_out23[255:0],probe_out24[255:0],probe_out25[255:0],probe_out26[255:0],probe_out27[255:0],probe_out28[255:0],probe_out29[255:0],probe_out30[255:0],probe_out31[255:0],probe_out32[255:0],probe_out33[255:0],probe_out34[255:0],probe_out35[255:0],probe_out36[255:0],probe_out37[255:0],probe_out38[255:0],probe_out39[127:0],probe_out40[31:0],probe_out41[31:0],probe_out42[31:0],probe_out43[31:0],probe_out44[127:0],probe_out45[127:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "vio,Vivado 2018.2";
begin
end;
