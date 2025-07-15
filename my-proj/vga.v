module vga(
    input wire clk,
    input wire rst,
    output reg [3:0] led,
    output reg [3:0] vga_red,
    output reg [3:0] vga_green,
    output reg [3:0] vga_blue,
    output reg vga_hsync,
    output reg vga_vsync
);

reg [24:0] counter;

always @(posedge clk) begin
    if (rst) begin
        counter <= 0;
        led <= 4'b0000;
        vga_red <= 4'b0000;
        vga_green <= 4'b0000;
        vga_blue <= 4'b0000;
        vga_hsync <= 1'b0;
        vga_vsync <= 1'b0;
    end else begin
        counter <= counter + 1;
        if (counter == 25000000) begin  // ~1Hz blink at 100MHz
            led <= ~led;
            vga_red <= ~vga_red;
            counter <= 0;
        end
        // Simple VGA sync signals (not proper timing)
        vga_hsync <= 1'b1;
        vga_vsync <= 1'b1;
    end
end

endmodule
