module vga(
    input wire clk,
    input wire reset,
    output reg [3:0] led
);

reg [24:0] counter;

always @(posedge clk) begin
    if (reset) begin
        counter <= 0;
        led <= 4'b0000;
    end else begin
        counter <= counter + 1;
        if (counter == 25000000) begin  // ~1Hz blink at 100MHz
            led <= ~led;
            counter <= 0;
        end
    end
end

endmodule
