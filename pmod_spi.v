module pmod_spi(
        input clk,
        input ld_number,
        input [31:0] number,
        output csn,
        output mosi,
        output sck

);

    reg rst;
    reg out;

    integer i;

    wire clk_200KHz;

    assign sck = clk_200KHz;
    assign mosi = out;
    assign csn = 0;

    clk_gen clk_gen(
        .clk_100MHz(clk),
        // .rst(ld_number),
        .clk_200KHz(clk_200KHz),
        .clk_1s()
    );

    initial begin
        i = 31;
        // send = 0;
        rst = 0;
    end
  
    // always @(posedge ld_number) begin
    //     send = number;
    // end

    always @(negedge clk_200KHz) begin
        i = (i > 0) ? i - 1 : 31;
        // out = send[i];
        out = number[i];
    end

endmodule