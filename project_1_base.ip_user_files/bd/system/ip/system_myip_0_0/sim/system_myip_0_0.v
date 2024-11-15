// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:myip:2.0
// IP Revision: 3

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_myip_0_0 (
  s00_axi_awaddr,
  s00_axi_awprot,
  s00_axi_awvalid,
  s00_axi_awready,
  s00_axi_wdata,
  s00_axi_wstrb,
  s00_axi_wvalid,
  s00_axi_wready,
  s00_axi_bresp,
  s00_axi_bvalid,
  s00_axi_bready,
  s00_axi_araddr,
  s00_axi_arprot,
  s00_axi_arvalid,
  s00_axi_arready,
  s00_axi_rdata,
  s00_axi_rresp,
  s00_axi_rvalid,
  s00_axi_rready,
  reg1,
  reg2,
  reg3,
  reg4,
  reg5,
  reg6,
  reg7,
  reg8,
  reg9,
  reg10,
  reg11,
  reg12,
  reg13,
  reg14,
  reg15,
  reg16,
  reg17,
  reg18,
  reg19,
  reg20,
  reg21,
  reg22,
  reg23,
  reg24,
  reg25,
  reg26,
  reg27,
  reg28,
  reg29,
  reg30,
  reg31,
  reg32,
  reg33,
  reg34,
  reg35,
  reg36,
  reg37,
  reg38,
  reg39,
  reg40,
  reg41,
  reg42,
  reg43,
  reg44,
  reg45,
  reg46,
  reg47,
  reg48,
  reg49,
  reg50,
  reg51,
  reg52,
  reg53,
  reg54,
  reg55,
  reg56,
  reg57,
  reg58,
  reg59,
  reg60,
  reg61,
  reg62,
  reg63,
  reg64,
  reg65,
  reg66,
  reg67,
  reg68,
  reg69,
  reg70,
  reg71,
  reg72,
  reg73,
  reg74,
  reg75,
  reg76,
  reg77,
  reg78,
  reg79,
  reg80,
  reg81,
  reg82,
  reg83,
  reg84,
  reg85,
  reg86,
  reg87,
  reg88,
  reg89,
  reg90,
  reg91,
  reg92,
  reg93,
  reg94,
  reg95,
  reg96,
  reg97,
  reg98,
  reg99,
  reg100,
  reg101,
  reg102,
  reg103,
  reg104,
  reg105,
  reg106,
  reg107,
  reg108,
  reg109,
  reg110,
  reg111,
  reg112,
  reg113,
  reg114,
  reg115,
  reg116,
  reg117,
  reg118,
  reg119,
  reg120,
  reg121,
  reg122,
  reg123,
  reg124,
  reg125,
  reg126,
  reg127,
  reg128,
  reg129,
  reg130,
  reg131,
  reg132,
  reg133,
  reg134,
  reg135,
  reg136,
  reg137,
  reg138,
  reg139,
  reg140,
  reg141,
  reg142,
  reg143,
  reg144,
  reg145,
  reg146,
  reg147,
  reg148,
  reg149,
  reg150,
  reg151,
  reg152,
  reg153,
  reg154,
  reg155,
  reg160,
  reg161,
  reg162,
  reg163,
  reg164,
  reg165,
  reg166,
  reg167,
  reg168,
  reg169,
  reg170,
  reg171,
  reg172,
  reg173,
  reg174,
  reg175,
  reg176,
  reg177,
  reg178,
  reg179,
  reg180,
  reg181,
  reg182,
  reg183,
  reg184,
  reg185,
  reg186,
  reg187,
  reg188,
  reg189,
  reg190,
  reg191,
  reg192,
  reg193,
  reg194,
  reg195,
  reg196,
  reg197,
  reg198,
  reg199,
  reg0,
  s00_axi_aclk,
  s00_axi_aresetn
);

(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *)
input wire [9 : 0] s00_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *)
input wire [2 : 0] s00_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *)
input wire s00_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *)
output wire s00_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *)
input wire [31 : 0] s00_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *)
input wire [3 : 0] s00_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *)
input wire s00_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *)
output wire s00_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *)
output wire [1 : 0] s00_axi_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *)
output wire s00_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *)
input wire s00_axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *)
input wire [9 : 0] s00_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *)
input wire [2 : 0] s00_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *)
input wire s00_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *)
output wire s00_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *)
output wire [31 : 0] s00_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *)
output wire [1 : 0] s00_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *)
output wire s00_axi_rvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 200, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 50000000, ID_WIDTH 0, ADDR_WIDTH 10, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 8, NUM_WRITE_OUTSTANDING 8, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN system_processing_sys\
tem7_0_0_FCLK_CLK0, NUM_READ_THREADS 4, NUM_WRITE_THREADS 4, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *)
input wire s00_axi_rready;
output wire [31 : 0] reg1;
output wire [31 : 0] reg2;
output wire [31 : 0] reg3;
output wire [31 : 0] reg4;
output wire [31 : 0] reg5;
output wire [31 : 0] reg6;
output wire [31 : 0] reg7;
output wire [31 : 0] reg8;
output wire [31 : 0] reg9;
output wire [31 : 0] reg10;
output wire [31 : 0] reg11;
output wire [31 : 0] reg12;
output wire [31 : 0] reg13;
output wire [31 : 0] reg14;
output wire [31 : 0] reg15;
output wire [31 : 0] reg16;
output wire [31 : 0] reg17;
output wire [31 : 0] reg18;
output wire [31 : 0] reg19;
output wire [31 : 0] reg20;
output wire [31 : 0] reg21;
output wire [31 : 0] reg22;
output wire [31 : 0] reg23;
output wire [31 : 0] reg24;
output wire [31 : 0] reg25;
output wire [31 : 0] reg26;
output wire [31 : 0] reg27;
output wire [31 : 0] reg28;
output wire [31 : 0] reg29;
output wire [31 : 0] reg30;
output wire [31 : 0] reg31;
output wire [31 : 0] reg32;
output wire [31 : 0] reg33;
output wire [31 : 0] reg34;
output wire [31 : 0] reg35;
output wire [31 : 0] reg36;
output wire [31 : 0] reg37;
output wire [31 : 0] reg38;
output wire [31 : 0] reg39;
output wire [31 : 0] reg40;
output wire [31 : 0] reg41;
output wire [31 : 0] reg42;
output wire [31 : 0] reg43;
output wire [31 : 0] reg44;
output wire [31 : 0] reg45;
output wire [31 : 0] reg46;
output wire [31 : 0] reg47;
output wire [31 : 0] reg48;
output wire [31 : 0] reg49;
output wire [31 : 0] reg50;
output wire [31 : 0] reg51;
output wire [31 : 0] reg52;
output wire [31 : 0] reg53;
output wire [31 : 0] reg54;
output wire [31 : 0] reg55;
output wire [31 : 0] reg56;
output wire [31 : 0] reg57;
output wire [31 : 0] reg58;
output wire [31 : 0] reg59;
output wire [31 : 0] reg60;
output wire [31 : 0] reg61;
output wire [31 : 0] reg62;
output wire [31 : 0] reg63;
output wire [31 : 0] reg64;
output wire [31 : 0] reg65;
output wire [31 : 0] reg66;
output wire [31 : 0] reg67;
output wire [31 : 0] reg68;
output wire [31 : 0] reg69;
output wire [31 : 0] reg70;
output wire [31 : 0] reg71;
output wire [31 : 0] reg72;
output wire [31 : 0] reg73;
output wire [31 : 0] reg74;
output wire [31 : 0] reg75;
output wire [31 : 0] reg76;
output wire [31 : 0] reg77;
output wire [31 : 0] reg78;
output wire [31 : 0] reg79;
output wire [31 : 0] reg80;
output wire [31 : 0] reg81;
output wire [31 : 0] reg82;
output wire [31 : 0] reg83;
output wire [31 : 0] reg84;
output wire [31 : 0] reg85;
output wire [31 : 0] reg86;
output wire [31 : 0] reg87;
output wire [31 : 0] reg88;
output wire [31 : 0] reg89;
output wire [31 : 0] reg90;
output wire [31 : 0] reg91;
output wire [31 : 0] reg92;
output wire [31 : 0] reg93;
output wire [31 : 0] reg94;
output wire [31 : 0] reg95;
output wire [31 : 0] reg96;
output wire [31 : 0] reg97;
output wire [31 : 0] reg98;
output wire [31 : 0] reg99;
output wire [31 : 0] reg100;
output wire [31 : 0] reg101;
output wire [31 : 0] reg102;
output wire [31 : 0] reg103;
output wire [31 : 0] reg104;
output wire [31 : 0] reg105;
output wire [31 : 0] reg106;
output wire [31 : 0] reg107;
output wire [31 : 0] reg108;
output wire [31 : 0] reg109;
output wire [31 : 0] reg110;
output wire [31 : 0] reg111;
output wire [31 : 0] reg112;
output wire [31 : 0] reg113;
output wire [31 : 0] reg114;
output wire [31 : 0] reg115;
output wire [31 : 0] reg116;
output wire [31 : 0] reg117;
output wire [31 : 0] reg118;
output wire [31 : 0] reg119;
output wire [31 : 0] reg120;
output wire [31 : 0] reg121;
output wire [31 : 0] reg122;
output wire [31 : 0] reg123;
output wire [31 : 0] reg124;
output wire [31 : 0] reg125;
output wire [31 : 0] reg126;
output wire [31 : 0] reg127;
output wire [31 : 0] reg128;
output wire [31 : 0] reg129;
output wire [31 : 0] reg130;
output wire [31 : 0] reg131;
output wire [31 : 0] reg132;
output wire [31 : 0] reg133;
output wire [31 : 0] reg134;
output wire [31 : 0] reg135;
output wire [31 : 0] reg136;
output wire [31 : 0] reg137;
output wire [31 : 0] reg138;
output wire [31 : 0] reg139;
output wire [31 : 0] reg140;
output wire [31 : 0] reg141;
output wire [31 : 0] reg142;
output wire [31 : 0] reg143;
output wire [31 : 0] reg144;
output wire [31 : 0] reg145;
output wire [31 : 0] reg146;
output wire [31 : 0] reg147;
output wire [31 : 0] reg148;
output wire [31 : 0] reg149;
output wire [31 : 0] reg150;
output wire [31 : 0] reg151;
output wire [31 : 0] reg152;
output wire [31 : 0] reg153;
output wire [31 : 0] reg154;
output wire [31 : 0] reg155;
input wire [31 : 0] reg160;
input wire [31 : 0] reg161;
input wire [31 : 0] reg162;
input wire [31 : 0] reg163;
input wire [31 : 0] reg164;
input wire [31 : 0] reg165;
input wire [31 : 0] reg166;
input wire [31 : 0] reg167;
input wire [31 : 0] reg168;
input wire [31 : 0] reg169;
input wire [31 : 0] reg170;
input wire [31 : 0] reg171;
input wire [31 : 0] reg172;
input wire [31 : 0] reg173;
input wire [31 : 0] reg174;
input wire [31 : 0] reg175;
input wire [31 : 0] reg176;
input wire [31 : 0] reg177;
input wire [31 : 0] reg178;
input wire [31 : 0] reg179;
input wire [31 : 0] reg180;
input wire [31 : 0] reg181;
input wire [31 : 0] reg182;
input wire [31 : 0] reg183;
input wire [31 : 0] reg184;
input wire [31 : 0] reg185;
input wire [31 : 0] reg186;
input wire [31 : 0] reg187;
input wire [31 : 0] reg188;
input wire [31 : 0] reg189;
input wire [31 : 0] reg190;
input wire [31 : 0] reg191;
input wire [31 : 0] reg192;
input wire [31 : 0] reg193;
input wire [31 : 0] reg194;
input wire [31 : 0] reg195;
input wire [31 : 0] reg196;
input wire [31 : 0] reg197;
input wire [31 : 0] reg198;
input wire [31 : 0] reg199;
input wire [31 : 0] reg0;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 50000000, PHASE 0.000, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *)
input wire s00_axi_aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *)
input wire s00_axi_aresetn;

  myip_v2_0 #(
    .C_S00_AXI_DATA_WIDTH(32),  // Width of S_AXI data bus
    .C_S00_AXI_ADDR_WIDTH(10)  // Width of S_AXI address bus
  ) inst (
    .s00_axi_awaddr(s00_axi_awaddr),
    .s00_axi_awprot(s00_axi_awprot),
    .s00_axi_awvalid(s00_axi_awvalid),
    .s00_axi_awready(s00_axi_awready),
    .s00_axi_wdata(s00_axi_wdata),
    .s00_axi_wstrb(s00_axi_wstrb),
    .s00_axi_wvalid(s00_axi_wvalid),
    .s00_axi_wready(s00_axi_wready),
    .s00_axi_bresp(s00_axi_bresp),
    .s00_axi_bvalid(s00_axi_bvalid),
    .s00_axi_bready(s00_axi_bready),
    .s00_axi_araddr(s00_axi_araddr),
    .s00_axi_arprot(s00_axi_arprot),
    .s00_axi_arvalid(s00_axi_arvalid),
    .s00_axi_arready(s00_axi_arready),
    .s00_axi_rdata(s00_axi_rdata),
    .s00_axi_rresp(s00_axi_rresp),
    .s00_axi_rvalid(s00_axi_rvalid),
    .s00_axi_rready(s00_axi_rready),
    .reg1(reg1),
    .reg2(reg2),
    .reg3(reg3),
    .reg4(reg4),
    .reg5(reg5),
    .reg6(reg6),
    .reg7(reg7),
    .reg8(reg8),
    .reg9(reg9),
    .reg10(reg10),
    .reg11(reg11),
    .reg12(reg12),
    .reg13(reg13),
    .reg14(reg14),
    .reg15(reg15),
    .reg16(reg16),
    .reg17(reg17),
    .reg18(reg18),
    .reg19(reg19),
    .reg20(reg20),
    .reg21(reg21),
    .reg22(reg22),
    .reg23(reg23),
    .reg24(reg24),
    .reg25(reg25),
    .reg26(reg26),
    .reg27(reg27),
    .reg28(reg28),
    .reg29(reg29),
    .reg30(reg30),
    .reg31(reg31),
    .reg32(reg32),
    .reg33(reg33),
    .reg34(reg34),
    .reg35(reg35),
    .reg36(reg36),
    .reg37(reg37),
    .reg38(reg38),
    .reg39(reg39),
    .reg40(reg40),
    .reg41(reg41),
    .reg42(reg42),
    .reg43(reg43),
    .reg44(reg44),
    .reg45(reg45),
    .reg46(reg46),
    .reg47(reg47),
    .reg48(reg48),
    .reg49(reg49),
    .reg50(reg50),
    .reg51(reg51),
    .reg52(reg52),
    .reg53(reg53),
    .reg54(reg54),
    .reg55(reg55),
    .reg56(reg56),
    .reg57(reg57),
    .reg58(reg58),
    .reg59(reg59),
    .reg60(reg60),
    .reg61(reg61),
    .reg62(reg62),
    .reg63(reg63),
    .reg64(reg64),
    .reg65(reg65),
    .reg66(reg66),
    .reg67(reg67),
    .reg68(reg68),
    .reg69(reg69),
    .reg70(reg70),
    .reg71(reg71),
    .reg72(reg72),
    .reg73(reg73),
    .reg74(reg74),
    .reg75(reg75),
    .reg76(reg76),
    .reg77(reg77),
    .reg78(reg78),
    .reg79(reg79),
    .reg80(reg80),
    .reg81(reg81),
    .reg82(reg82),
    .reg83(reg83),
    .reg84(reg84),
    .reg85(reg85),
    .reg86(reg86),
    .reg87(reg87),
    .reg88(reg88),
    .reg89(reg89),
    .reg90(reg90),
    .reg91(reg91),
    .reg92(reg92),
    .reg93(reg93),
    .reg94(reg94),
    .reg95(reg95),
    .reg96(reg96),
    .reg97(reg97),
    .reg98(reg98),
    .reg99(reg99),
    .reg100(reg100),
    .reg101(reg101),
    .reg102(reg102),
    .reg103(reg103),
    .reg104(reg104),
    .reg105(reg105),
    .reg106(reg106),
    .reg107(reg107),
    .reg108(reg108),
    .reg109(reg109),
    .reg110(reg110),
    .reg111(reg111),
    .reg112(reg112),
    .reg113(reg113),
    .reg114(reg114),
    .reg115(reg115),
    .reg116(reg116),
    .reg117(reg117),
    .reg118(reg118),
    .reg119(reg119),
    .reg120(reg120),
    .reg121(reg121),
    .reg122(reg122),
    .reg123(reg123),
    .reg124(reg124),
    .reg125(reg125),
    .reg126(reg126),
    .reg127(reg127),
    .reg128(reg128),
    .reg129(reg129),
    .reg130(reg130),
    .reg131(reg131),
    .reg132(reg132),
    .reg133(reg133),
    .reg134(reg134),
    .reg135(reg135),
    .reg136(reg136),
    .reg137(reg137),
    .reg138(reg138),
    .reg139(reg139),
    .reg140(reg140),
    .reg141(reg141),
    .reg142(reg142),
    .reg143(reg143),
    .reg144(reg144),
    .reg145(reg145),
    .reg146(reg146),
    .reg147(reg147),
    .reg148(reg148),
    .reg149(reg149),
    .reg150(reg150),
    .reg151(reg151),
    .reg152(reg152),
    .reg153(reg153),
    .reg154(reg154),
    .reg155(reg155),
    .reg160(reg160),
    .reg161(reg161),
    .reg162(reg162),
    .reg163(reg163),
    .reg164(reg164),
    .reg165(reg165),
    .reg166(reg166),
    .reg167(reg167),
    .reg168(reg168),
    .reg169(reg169),
    .reg170(reg170),
    .reg171(reg171),
    .reg172(reg172),
    .reg173(reg173),
    .reg174(reg174),
    .reg175(reg175),
    .reg176(reg176),
    .reg177(reg177),
    .reg178(reg178),
    .reg179(reg179),
    .reg180(reg180),
    .reg181(reg181),
    .reg182(reg182),
    .reg183(reg183),
    .reg184(reg184),
    .reg185(reg185),
    .reg186(reg186),
    .reg187(reg187),
    .reg188(reg188),
    .reg189(reg189),
    .reg190(reg190),
    .reg191(reg191),
    .reg192(reg192),
    .reg193(reg193),
    .reg194(reg194),
    .reg195(reg195),
    .reg196(reg196),
    .reg197(reg197),
    .reg198(reg198),
    .reg199(reg199),
    .reg0(reg0),
    .s00_axi_aclk(s00_axi_aclk),
    .s00_axi_aresetn(s00_axi_aresetn)
  );
endmodule
