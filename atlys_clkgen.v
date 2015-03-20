module clk_gen(
        input clk_100MHz,
        // input rst,
        output reg clk_200KHz,
        output reg clk_1s
);

    integer count_200KHz;
    integer count_1s;

    initial begin
        count_200KHz = 0;
        count_1s = 0;
        clk_1s = 1'b0;
        clk_200KHz = 1'b0;
    end

    always@(posedge clk_100MHz) begin
        // if(rst) begin
        //     count_200KHz = 0;
        //     count_1s = 0;
        //     clk_1s = 1'b0;
        //     clk_200KHz = 1'b0;
        // end else begin
            if(count_200KHz == 250) begin
                clk_200KHz = ~clk_200KHz;
                count_200KHz = 0;
            end
            if(count_1s == 833333) begin
                clk_1s = ~clk_1s;
                count_1s = 0;
            end
            count_200KHz = count_200KHz + 1;
            count_1s = count_1s + 1;
        // end
    end

endmodule