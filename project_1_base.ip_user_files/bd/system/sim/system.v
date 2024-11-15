//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
//Date        : Fri Oct 23 14:06:06 2020
//Host        : ICFC-C02ZC072JV3N running 64-bit major release  (build 9200)
//Command     : generate_target system.bd
//Design      : system
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module s00_couplers_imp_IK3G2O
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wid,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [3:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [3:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [11:0]S_AXI_wid;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_pc_to_s00_couplers_ARADDR;
  wire [2:0]auto_pc_to_s00_couplers_ARPROT;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [31:0]auto_pc_to_s00_couplers_AWADDR;
  wire [2:0]auto_pc_to_s00_couplers_AWPROT;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [31:0]auto_pc_to_s00_couplers_RDATA;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [3:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_auto_pc_ARADDR;
  wire [1:0]s00_couplers_to_auto_pc_ARBURST;
  wire [3:0]s00_couplers_to_auto_pc_ARCACHE;
  wire [11:0]s00_couplers_to_auto_pc_ARID;
  wire [3:0]s00_couplers_to_auto_pc_ARLEN;
  wire [1:0]s00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire [3:0]s00_couplers_to_auto_pc_ARQOS;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [2:0]s00_couplers_to_auto_pc_ARSIZE;
  wire s00_couplers_to_auto_pc_ARVALID;
  wire [31:0]s00_couplers_to_auto_pc_AWADDR;
  wire [1:0]s00_couplers_to_auto_pc_AWBURST;
  wire [3:0]s00_couplers_to_auto_pc_AWCACHE;
  wire [11:0]s00_couplers_to_auto_pc_AWID;
  wire [3:0]s00_couplers_to_auto_pc_AWLEN;
  wire [1:0]s00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_pc_AWPROT;
  wire [3:0]s00_couplers_to_auto_pc_AWQOS;
  wire s00_couplers_to_auto_pc_AWREADY;
  wire [2:0]s00_couplers_to_auto_pc_AWSIZE;
  wire s00_couplers_to_auto_pc_AWVALID;
  wire [11:0]s00_couplers_to_auto_pc_BID;
  wire s00_couplers_to_auto_pc_BREADY;
  wire [1:0]s00_couplers_to_auto_pc_BRESP;
  wire s00_couplers_to_auto_pc_BVALID;
  wire [31:0]s00_couplers_to_auto_pc_RDATA;
  wire [11:0]s00_couplers_to_auto_pc_RID;
  wire s00_couplers_to_auto_pc_RLAST;
  wire s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;
  wire [31:0]s00_couplers_to_auto_pc_WDATA;
  wire [11:0]s00_couplers_to_auto_pc_WID;
  wire s00_couplers_to_auto_pc_WLAST;
  wire s00_couplers_to_auto_pc_WREADY;
  wire [3:0]s00_couplers_to_auto_pc_WSTRB;
  wire s00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = auto_pc_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = auto_pc_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[11:0] = s00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[11:0] = s00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_pc_ARID = S_AXI_arid[11:0];
  assign s00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[3:0];
  assign s00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[1:0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_pc_AWID = S_AXI_awid[11:0];
  assign s00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[3:0];
  assign s00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[1:0];
  assign s00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_auto_pc_WID = S_AXI_wid[11:0];
  assign s00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  system_auto_pc_0 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arprot(auto_pc_to_s00_couplers_ARPROT),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awprot(auto_pc_to_s00_couplers_AWPROT),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(s00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arsize(s00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_pc_AWREADY),
        .s_axi_awsize(s00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_pc_BID),
        .s_axi_bready(s00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_pc_RID),
        .s_axi_rlast(s00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_pc_WDATA),
        .s_axi_wid(s00_couplers_to_auto_pc_WID),
        .s_axi_wlast(s00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_pc_WVALID));
endmodule

(* CORE_GENERATION_INFO = "system,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=system,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=6,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=2,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=3,da_ps7_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "system.hwdef" *) 
module system
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FCLK_CLK1,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    reg0,
    reg1,
    reg10,
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
    reg11,
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
    reg12,
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
    reg13,
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
    reg14,
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
    reg15,
    reg150,
    reg151,
    reg152,
    reg153,
    reg154,
    reg155,
    reg16,
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
    reg17,
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
    reg18,
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
    reg19,
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
    reg2,
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
    reg3,
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
    reg4,
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
    reg5,
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
    reg6,
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
    reg7,
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
    reg8,
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
    reg9,
    reg90,
    reg91,
    reg92,
    reg93,
    reg94,
    reg95,
    reg96,
    reg97,
    reg98,
    reg99);
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR, AXI_ARBITRATION_SCHEME TDM, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 11, CAS_WRITE_LATENCY 11, CS_ENABLED true, DATA_MASK_ENABLED true, DATA_WIDTH 8, MEMORY_TYPE COMPONENTS, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 1250" *) inout [14:0]DDR_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR BA" *) inout [2:0]DDR_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *) inout DDR_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *) inout DDR_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *) inout DDR_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CKE" *) inout DDR_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *) inout DDR_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DM" *) inout [3:0]DDR_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQ" *) inout [31:0]DDR_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *) inout [3:0]DDR_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *) inout [3:0]DDR_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ODT" *) inout DDR_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *) inout DDR_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *) inout DDR_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *) inout DDR_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.FCLK_CLK1 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.FCLK_CLK1, CLK_DOMAIN system_processing_system7_0_0_FCLK_CLK1, FREQ_HZ 200000000, PHASE 0.000" *) output FCLK_CLK1;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *) inout FIXED_IO_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *) inout FIXED_IO_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *) inout [53:0]FIXED_IO_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *) inout FIXED_IO_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *) inout FIXED_IO_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *) inout FIXED_IO_ps_srstb;
  input [31:0]reg0;
  output [31:0]reg1;
  output [31:0]reg10;
  output [31:0]reg100;
  output [31:0]reg101;
  output [31:0]reg102;
  output [31:0]reg103;
  output [31:0]reg104;
  output [31:0]reg105;
  output [31:0]reg106;
  output [31:0]reg107;
  output [31:0]reg108;
  output [31:0]reg109;
  output [31:0]reg11;
  output [31:0]reg110;
  output [31:0]reg111;
  output [31:0]reg112;
  output [31:0]reg113;
  output [31:0]reg114;
  output [31:0]reg115;
  output [31:0]reg116;
  output [31:0]reg117;
  output [31:0]reg118;
  output [31:0]reg119;
  output [31:0]reg12;
  output [31:0]reg120;
  output [31:0]reg121;
  output [31:0]reg122;
  output [31:0]reg123;
  output [31:0]reg124;
  output [31:0]reg125;
  output [31:0]reg126;
  output [31:0]reg127;
  output [31:0]reg128;
  output [31:0]reg129;
  output [31:0]reg13;
  output [31:0]reg130;
  output [31:0]reg131;
  output [31:0]reg132;
  output [31:0]reg133;
  output [31:0]reg134;
  output [31:0]reg135;
  output [31:0]reg136;
  output [31:0]reg137;
  output [31:0]reg138;
  output [31:0]reg139;
  output [31:0]reg14;
  output [31:0]reg140;
  output [31:0]reg141;
  output [31:0]reg142;
  output [31:0]reg143;
  output [31:0]reg144;
  output [31:0]reg145;
  output [31:0]reg146;
  output [31:0]reg147;
  output [31:0]reg148;
  output [31:0]reg149;
  output [31:0]reg15;
  output [31:0]reg150;
  output [31:0]reg151;
  output [31:0]reg152;
  output [31:0]reg153;
  output [31:0]reg154;
  output [31:0]reg155;
  output [31:0]reg16;
  input [31:0]reg160;
  input [31:0]reg161;
  input [31:0]reg162;
  input [31:0]reg163;
  input [31:0]reg164;
  input [31:0]reg165;
  input [31:0]reg166;
  input [31:0]reg167;
  input [31:0]reg168;
  input [31:0]reg169;
  output [31:0]reg17;
  input [31:0]reg170;
  input [31:0]reg171;
  input [31:0]reg172;
  input [31:0]reg173;
  input [31:0]reg174;
  input [31:0]reg175;
  input [31:0]reg176;
  input [31:0]reg177;
  input [31:0]reg178;
  input [31:0]reg179;
  output [31:0]reg18;
  input [31:0]reg180;
  input [31:0]reg181;
  input [31:0]reg182;
  input [31:0]reg183;
  input [31:0]reg184;
  input [31:0]reg185;
  input [31:0]reg186;
  input [31:0]reg187;
  input [31:0]reg188;
  input [31:0]reg189;
  output [31:0]reg19;
  input [31:0]reg190;
  input [31:0]reg191;
  input [31:0]reg192;
  input [31:0]reg193;
  input [31:0]reg194;
  input [31:0]reg195;
  input [31:0]reg196;
  input [31:0]reg197;
  input [31:0]reg198;
  input [31:0]reg199;
  output [31:0]reg2;
  output [31:0]reg20;
  output [31:0]reg21;
  output [31:0]reg22;
  output [31:0]reg23;
  output [31:0]reg24;
  output [31:0]reg25;
  output [31:0]reg26;
  output [31:0]reg27;
  output [31:0]reg28;
  output [31:0]reg29;
  output [31:0]reg3;
  output [31:0]reg30;
  output [31:0]reg31;
  output [31:0]reg32;
  output [31:0]reg33;
  output [31:0]reg34;
  output [31:0]reg35;
  output [31:0]reg36;
  output [31:0]reg37;
  output [31:0]reg38;
  output [31:0]reg39;
  output [31:0]reg4;
  output [31:0]reg40;
  output [31:0]reg41;
  output [31:0]reg42;
  output [31:0]reg43;
  output [31:0]reg44;
  output [31:0]reg45;
  output [31:0]reg46;
  output [31:0]reg47;
  output [31:0]reg48;
  output [31:0]reg49;
  output [31:0]reg5;
  output [31:0]reg50;
  output [31:0]reg51;
  output [31:0]reg52;
  output [31:0]reg53;
  output [31:0]reg54;
  output [31:0]reg55;
  output [31:0]reg56;
  output [31:0]reg57;
  output [31:0]reg58;
  output [31:0]reg59;
  output [31:0]reg6;
  output [31:0]reg60;
  output [31:0]reg61;
  output [31:0]reg62;
  output [31:0]reg63;
  output [31:0]reg64;
  output [31:0]reg65;
  output [31:0]reg66;
  output [31:0]reg67;
  output [31:0]reg68;
  output [31:0]reg69;
  output [31:0]reg7;
  output [31:0]reg70;
  output [31:0]reg71;
  output [31:0]reg72;
  output [31:0]reg73;
  output [31:0]reg74;
  output [31:0]reg75;
  output [31:0]reg76;
  output [31:0]reg77;
  output [31:0]reg78;
  output [31:0]reg79;
  output [31:0]reg8;
  output [31:0]reg80;
  output [31:0]reg81;
  output [31:0]reg82;
  output [31:0]reg83;
  output [31:0]reg84;
  output [31:0]reg85;
  output [31:0]reg86;
  output [31:0]reg87;
  output [31:0]reg88;
  output [31:0]reg89;
  output [31:0]reg9;
  output [31:0]reg90;
  output [31:0]reg91;
  output [31:0]reg92;
  output [31:0]reg93;
  output [31:0]reg94;
  output [31:0]reg95;
  output [31:0]reg96;
  output [31:0]reg97;
  output [31:0]reg98;
  output [31:0]reg99;

  wire [31:0]myip_0_reg1;
  wire [31:0]myip_0_reg10;
  wire [31:0]myip_0_reg100;
  wire [31:0]myip_0_reg101;
  wire [31:0]myip_0_reg102;
  wire [31:0]myip_0_reg103;
  wire [31:0]myip_0_reg104;
  wire [31:0]myip_0_reg105;
  wire [31:0]myip_0_reg106;
  wire [31:0]myip_0_reg107;
  wire [31:0]myip_0_reg108;
  wire [31:0]myip_0_reg109;
  wire [31:0]myip_0_reg11;
  wire [31:0]myip_0_reg110;
  wire [31:0]myip_0_reg111;
  wire [31:0]myip_0_reg112;
  wire [31:0]myip_0_reg113;
  wire [31:0]myip_0_reg114;
  wire [31:0]myip_0_reg115;
  wire [31:0]myip_0_reg116;
  wire [31:0]myip_0_reg117;
  wire [31:0]myip_0_reg118;
  wire [31:0]myip_0_reg119;
  wire [31:0]myip_0_reg12;
  wire [31:0]myip_0_reg120;
  wire [31:0]myip_0_reg121;
  wire [31:0]myip_0_reg122;
  wire [31:0]myip_0_reg123;
  wire [31:0]myip_0_reg124;
  wire [31:0]myip_0_reg125;
  wire [31:0]myip_0_reg126;
  wire [31:0]myip_0_reg127;
  wire [31:0]myip_0_reg128;
  wire [31:0]myip_0_reg129;
  wire [31:0]myip_0_reg13;
  wire [31:0]myip_0_reg130;
  wire [31:0]myip_0_reg131;
  wire [31:0]myip_0_reg132;
  wire [31:0]myip_0_reg133;
  wire [31:0]myip_0_reg134;
  wire [31:0]myip_0_reg135;
  wire [31:0]myip_0_reg136;
  wire [31:0]myip_0_reg137;
  wire [31:0]myip_0_reg138;
  wire [31:0]myip_0_reg139;
  wire [31:0]myip_0_reg14;
  wire [31:0]myip_0_reg140;
  wire [31:0]myip_0_reg141;
  wire [31:0]myip_0_reg142;
  wire [31:0]myip_0_reg143;
  wire [31:0]myip_0_reg144;
  wire [31:0]myip_0_reg145;
  wire [31:0]myip_0_reg146;
  wire [31:0]myip_0_reg147;
  wire [31:0]myip_0_reg148;
  wire [31:0]myip_0_reg149;
  wire [31:0]myip_0_reg15;
  wire [31:0]myip_0_reg150;
  wire [31:0]myip_0_reg151;
  wire [31:0]myip_0_reg152;
  wire [31:0]myip_0_reg153;
  wire [31:0]myip_0_reg154;
  wire [31:0]myip_0_reg155;
  wire [31:0]myip_0_reg16;
  wire [31:0]myip_0_reg17;
  wire [31:0]myip_0_reg18;
  wire [31:0]myip_0_reg19;
  wire [31:0]myip_0_reg2;
  wire [31:0]myip_0_reg20;
  wire [31:0]myip_0_reg21;
  wire [31:0]myip_0_reg22;
  wire [31:0]myip_0_reg23;
  wire [31:0]myip_0_reg24;
  wire [31:0]myip_0_reg25;
  wire [31:0]myip_0_reg26;
  wire [31:0]myip_0_reg27;
  wire [31:0]myip_0_reg28;
  wire [31:0]myip_0_reg29;
  wire [31:0]myip_0_reg3;
  wire [31:0]myip_0_reg30;
  wire [31:0]myip_0_reg31;
  wire [31:0]myip_0_reg32;
  wire [31:0]myip_0_reg33;
  wire [31:0]myip_0_reg34;
  wire [31:0]myip_0_reg35;
  wire [31:0]myip_0_reg36;
  wire [31:0]myip_0_reg37;
  wire [31:0]myip_0_reg38;
  wire [31:0]myip_0_reg39;
  wire [31:0]myip_0_reg4;
  wire [31:0]myip_0_reg40;
  wire [31:0]myip_0_reg41;
  wire [31:0]myip_0_reg42;
  wire [31:0]myip_0_reg43;
  wire [31:0]myip_0_reg44;
  wire [31:0]myip_0_reg45;
  wire [31:0]myip_0_reg46;
  wire [31:0]myip_0_reg47;
  wire [31:0]myip_0_reg48;
  wire [31:0]myip_0_reg49;
  wire [31:0]myip_0_reg5;
  wire [31:0]myip_0_reg50;
  wire [31:0]myip_0_reg51;
  wire [31:0]myip_0_reg52;
  wire [31:0]myip_0_reg53;
  wire [31:0]myip_0_reg54;
  wire [31:0]myip_0_reg55;
  wire [31:0]myip_0_reg56;
  wire [31:0]myip_0_reg57;
  wire [31:0]myip_0_reg58;
  wire [31:0]myip_0_reg59;
  wire [31:0]myip_0_reg6;
  wire [31:0]myip_0_reg60;
  wire [31:0]myip_0_reg61;
  wire [31:0]myip_0_reg62;
  wire [31:0]myip_0_reg63;
  wire [31:0]myip_0_reg64;
  wire [31:0]myip_0_reg65;
  wire [31:0]myip_0_reg66;
  wire [31:0]myip_0_reg67;
  wire [31:0]myip_0_reg68;
  wire [31:0]myip_0_reg69;
  wire [31:0]myip_0_reg7;
  wire [31:0]myip_0_reg70;
  wire [31:0]myip_0_reg71;
  wire [31:0]myip_0_reg72;
  wire [31:0]myip_0_reg73;
  wire [31:0]myip_0_reg74;
  wire [31:0]myip_0_reg75;
  wire [31:0]myip_0_reg76;
  wire [31:0]myip_0_reg77;
  wire [31:0]myip_0_reg78;
  wire [31:0]myip_0_reg79;
  wire [31:0]myip_0_reg8;
  wire [31:0]myip_0_reg80;
  wire [31:0]myip_0_reg81;
  wire [31:0]myip_0_reg82;
  wire [31:0]myip_0_reg83;
  wire [31:0]myip_0_reg84;
  wire [31:0]myip_0_reg85;
  wire [31:0]myip_0_reg86;
  wire [31:0]myip_0_reg87;
  wire [31:0]myip_0_reg88;
  wire [31:0]myip_0_reg89;
  wire [31:0]myip_0_reg9;
  wire [31:0]myip_0_reg90;
  wire [31:0]myip_0_reg91;
  wire [31:0]myip_0_reg92;
  wire [31:0]myip_0_reg93;
  wire [31:0]myip_0_reg94;
  wire [31:0]myip_0_reg95;
  wire [31:0]myip_0_reg96;
  wire [31:0]myip_0_reg97;
  wire [31:0]myip_0_reg98;
  wire [31:0]myip_0_reg99;
  wire [14:0]processing_system7_0_DDR_ADDR;
  wire [2:0]processing_system7_0_DDR_BA;
  wire processing_system7_0_DDR_CAS_N;
  wire processing_system7_0_DDR_CKE;
  wire processing_system7_0_DDR_CK_N;
  wire processing_system7_0_DDR_CK_P;
  wire processing_system7_0_DDR_CS_N;
  wire [3:0]processing_system7_0_DDR_DM;
  wire [31:0]processing_system7_0_DDR_DQ;
  wire [3:0]processing_system7_0_DDR_DQS_N;
  wire [3:0]processing_system7_0_DDR_DQS_P;
  wire processing_system7_0_DDR_ODT;
  wire processing_system7_0_DDR_RAS_N;
  wire processing_system7_0_DDR_RESET_N;
  wire processing_system7_0_DDR_WE_N;
  wire processing_system7_0_FCLK_CLK0;
  wire processing_system7_0_FCLK_CLK1;
  wire processing_system7_0_FCLK_RESET0_N;
  wire processing_system7_0_FIXED_IO_DDR_VRN;
  wire processing_system7_0_FIXED_IO_DDR_VRP;
  wire [53:0]processing_system7_0_FIXED_IO_MIO;
  wire processing_system7_0_FIXED_IO_PS_CLK;
  wire processing_system7_0_FIXED_IO_PS_PORB;
  wire processing_system7_0_FIXED_IO_PS_SRSTB;
  wire [31:0]processing_system7_0_M_AXI_GP0_ARADDR;
  wire [1:0]processing_system7_0_M_AXI_GP0_ARBURST;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP0_ARID;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARLEN;
  wire [1:0]processing_system7_0_M_AXI_GP0_ARLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP0_ARPROT;
  wire [3:0]processing_system7_0_M_AXI_GP0_ARQOS;
  wire processing_system7_0_M_AXI_GP0_ARREADY;
  wire [2:0]processing_system7_0_M_AXI_GP0_ARSIZE;
  wire processing_system7_0_M_AXI_GP0_ARVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_AWADDR;
  wire [1:0]processing_system7_0_M_AXI_GP0_AWBURST;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWCACHE;
  wire [11:0]processing_system7_0_M_AXI_GP0_AWID;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWLEN;
  wire [1:0]processing_system7_0_M_AXI_GP0_AWLOCK;
  wire [2:0]processing_system7_0_M_AXI_GP0_AWPROT;
  wire [3:0]processing_system7_0_M_AXI_GP0_AWQOS;
  wire processing_system7_0_M_AXI_GP0_AWREADY;
  wire [2:0]processing_system7_0_M_AXI_GP0_AWSIZE;
  wire processing_system7_0_M_AXI_GP0_AWVALID;
  wire [11:0]processing_system7_0_M_AXI_GP0_BID;
  wire processing_system7_0_M_AXI_GP0_BREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_BRESP;
  wire processing_system7_0_M_AXI_GP0_BVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_RDATA;
  wire [11:0]processing_system7_0_M_AXI_GP0_RID;
  wire processing_system7_0_M_AXI_GP0_RLAST;
  wire processing_system7_0_M_AXI_GP0_RREADY;
  wire [1:0]processing_system7_0_M_AXI_GP0_RRESP;
  wire processing_system7_0_M_AXI_GP0_RVALID;
  wire [31:0]processing_system7_0_M_AXI_GP0_WDATA;
  wire [11:0]processing_system7_0_M_AXI_GP0_WID;
  wire processing_system7_0_M_AXI_GP0_WLAST;
  wire processing_system7_0_M_AXI_GP0_WREADY;
  wire [3:0]processing_system7_0_M_AXI_GP0_WSTRB;
  wire processing_system7_0_M_AXI_GP0_WVALID;
  wire [31:0]processing_system7_0_axi_periph_M00_AXI_ARADDR;
  wire [2:0]processing_system7_0_axi_periph_M00_AXI_ARPROT;
  wire processing_system7_0_axi_periph_M00_AXI_ARREADY;
  wire processing_system7_0_axi_periph_M00_AXI_ARVALID;
  wire [31:0]processing_system7_0_axi_periph_M00_AXI_AWADDR;
  wire [2:0]processing_system7_0_axi_periph_M00_AXI_AWPROT;
  wire processing_system7_0_axi_periph_M00_AXI_AWREADY;
  wire processing_system7_0_axi_periph_M00_AXI_AWVALID;
  wire processing_system7_0_axi_periph_M00_AXI_BREADY;
  wire [1:0]processing_system7_0_axi_periph_M00_AXI_BRESP;
  wire processing_system7_0_axi_periph_M00_AXI_BVALID;
  wire [31:0]processing_system7_0_axi_periph_M00_AXI_RDATA;
  wire processing_system7_0_axi_periph_M00_AXI_RREADY;
  wire [1:0]processing_system7_0_axi_periph_M00_AXI_RRESP;
  wire processing_system7_0_axi_periph_M00_AXI_RVALID;
  wire [31:0]processing_system7_0_axi_periph_M00_AXI_WDATA;
  wire processing_system7_0_axi_periph_M00_AXI_WREADY;
  wire [3:0]processing_system7_0_axi_periph_M00_AXI_WSTRB;
  wire processing_system7_0_axi_periph_M00_AXI_WVALID;
  wire [31:0]reg0_1;
  wire [31:0]reg160_1;
  wire [31:0]reg161_1;
  wire [31:0]reg162_1;
  wire [31:0]reg163_1;
  wire [31:0]reg164_1;
  wire [31:0]reg165_1;
  wire [31:0]reg166_1;
  wire [31:0]reg167_1;
  wire [31:0]reg168_1;
  wire [31:0]reg169_1;
  wire [31:0]reg170_1;
  wire [31:0]reg171_1;
  wire [31:0]reg172_1;
  wire [31:0]reg173_1;
  wire [31:0]reg174_1;
  wire [31:0]reg175_1;
  wire [31:0]reg176_1;
  wire [31:0]reg177_1;
  wire [31:0]reg178_1;
  wire [31:0]reg179_1;
  wire [31:0]reg180_1;
  wire [31:0]reg181_1;
  wire [31:0]reg182_1;
  wire [31:0]reg183_1;
  wire [31:0]reg184_1;
  wire [31:0]reg185_1;
  wire [31:0]reg186_1;
  wire [31:0]reg187_1;
  wire [31:0]reg188_1;
  wire [31:0]reg189_1;
  wire [31:0]reg190_1;
  wire [31:0]reg191_1;
  wire [31:0]reg192_1;
  wire [31:0]reg193_1;
  wire [31:0]reg194_1;
  wire [31:0]reg195_1;
  wire [31:0]reg196_1;
  wire [31:0]reg197_1;
  wire [31:0]reg198_1;
  wire [31:0]reg199_1;
  wire [0:0]rst_processing_system7_0_50M_interconnect_aresetn;
  wire [0:0]rst_processing_system7_0_50M_peripheral_aresetn;

  assign FCLK_CLK1 = processing_system7_0_FCLK_CLK1;
  assign reg0_1 = reg0[31:0];
  assign reg1[31:0] = myip_0_reg1;
  assign reg10[31:0] = myip_0_reg10;
  assign reg100[31:0] = myip_0_reg100;
  assign reg101[31:0] = myip_0_reg101;
  assign reg102[31:0] = myip_0_reg102;
  assign reg103[31:0] = myip_0_reg103;
  assign reg104[31:0] = myip_0_reg104;
  assign reg105[31:0] = myip_0_reg105;
  assign reg106[31:0] = myip_0_reg106;
  assign reg107[31:0] = myip_0_reg107;
  assign reg108[31:0] = myip_0_reg108;
  assign reg109[31:0] = myip_0_reg109;
  assign reg11[31:0] = myip_0_reg11;
  assign reg110[31:0] = myip_0_reg110;
  assign reg111[31:0] = myip_0_reg111;
  assign reg112[31:0] = myip_0_reg112;
  assign reg113[31:0] = myip_0_reg113;
  assign reg114[31:0] = myip_0_reg114;
  assign reg115[31:0] = myip_0_reg115;
  assign reg116[31:0] = myip_0_reg116;
  assign reg117[31:0] = myip_0_reg117;
  assign reg118[31:0] = myip_0_reg118;
  assign reg119[31:0] = myip_0_reg119;
  assign reg12[31:0] = myip_0_reg12;
  assign reg120[31:0] = myip_0_reg120;
  assign reg121[31:0] = myip_0_reg121;
  assign reg122[31:0] = myip_0_reg122;
  assign reg123[31:0] = myip_0_reg123;
  assign reg124[31:0] = myip_0_reg124;
  assign reg125[31:0] = myip_0_reg125;
  assign reg126[31:0] = myip_0_reg126;
  assign reg127[31:0] = myip_0_reg127;
  assign reg128[31:0] = myip_0_reg128;
  assign reg129[31:0] = myip_0_reg129;
  assign reg13[31:0] = myip_0_reg13;
  assign reg130[31:0] = myip_0_reg130;
  assign reg131[31:0] = myip_0_reg131;
  assign reg132[31:0] = myip_0_reg132;
  assign reg133[31:0] = myip_0_reg133;
  assign reg134[31:0] = myip_0_reg134;
  assign reg135[31:0] = myip_0_reg135;
  assign reg136[31:0] = myip_0_reg136;
  assign reg137[31:0] = myip_0_reg137;
  assign reg138[31:0] = myip_0_reg138;
  assign reg139[31:0] = myip_0_reg139;
  assign reg14[31:0] = myip_0_reg14;
  assign reg140[31:0] = myip_0_reg140;
  assign reg141[31:0] = myip_0_reg141;
  assign reg142[31:0] = myip_0_reg142;
  assign reg143[31:0] = myip_0_reg143;
  assign reg144[31:0] = myip_0_reg144;
  assign reg145[31:0] = myip_0_reg145;
  assign reg146[31:0] = myip_0_reg146;
  assign reg147[31:0] = myip_0_reg147;
  assign reg148[31:0] = myip_0_reg148;
  assign reg149[31:0] = myip_0_reg149;
  assign reg15[31:0] = myip_0_reg15;
  assign reg150[31:0] = myip_0_reg150;
  assign reg151[31:0] = myip_0_reg151;
  assign reg152[31:0] = myip_0_reg152;
  assign reg153[31:0] = myip_0_reg153;
  assign reg154[31:0] = myip_0_reg154;
  assign reg155[31:0] = myip_0_reg155;
  assign reg16[31:0] = myip_0_reg16;
  assign reg160_1 = reg160[31:0];
  assign reg161_1 = reg161[31:0];
  assign reg162_1 = reg162[31:0];
  assign reg163_1 = reg163[31:0];
  assign reg164_1 = reg164[31:0];
  assign reg165_1 = reg165[31:0];
  assign reg166_1 = reg166[31:0];
  assign reg167_1 = reg167[31:0];
  assign reg168_1 = reg168[31:0];
  assign reg169_1 = reg169[31:0];
  assign reg17[31:0] = myip_0_reg17;
  assign reg170_1 = reg170[31:0];
  assign reg171_1 = reg171[31:0];
  assign reg172_1 = reg172[31:0];
  assign reg173_1 = reg173[31:0];
  assign reg174_1 = reg174[31:0];
  assign reg175_1 = reg175[31:0];
  assign reg176_1 = reg176[31:0];
  assign reg177_1 = reg177[31:0];
  assign reg178_1 = reg178[31:0];
  assign reg179_1 = reg179[31:0];
  assign reg18[31:0] = myip_0_reg18;
  assign reg180_1 = reg180[31:0];
  assign reg181_1 = reg181[31:0];
  assign reg182_1 = reg182[31:0];
  assign reg183_1 = reg183[31:0];
  assign reg184_1 = reg184[31:0];
  assign reg185_1 = reg185[31:0];
  assign reg186_1 = reg186[31:0];
  assign reg187_1 = reg187[31:0];
  assign reg188_1 = reg188[31:0];
  assign reg189_1 = reg189[31:0];
  assign reg19[31:0] = myip_0_reg19;
  assign reg190_1 = reg190[31:0];
  assign reg191_1 = reg191[31:0];
  assign reg192_1 = reg192[31:0];
  assign reg193_1 = reg193[31:0];
  assign reg194_1 = reg194[31:0];
  assign reg195_1 = reg195[31:0];
  assign reg196_1 = reg196[31:0];
  assign reg197_1 = reg197[31:0];
  assign reg198_1 = reg198[31:0];
  assign reg199_1 = reg199[31:0];
  assign reg2[31:0] = myip_0_reg2;
  assign reg20[31:0] = myip_0_reg20;
  assign reg21[31:0] = myip_0_reg21;
  assign reg22[31:0] = myip_0_reg22;
  assign reg23[31:0] = myip_0_reg23;
  assign reg24[31:0] = myip_0_reg24;
  assign reg25[31:0] = myip_0_reg25;
  assign reg26[31:0] = myip_0_reg26;
  assign reg27[31:0] = myip_0_reg27;
  assign reg28[31:0] = myip_0_reg28;
  assign reg29[31:0] = myip_0_reg29;
  assign reg3[31:0] = myip_0_reg3;
  assign reg30[31:0] = myip_0_reg30;
  assign reg31[31:0] = myip_0_reg31;
  assign reg32[31:0] = myip_0_reg32;
  assign reg33[31:0] = myip_0_reg33;
  assign reg34[31:0] = myip_0_reg34;
  assign reg35[31:0] = myip_0_reg35;
  assign reg36[31:0] = myip_0_reg36;
  assign reg37[31:0] = myip_0_reg37;
  assign reg38[31:0] = myip_0_reg38;
  assign reg39[31:0] = myip_0_reg39;
  assign reg4[31:0] = myip_0_reg4;
  assign reg40[31:0] = myip_0_reg40;
  assign reg41[31:0] = myip_0_reg41;
  assign reg42[31:0] = myip_0_reg42;
  assign reg43[31:0] = myip_0_reg43;
  assign reg44[31:0] = myip_0_reg44;
  assign reg45[31:0] = myip_0_reg45;
  assign reg46[31:0] = myip_0_reg46;
  assign reg47[31:0] = myip_0_reg47;
  assign reg48[31:0] = myip_0_reg48;
  assign reg49[31:0] = myip_0_reg49;
  assign reg5[31:0] = myip_0_reg5;
  assign reg50[31:0] = myip_0_reg50;
  assign reg51[31:0] = myip_0_reg51;
  assign reg52[31:0] = myip_0_reg52;
  assign reg53[31:0] = myip_0_reg53;
  assign reg54[31:0] = myip_0_reg54;
  assign reg55[31:0] = myip_0_reg55;
  assign reg56[31:0] = myip_0_reg56;
  assign reg57[31:0] = myip_0_reg57;
  assign reg58[31:0] = myip_0_reg58;
  assign reg59[31:0] = myip_0_reg59;
  assign reg6[31:0] = myip_0_reg6;
  assign reg60[31:0] = myip_0_reg60;
  assign reg61[31:0] = myip_0_reg61;
  assign reg62[31:0] = myip_0_reg62;
  assign reg63[31:0] = myip_0_reg63;
  assign reg64[31:0] = myip_0_reg64;
  assign reg65[31:0] = myip_0_reg65;
  assign reg66[31:0] = myip_0_reg66;
  assign reg67[31:0] = myip_0_reg67;
  assign reg68[31:0] = myip_0_reg68;
  assign reg69[31:0] = myip_0_reg69;
  assign reg7[31:0] = myip_0_reg7;
  assign reg70[31:0] = myip_0_reg70;
  assign reg71[31:0] = myip_0_reg71;
  assign reg72[31:0] = myip_0_reg72;
  assign reg73[31:0] = myip_0_reg73;
  assign reg74[31:0] = myip_0_reg74;
  assign reg75[31:0] = myip_0_reg75;
  assign reg76[31:0] = myip_0_reg76;
  assign reg77[31:0] = myip_0_reg77;
  assign reg78[31:0] = myip_0_reg78;
  assign reg79[31:0] = myip_0_reg79;
  assign reg8[31:0] = myip_0_reg8;
  assign reg80[31:0] = myip_0_reg80;
  assign reg81[31:0] = myip_0_reg81;
  assign reg82[31:0] = myip_0_reg82;
  assign reg83[31:0] = myip_0_reg83;
  assign reg84[31:0] = myip_0_reg84;
  assign reg85[31:0] = myip_0_reg85;
  assign reg86[31:0] = myip_0_reg86;
  assign reg87[31:0] = myip_0_reg87;
  assign reg88[31:0] = myip_0_reg88;
  assign reg89[31:0] = myip_0_reg89;
  assign reg9[31:0] = myip_0_reg9;
  assign reg90[31:0] = myip_0_reg90;
  assign reg91[31:0] = myip_0_reg91;
  assign reg92[31:0] = myip_0_reg92;
  assign reg93[31:0] = myip_0_reg93;
  assign reg94[31:0] = myip_0_reg94;
  assign reg95[31:0] = myip_0_reg95;
  assign reg96[31:0] = myip_0_reg96;
  assign reg97[31:0] = myip_0_reg97;
  assign reg98[31:0] = myip_0_reg98;
  assign reg99[31:0] = myip_0_reg99;
  system_myip_0_0 myip_0
       (.reg0(reg0_1),
        .reg1(myip_0_reg1),
        .reg10(myip_0_reg10),
        .reg100(myip_0_reg100),
        .reg101(myip_0_reg101),
        .reg102(myip_0_reg102),
        .reg103(myip_0_reg103),
        .reg104(myip_0_reg104),
        .reg105(myip_0_reg105),
        .reg106(myip_0_reg106),
        .reg107(myip_0_reg107),
        .reg108(myip_0_reg108),
        .reg109(myip_0_reg109),
        .reg11(myip_0_reg11),
        .reg110(myip_0_reg110),
        .reg111(myip_0_reg111),
        .reg112(myip_0_reg112),
        .reg113(myip_0_reg113),
        .reg114(myip_0_reg114),
        .reg115(myip_0_reg115),
        .reg116(myip_0_reg116),
        .reg117(myip_0_reg117),
        .reg118(myip_0_reg118),
        .reg119(myip_0_reg119),
        .reg12(myip_0_reg12),
        .reg120(myip_0_reg120),
        .reg121(myip_0_reg121),
        .reg122(myip_0_reg122),
        .reg123(myip_0_reg123),
        .reg124(myip_0_reg124),
        .reg125(myip_0_reg125),
        .reg126(myip_0_reg126),
        .reg127(myip_0_reg127),
        .reg128(myip_0_reg128),
        .reg129(myip_0_reg129),
        .reg13(myip_0_reg13),
        .reg130(myip_0_reg130),
        .reg131(myip_0_reg131),
        .reg132(myip_0_reg132),
        .reg133(myip_0_reg133),
        .reg134(myip_0_reg134),
        .reg135(myip_0_reg135),
        .reg136(myip_0_reg136),
        .reg137(myip_0_reg137),
        .reg138(myip_0_reg138),
        .reg139(myip_0_reg139),
        .reg14(myip_0_reg14),
        .reg140(myip_0_reg140),
        .reg141(myip_0_reg141),
        .reg142(myip_0_reg142),
        .reg143(myip_0_reg143),
        .reg144(myip_0_reg144),
        .reg145(myip_0_reg145),
        .reg146(myip_0_reg146),
        .reg147(myip_0_reg147),
        .reg148(myip_0_reg148),
        .reg149(myip_0_reg149),
        .reg15(myip_0_reg15),
        .reg150(myip_0_reg150),
        .reg151(myip_0_reg151),
        .reg152(myip_0_reg152),
        .reg153(myip_0_reg153),
        .reg154(myip_0_reg154),
        .reg155(myip_0_reg155),
        .reg16(myip_0_reg16),
        .reg160(reg160_1),
        .reg161(reg161_1),
        .reg162(reg162_1),
        .reg163(reg163_1),
        .reg164(reg164_1),
        .reg165(reg165_1),
        .reg166(reg166_1),
        .reg167(reg167_1),
        .reg168(reg168_1),
        .reg169(reg169_1),
        .reg17(myip_0_reg17),
        .reg170(reg170_1),
        .reg171(reg171_1),
        .reg172(reg172_1),
        .reg173(reg173_1),
        .reg174(reg174_1),
        .reg175(reg175_1),
        .reg176(reg176_1),
        .reg177(reg177_1),
        .reg178(reg178_1),
        .reg179(reg179_1),
        .reg18(myip_0_reg18),
        .reg180(reg180_1),
        .reg181(reg181_1),
        .reg182(reg182_1),
        .reg183(reg183_1),
        .reg184(reg184_1),
        .reg185(reg185_1),
        .reg186(reg186_1),
        .reg187(reg187_1),
        .reg188(reg188_1),
        .reg189(reg189_1),
        .reg19(myip_0_reg19),
        .reg190(reg190_1),
        .reg191(reg191_1),
        .reg192(reg192_1),
        .reg193(reg193_1),
        .reg194(reg194_1),
        .reg195(reg195_1),
        .reg196(reg196_1),
        .reg197(reg197_1),
        .reg198(reg198_1),
        .reg199(reg199_1),
        .reg2(myip_0_reg2),
        .reg20(myip_0_reg20),
        .reg21(myip_0_reg21),
        .reg22(myip_0_reg22),
        .reg23(myip_0_reg23),
        .reg24(myip_0_reg24),
        .reg25(myip_0_reg25),
        .reg26(myip_0_reg26),
        .reg27(myip_0_reg27),
        .reg28(myip_0_reg28),
        .reg29(myip_0_reg29),
        .reg3(myip_0_reg3),
        .reg30(myip_0_reg30),
        .reg31(myip_0_reg31),
        .reg32(myip_0_reg32),
        .reg33(myip_0_reg33),
        .reg34(myip_0_reg34),
        .reg35(myip_0_reg35),
        .reg36(myip_0_reg36),
        .reg37(myip_0_reg37),
        .reg38(myip_0_reg38),
        .reg39(myip_0_reg39),
        .reg4(myip_0_reg4),
        .reg40(myip_0_reg40),
        .reg41(myip_0_reg41),
        .reg42(myip_0_reg42),
        .reg43(myip_0_reg43),
        .reg44(myip_0_reg44),
        .reg45(myip_0_reg45),
        .reg46(myip_0_reg46),
        .reg47(myip_0_reg47),
        .reg48(myip_0_reg48),
        .reg49(myip_0_reg49),
        .reg5(myip_0_reg5),
        .reg50(myip_0_reg50),
        .reg51(myip_0_reg51),
        .reg52(myip_0_reg52),
        .reg53(myip_0_reg53),
        .reg54(myip_0_reg54),
        .reg55(myip_0_reg55),
        .reg56(myip_0_reg56),
        .reg57(myip_0_reg57),
        .reg58(myip_0_reg58),
        .reg59(myip_0_reg59),
        .reg6(myip_0_reg6),
        .reg60(myip_0_reg60),
        .reg61(myip_0_reg61),
        .reg62(myip_0_reg62),
        .reg63(myip_0_reg63),
        .reg64(myip_0_reg64),
        .reg65(myip_0_reg65),
        .reg66(myip_0_reg66),
        .reg67(myip_0_reg67),
        .reg68(myip_0_reg68),
        .reg69(myip_0_reg69),
        .reg7(myip_0_reg7),
        .reg70(myip_0_reg70),
        .reg71(myip_0_reg71),
        .reg72(myip_0_reg72),
        .reg73(myip_0_reg73),
        .reg74(myip_0_reg74),
        .reg75(myip_0_reg75),
        .reg76(myip_0_reg76),
        .reg77(myip_0_reg77),
        .reg78(myip_0_reg78),
        .reg79(myip_0_reg79),
        .reg8(myip_0_reg8),
        .reg80(myip_0_reg80),
        .reg81(myip_0_reg81),
        .reg82(myip_0_reg82),
        .reg83(myip_0_reg83),
        .reg84(myip_0_reg84),
        .reg85(myip_0_reg85),
        .reg86(myip_0_reg86),
        .reg87(myip_0_reg87),
        .reg88(myip_0_reg88),
        .reg89(myip_0_reg89),
        .reg9(myip_0_reg9),
        .reg90(myip_0_reg90),
        .reg91(myip_0_reg91),
        .reg92(myip_0_reg92),
        .reg93(myip_0_reg93),
        .reg94(myip_0_reg94),
        .reg95(myip_0_reg95),
        .reg96(myip_0_reg96),
        .reg97(myip_0_reg97),
        .reg98(myip_0_reg98),
        .reg99(myip_0_reg99),
        .s00_axi_aclk(processing_system7_0_FCLK_CLK0),
        .s00_axi_araddr(processing_system7_0_axi_periph_M00_AXI_ARADDR[9:0]),
        .s00_axi_aresetn(rst_processing_system7_0_50M_peripheral_aresetn),
        .s00_axi_arprot(processing_system7_0_axi_periph_M00_AXI_ARPROT),
        .s00_axi_arready(processing_system7_0_axi_periph_M00_AXI_ARREADY),
        .s00_axi_arvalid(processing_system7_0_axi_periph_M00_AXI_ARVALID),
        .s00_axi_awaddr(processing_system7_0_axi_periph_M00_AXI_AWADDR[9:0]),
        .s00_axi_awprot(processing_system7_0_axi_periph_M00_AXI_AWPROT),
        .s00_axi_awready(processing_system7_0_axi_periph_M00_AXI_AWREADY),
        .s00_axi_awvalid(processing_system7_0_axi_periph_M00_AXI_AWVALID),
        .s00_axi_bready(processing_system7_0_axi_periph_M00_AXI_BREADY),
        .s00_axi_bresp(processing_system7_0_axi_periph_M00_AXI_BRESP),
        .s00_axi_bvalid(processing_system7_0_axi_periph_M00_AXI_BVALID),
        .s00_axi_rdata(processing_system7_0_axi_periph_M00_AXI_RDATA),
        .s00_axi_rready(processing_system7_0_axi_periph_M00_AXI_RREADY),
        .s00_axi_rresp(processing_system7_0_axi_periph_M00_AXI_RRESP),
        .s00_axi_rvalid(processing_system7_0_axi_periph_M00_AXI_RVALID),
        .s00_axi_wdata(processing_system7_0_axi_periph_M00_AXI_WDATA),
        .s00_axi_wready(processing_system7_0_axi_periph_M00_AXI_WREADY),
        .s00_axi_wstrb(processing_system7_0_axi_periph_M00_AXI_WSTRB),
        .s00_axi_wvalid(processing_system7_0_axi_periph_M00_AXI_WVALID));
  system_processing_system7_0_0 processing_system7_0
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(processing_system7_0_FCLK_CLK0),
        .FCLK_CLK1(processing_system7_0_FCLK_CLK1),
        .FCLK_RESET0_N(processing_system7_0_FCLK_RESET0_N),
        .MIO(FIXED_IO_mio[53:0]),
        .M_AXI_GP0_ACLK(processing_system7_0_FCLK_CLK0),
        .M_AXI_GP0_ARADDR(processing_system7_0_M_AXI_GP0_ARADDR),
        .M_AXI_GP0_ARBURST(processing_system7_0_M_AXI_GP0_ARBURST),
        .M_AXI_GP0_ARCACHE(processing_system7_0_M_AXI_GP0_ARCACHE),
        .M_AXI_GP0_ARID(processing_system7_0_M_AXI_GP0_ARID),
        .M_AXI_GP0_ARLEN(processing_system7_0_M_AXI_GP0_ARLEN),
        .M_AXI_GP0_ARLOCK(processing_system7_0_M_AXI_GP0_ARLOCK),
        .M_AXI_GP0_ARPROT(processing_system7_0_M_AXI_GP0_ARPROT),
        .M_AXI_GP0_ARQOS(processing_system7_0_M_AXI_GP0_ARQOS),
        .M_AXI_GP0_ARREADY(processing_system7_0_M_AXI_GP0_ARREADY),
        .M_AXI_GP0_ARSIZE(processing_system7_0_M_AXI_GP0_ARSIZE),
        .M_AXI_GP0_ARVALID(processing_system7_0_M_AXI_GP0_ARVALID),
        .M_AXI_GP0_AWADDR(processing_system7_0_M_AXI_GP0_AWADDR),
        .M_AXI_GP0_AWBURST(processing_system7_0_M_AXI_GP0_AWBURST),
        .M_AXI_GP0_AWCACHE(processing_system7_0_M_AXI_GP0_AWCACHE),
        .M_AXI_GP0_AWID(processing_system7_0_M_AXI_GP0_AWID),
        .M_AXI_GP0_AWLEN(processing_system7_0_M_AXI_GP0_AWLEN),
        .M_AXI_GP0_AWLOCK(processing_system7_0_M_AXI_GP0_AWLOCK),
        .M_AXI_GP0_AWPROT(processing_system7_0_M_AXI_GP0_AWPROT),
        .M_AXI_GP0_AWQOS(processing_system7_0_M_AXI_GP0_AWQOS),
        .M_AXI_GP0_AWREADY(processing_system7_0_M_AXI_GP0_AWREADY),
        .M_AXI_GP0_AWSIZE(processing_system7_0_M_AXI_GP0_AWSIZE),
        .M_AXI_GP0_AWVALID(processing_system7_0_M_AXI_GP0_AWVALID),
        .M_AXI_GP0_BID(processing_system7_0_M_AXI_GP0_BID),
        .M_AXI_GP0_BREADY(processing_system7_0_M_AXI_GP0_BREADY),
        .M_AXI_GP0_BRESP(processing_system7_0_M_AXI_GP0_BRESP),
        .M_AXI_GP0_BVALID(processing_system7_0_M_AXI_GP0_BVALID),
        .M_AXI_GP0_RDATA(processing_system7_0_M_AXI_GP0_RDATA),
        .M_AXI_GP0_RID(processing_system7_0_M_AXI_GP0_RID),
        .M_AXI_GP0_RLAST(processing_system7_0_M_AXI_GP0_RLAST),
        .M_AXI_GP0_RREADY(processing_system7_0_M_AXI_GP0_RREADY),
        .M_AXI_GP0_RRESP(processing_system7_0_M_AXI_GP0_RRESP),
        .M_AXI_GP0_RVALID(processing_system7_0_M_AXI_GP0_RVALID),
        .M_AXI_GP0_WDATA(processing_system7_0_M_AXI_GP0_WDATA),
        .M_AXI_GP0_WID(processing_system7_0_M_AXI_GP0_WID),
        .M_AXI_GP0_WLAST(processing_system7_0_M_AXI_GP0_WLAST),
        .M_AXI_GP0_WREADY(processing_system7_0_M_AXI_GP0_WREADY),
        .M_AXI_GP0_WSTRB(processing_system7_0_M_AXI_GP0_WSTRB),
        .M_AXI_GP0_WVALID(processing_system7_0_M_AXI_GP0_WVALID),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .USB0_VBUS_PWRFAULT(1'b0));
  system_processing_system7_0_axi_periph_0 processing_system7_0_axi_periph
       (.ACLK(processing_system7_0_FCLK_CLK0),
        .ARESETN(rst_processing_system7_0_50M_interconnect_aresetn),
        .M00_ACLK(processing_system7_0_FCLK_CLK0),
        .M00_ARESETN(rst_processing_system7_0_50M_peripheral_aresetn),
        .M00_AXI_araddr(processing_system7_0_axi_periph_M00_AXI_ARADDR),
        .M00_AXI_arprot(processing_system7_0_axi_periph_M00_AXI_ARPROT),
        .M00_AXI_arready(processing_system7_0_axi_periph_M00_AXI_ARREADY),
        .M00_AXI_arvalid(processing_system7_0_axi_periph_M00_AXI_ARVALID),
        .M00_AXI_awaddr(processing_system7_0_axi_periph_M00_AXI_AWADDR),
        .M00_AXI_awprot(processing_system7_0_axi_periph_M00_AXI_AWPROT),
        .M00_AXI_awready(processing_system7_0_axi_periph_M00_AXI_AWREADY),
        .M00_AXI_awvalid(processing_system7_0_axi_periph_M00_AXI_AWVALID),
        .M00_AXI_bready(processing_system7_0_axi_periph_M00_AXI_BREADY),
        .M00_AXI_bresp(processing_system7_0_axi_periph_M00_AXI_BRESP),
        .M00_AXI_bvalid(processing_system7_0_axi_periph_M00_AXI_BVALID),
        .M00_AXI_rdata(processing_system7_0_axi_periph_M00_AXI_RDATA),
        .M00_AXI_rready(processing_system7_0_axi_periph_M00_AXI_RREADY),
        .M00_AXI_rresp(processing_system7_0_axi_periph_M00_AXI_RRESP),
        .M00_AXI_rvalid(processing_system7_0_axi_periph_M00_AXI_RVALID),
        .M00_AXI_wdata(processing_system7_0_axi_periph_M00_AXI_WDATA),
        .M00_AXI_wready(processing_system7_0_axi_periph_M00_AXI_WREADY),
        .M00_AXI_wstrb(processing_system7_0_axi_periph_M00_AXI_WSTRB),
        .M00_AXI_wvalid(processing_system7_0_axi_periph_M00_AXI_WVALID),
        .S00_ACLK(processing_system7_0_FCLK_CLK0),
        .S00_ARESETN(rst_processing_system7_0_50M_peripheral_aresetn),
        .S00_AXI_araddr(processing_system7_0_M_AXI_GP0_ARADDR),
        .S00_AXI_arburst(processing_system7_0_M_AXI_GP0_ARBURST),
        .S00_AXI_arcache(processing_system7_0_M_AXI_GP0_ARCACHE),
        .S00_AXI_arid(processing_system7_0_M_AXI_GP0_ARID),
        .S00_AXI_arlen(processing_system7_0_M_AXI_GP0_ARLEN),
        .S00_AXI_arlock(processing_system7_0_M_AXI_GP0_ARLOCK),
        .S00_AXI_arprot(processing_system7_0_M_AXI_GP0_ARPROT),
        .S00_AXI_arqos(processing_system7_0_M_AXI_GP0_ARQOS),
        .S00_AXI_arready(processing_system7_0_M_AXI_GP0_ARREADY),
        .S00_AXI_arsize(processing_system7_0_M_AXI_GP0_ARSIZE),
        .S00_AXI_arvalid(processing_system7_0_M_AXI_GP0_ARVALID),
        .S00_AXI_awaddr(processing_system7_0_M_AXI_GP0_AWADDR),
        .S00_AXI_awburst(processing_system7_0_M_AXI_GP0_AWBURST),
        .S00_AXI_awcache(processing_system7_0_M_AXI_GP0_AWCACHE),
        .S00_AXI_awid(processing_system7_0_M_AXI_GP0_AWID),
        .S00_AXI_awlen(processing_system7_0_M_AXI_GP0_AWLEN),
        .S00_AXI_awlock(processing_system7_0_M_AXI_GP0_AWLOCK),
        .S00_AXI_awprot(processing_system7_0_M_AXI_GP0_AWPROT),
        .S00_AXI_awqos(processing_system7_0_M_AXI_GP0_AWQOS),
        .S00_AXI_awready(processing_system7_0_M_AXI_GP0_AWREADY),
        .S00_AXI_awsize(processing_system7_0_M_AXI_GP0_AWSIZE),
        .S00_AXI_awvalid(processing_system7_0_M_AXI_GP0_AWVALID),
        .S00_AXI_bid(processing_system7_0_M_AXI_GP0_BID),
        .S00_AXI_bready(processing_system7_0_M_AXI_GP0_BREADY),
        .S00_AXI_bresp(processing_system7_0_M_AXI_GP0_BRESP),
        .S00_AXI_bvalid(processing_system7_0_M_AXI_GP0_BVALID),
        .S00_AXI_rdata(processing_system7_0_M_AXI_GP0_RDATA),
        .S00_AXI_rid(processing_system7_0_M_AXI_GP0_RID),
        .S00_AXI_rlast(processing_system7_0_M_AXI_GP0_RLAST),
        .S00_AXI_rready(processing_system7_0_M_AXI_GP0_RREADY),
        .S00_AXI_rresp(processing_system7_0_M_AXI_GP0_RRESP),
        .S00_AXI_rvalid(processing_system7_0_M_AXI_GP0_RVALID),
        .S00_AXI_wdata(processing_system7_0_M_AXI_GP0_WDATA),
        .S00_AXI_wid(processing_system7_0_M_AXI_GP0_WID),
        .S00_AXI_wlast(processing_system7_0_M_AXI_GP0_WLAST),
        .S00_AXI_wready(processing_system7_0_M_AXI_GP0_WREADY),
        .S00_AXI_wstrb(processing_system7_0_M_AXI_GP0_WSTRB),
        .S00_AXI_wvalid(processing_system7_0_M_AXI_GP0_WVALID));
  system_rst_processing_system7_0_50M_0 rst_processing_system7_0_50M
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(processing_system7_0_FCLK_RESET0_N),
        .interconnect_aresetn(rst_processing_system7_0_50M_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_processing_system7_0_50M_peripheral_aresetn),
        .slowest_sync_clk(processing_system7_0_FCLK_CLK0));
endmodule

module system_processing_system7_0_axi_periph_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arprot,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awprot,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [2:0]M00_AXI_arprot;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [2:0]M00_AXI_awprot;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [11:0]S00_AXI_arid;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [11:0]S00_AXI_awid;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [11:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [11:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [11:0]S00_AXI_wid;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire processing_system7_0_axi_periph_ACLK_net;
  wire processing_system7_0_axi_periph_ARESETN_net;
  wire [31:0]processing_system7_0_axi_periph_to_s00_couplers_ARADDR;
  wire [1:0]processing_system7_0_axi_periph_to_s00_couplers_ARBURST;
  wire [3:0]processing_system7_0_axi_periph_to_s00_couplers_ARCACHE;
  wire [11:0]processing_system7_0_axi_periph_to_s00_couplers_ARID;
  wire [3:0]processing_system7_0_axi_periph_to_s00_couplers_ARLEN;
  wire [1:0]processing_system7_0_axi_periph_to_s00_couplers_ARLOCK;
  wire [2:0]processing_system7_0_axi_periph_to_s00_couplers_ARPROT;
  wire [3:0]processing_system7_0_axi_periph_to_s00_couplers_ARQOS;
  wire processing_system7_0_axi_periph_to_s00_couplers_ARREADY;
  wire [2:0]processing_system7_0_axi_periph_to_s00_couplers_ARSIZE;
  wire processing_system7_0_axi_periph_to_s00_couplers_ARVALID;
  wire [31:0]processing_system7_0_axi_periph_to_s00_couplers_AWADDR;
  wire [1:0]processing_system7_0_axi_periph_to_s00_couplers_AWBURST;
  wire [3:0]processing_system7_0_axi_periph_to_s00_couplers_AWCACHE;
  wire [11:0]processing_system7_0_axi_periph_to_s00_couplers_AWID;
  wire [3:0]processing_system7_0_axi_periph_to_s00_couplers_AWLEN;
  wire [1:0]processing_system7_0_axi_periph_to_s00_couplers_AWLOCK;
  wire [2:0]processing_system7_0_axi_periph_to_s00_couplers_AWPROT;
  wire [3:0]processing_system7_0_axi_periph_to_s00_couplers_AWQOS;
  wire processing_system7_0_axi_periph_to_s00_couplers_AWREADY;
  wire [2:0]processing_system7_0_axi_periph_to_s00_couplers_AWSIZE;
  wire processing_system7_0_axi_periph_to_s00_couplers_AWVALID;
  wire [11:0]processing_system7_0_axi_periph_to_s00_couplers_BID;
  wire processing_system7_0_axi_periph_to_s00_couplers_BREADY;
  wire [1:0]processing_system7_0_axi_periph_to_s00_couplers_BRESP;
  wire processing_system7_0_axi_periph_to_s00_couplers_BVALID;
  wire [31:0]processing_system7_0_axi_periph_to_s00_couplers_RDATA;
  wire [11:0]processing_system7_0_axi_periph_to_s00_couplers_RID;
  wire processing_system7_0_axi_periph_to_s00_couplers_RLAST;
  wire processing_system7_0_axi_periph_to_s00_couplers_RREADY;
  wire [1:0]processing_system7_0_axi_periph_to_s00_couplers_RRESP;
  wire processing_system7_0_axi_periph_to_s00_couplers_RVALID;
  wire [31:0]processing_system7_0_axi_periph_to_s00_couplers_WDATA;
  wire [11:0]processing_system7_0_axi_periph_to_s00_couplers_WID;
  wire processing_system7_0_axi_periph_to_s00_couplers_WLAST;
  wire processing_system7_0_axi_periph_to_s00_couplers_WREADY;
  wire [3:0]processing_system7_0_axi_periph_to_s00_couplers_WSTRB;
  wire processing_system7_0_axi_periph_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_processing_system7_0_axi_periph_ARADDR;
  wire [2:0]s00_couplers_to_processing_system7_0_axi_periph_ARPROT;
  wire s00_couplers_to_processing_system7_0_axi_periph_ARREADY;
  wire s00_couplers_to_processing_system7_0_axi_periph_ARVALID;
  wire [31:0]s00_couplers_to_processing_system7_0_axi_periph_AWADDR;
  wire [2:0]s00_couplers_to_processing_system7_0_axi_periph_AWPROT;
  wire s00_couplers_to_processing_system7_0_axi_periph_AWREADY;
  wire s00_couplers_to_processing_system7_0_axi_periph_AWVALID;
  wire s00_couplers_to_processing_system7_0_axi_periph_BREADY;
  wire [1:0]s00_couplers_to_processing_system7_0_axi_periph_BRESP;
  wire s00_couplers_to_processing_system7_0_axi_periph_BVALID;
  wire [31:0]s00_couplers_to_processing_system7_0_axi_periph_RDATA;
  wire s00_couplers_to_processing_system7_0_axi_periph_RREADY;
  wire [1:0]s00_couplers_to_processing_system7_0_axi_periph_RRESP;
  wire s00_couplers_to_processing_system7_0_axi_periph_RVALID;
  wire [31:0]s00_couplers_to_processing_system7_0_axi_periph_WDATA;
  wire s00_couplers_to_processing_system7_0_axi_periph_WREADY;
  wire [3:0]s00_couplers_to_processing_system7_0_axi_periph_WSTRB;
  wire s00_couplers_to_processing_system7_0_axi_periph_WVALID;

  assign M00_AXI_araddr[31:0] = s00_couplers_to_processing_system7_0_axi_periph_ARADDR;
  assign M00_AXI_arprot[2:0] = s00_couplers_to_processing_system7_0_axi_periph_ARPROT;
  assign M00_AXI_arvalid = s00_couplers_to_processing_system7_0_axi_periph_ARVALID;
  assign M00_AXI_awaddr[31:0] = s00_couplers_to_processing_system7_0_axi_periph_AWADDR;
  assign M00_AXI_awprot[2:0] = s00_couplers_to_processing_system7_0_axi_periph_AWPROT;
  assign M00_AXI_awvalid = s00_couplers_to_processing_system7_0_axi_periph_AWVALID;
  assign M00_AXI_bready = s00_couplers_to_processing_system7_0_axi_periph_BREADY;
  assign M00_AXI_rready = s00_couplers_to_processing_system7_0_axi_periph_RREADY;
  assign M00_AXI_wdata[31:0] = s00_couplers_to_processing_system7_0_axi_periph_WDATA;
  assign M00_AXI_wstrb[3:0] = s00_couplers_to_processing_system7_0_axi_periph_WSTRB;
  assign M00_AXI_wvalid = s00_couplers_to_processing_system7_0_axi_periph_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = processing_system7_0_axi_periph_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = processing_system7_0_axi_periph_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[11:0] = processing_system7_0_axi_periph_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = processing_system7_0_axi_periph_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = processing_system7_0_axi_periph_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = processing_system7_0_axi_periph_to_s00_couplers_RDATA;
  assign S00_AXI_rid[11:0] = processing_system7_0_axi_periph_to_s00_couplers_RID;
  assign S00_AXI_rlast = processing_system7_0_axi_periph_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = processing_system7_0_axi_periph_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = processing_system7_0_axi_periph_to_s00_couplers_RVALID;
  assign S00_AXI_wready = processing_system7_0_axi_periph_to_s00_couplers_WREADY;
  assign processing_system7_0_axi_periph_ACLK_net = M00_ACLK;
  assign processing_system7_0_axi_periph_ARESETN_net = M00_ARESETN;
  assign processing_system7_0_axi_periph_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARID = S00_AXI_arid[11:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARLEN = S00_AXI_arlen[3:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARLOCK = S00_AXI_arlock[1:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign processing_system7_0_axi_periph_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWID = S00_AXI_awid[11:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWLEN = S00_AXI_awlen[3:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWLOCK = S00_AXI_awlock[1:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign processing_system7_0_axi_periph_to_s00_couplers_BREADY = S00_AXI_bready;
  assign processing_system7_0_axi_periph_to_s00_couplers_RREADY = S00_AXI_rready;
  assign processing_system7_0_axi_periph_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_WID = S00_AXI_wid[11:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign processing_system7_0_axi_periph_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign processing_system7_0_axi_periph_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign s00_couplers_to_processing_system7_0_axi_periph_ARREADY = M00_AXI_arready;
  assign s00_couplers_to_processing_system7_0_axi_periph_AWREADY = M00_AXI_awready;
  assign s00_couplers_to_processing_system7_0_axi_periph_BRESP = M00_AXI_bresp[1:0];
  assign s00_couplers_to_processing_system7_0_axi_periph_BVALID = M00_AXI_bvalid;
  assign s00_couplers_to_processing_system7_0_axi_periph_RDATA = M00_AXI_rdata[31:0];
  assign s00_couplers_to_processing_system7_0_axi_periph_RRESP = M00_AXI_rresp[1:0];
  assign s00_couplers_to_processing_system7_0_axi_periph_RVALID = M00_AXI_rvalid;
  assign s00_couplers_to_processing_system7_0_axi_periph_WREADY = M00_AXI_wready;
  s00_couplers_imp_IK3G2O s00_couplers
       (.M_ACLK(processing_system7_0_axi_periph_ACLK_net),
        .M_ARESETN(processing_system7_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_processing_system7_0_axi_periph_ARADDR),
        .M_AXI_arprot(s00_couplers_to_processing_system7_0_axi_periph_ARPROT),
        .M_AXI_arready(s00_couplers_to_processing_system7_0_axi_periph_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_processing_system7_0_axi_periph_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_processing_system7_0_axi_periph_AWADDR),
        .M_AXI_awprot(s00_couplers_to_processing_system7_0_axi_periph_AWPROT),
        .M_AXI_awready(s00_couplers_to_processing_system7_0_axi_periph_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_processing_system7_0_axi_periph_AWVALID),
        .M_AXI_bready(s00_couplers_to_processing_system7_0_axi_periph_BREADY),
        .M_AXI_bresp(s00_couplers_to_processing_system7_0_axi_periph_BRESP),
        .M_AXI_bvalid(s00_couplers_to_processing_system7_0_axi_periph_BVALID),
        .M_AXI_rdata(s00_couplers_to_processing_system7_0_axi_periph_RDATA),
        .M_AXI_rready(s00_couplers_to_processing_system7_0_axi_periph_RREADY),
        .M_AXI_rresp(s00_couplers_to_processing_system7_0_axi_periph_RRESP),
        .M_AXI_rvalid(s00_couplers_to_processing_system7_0_axi_periph_RVALID),
        .M_AXI_wdata(s00_couplers_to_processing_system7_0_axi_periph_WDATA),
        .M_AXI_wready(s00_couplers_to_processing_system7_0_axi_periph_WREADY),
        .M_AXI_wstrb(s00_couplers_to_processing_system7_0_axi_periph_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_processing_system7_0_axi_periph_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(processing_system7_0_axi_periph_to_s00_couplers_ARADDR),
        .S_AXI_arburst(processing_system7_0_axi_periph_to_s00_couplers_ARBURST),
        .S_AXI_arcache(processing_system7_0_axi_periph_to_s00_couplers_ARCACHE),
        .S_AXI_arid(processing_system7_0_axi_periph_to_s00_couplers_ARID),
        .S_AXI_arlen(processing_system7_0_axi_periph_to_s00_couplers_ARLEN),
        .S_AXI_arlock(processing_system7_0_axi_periph_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(processing_system7_0_axi_periph_to_s00_couplers_ARPROT),
        .S_AXI_arqos(processing_system7_0_axi_periph_to_s00_couplers_ARQOS),
        .S_AXI_arready(processing_system7_0_axi_periph_to_s00_couplers_ARREADY),
        .S_AXI_arsize(processing_system7_0_axi_periph_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(processing_system7_0_axi_periph_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(processing_system7_0_axi_periph_to_s00_couplers_AWADDR),
        .S_AXI_awburst(processing_system7_0_axi_periph_to_s00_couplers_AWBURST),
        .S_AXI_awcache(processing_system7_0_axi_periph_to_s00_couplers_AWCACHE),
        .S_AXI_awid(processing_system7_0_axi_periph_to_s00_couplers_AWID),
        .S_AXI_awlen(processing_system7_0_axi_periph_to_s00_couplers_AWLEN),
        .S_AXI_awlock(processing_system7_0_axi_periph_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(processing_system7_0_axi_periph_to_s00_couplers_AWPROT),
        .S_AXI_awqos(processing_system7_0_axi_periph_to_s00_couplers_AWQOS),
        .S_AXI_awready(processing_system7_0_axi_periph_to_s00_couplers_AWREADY),
        .S_AXI_awsize(processing_system7_0_axi_periph_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(processing_system7_0_axi_periph_to_s00_couplers_AWVALID),
        .S_AXI_bid(processing_system7_0_axi_periph_to_s00_couplers_BID),
        .S_AXI_bready(processing_system7_0_axi_periph_to_s00_couplers_BREADY),
        .S_AXI_bresp(processing_system7_0_axi_periph_to_s00_couplers_BRESP),
        .S_AXI_bvalid(processing_system7_0_axi_periph_to_s00_couplers_BVALID),
        .S_AXI_rdata(processing_system7_0_axi_periph_to_s00_couplers_RDATA),
        .S_AXI_rid(processing_system7_0_axi_periph_to_s00_couplers_RID),
        .S_AXI_rlast(processing_system7_0_axi_periph_to_s00_couplers_RLAST),
        .S_AXI_rready(processing_system7_0_axi_periph_to_s00_couplers_RREADY),
        .S_AXI_rresp(processing_system7_0_axi_periph_to_s00_couplers_RRESP),
        .S_AXI_rvalid(processing_system7_0_axi_periph_to_s00_couplers_RVALID),
        .S_AXI_wdata(processing_system7_0_axi_periph_to_s00_couplers_WDATA),
        .S_AXI_wid(processing_system7_0_axi_periph_to_s00_couplers_WID),
        .S_AXI_wlast(processing_system7_0_axi_periph_to_s00_couplers_WLAST),
        .S_AXI_wready(processing_system7_0_axi_periph_to_s00_couplers_WREADY),
        .S_AXI_wstrb(processing_system7_0_axi_periph_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(processing_system7_0_axi_periph_to_s00_couplers_WVALID));
endmodule
