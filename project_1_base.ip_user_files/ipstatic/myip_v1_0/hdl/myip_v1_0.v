
`timescale 1 ns / 1 ps

	module myip_v1_0 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 7
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready,
		
		input wire [C_S00_AXI_DATA_WIDTH-1:0]	reg0,
        input wire [C_S00_AXI_DATA_WIDTH-1:0]    reg1,
        input wire [C_S00_AXI_DATA_WIDTH-1:0]    reg2,
        input wire [C_S00_AXI_DATA_WIDTH-1:0]    reg3,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg4,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg5,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg6,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg7,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg8,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg9,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg10,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg11,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg12,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg13,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg14,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg15,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg16,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg17,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg18,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg19,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg20,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg21,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg22,
        input wire [C_S00_AXI_DATA_WIDTH-1:0]        reg23,
        input wire [C_S00_AXI_DATA_WIDTH-1:0]       reg24,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg25,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg26,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg27,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg28,
        output wire [C_S00_AXI_DATA_WIDTH-1:0]    reg29,
        input wire [C_S00_AXI_DATA_WIDTH-1:0]    reg30,
        input wire [C_S00_AXI_DATA_WIDTH-1:0]    reg31
	);
// Instantiation of Axi Bus Interface S00_AXI
	myip_v1_0_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) myip_v1_0_S00_AXI_inst (
	
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready),
		.reg0(reg0),
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
        .reg31(reg31)
                
        
	);

	// Add user logic here

	// User logic ends

	endmodule
