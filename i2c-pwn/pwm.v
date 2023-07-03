// 
// Single PWM Line
//
module pwm_module (
    input           clk, 
    input   [7:0]   value, 
    output          pulse
);

    reg [7:0] counter;

    initial begin
        counter <= 0;
    end

    always @(posedge clk) begin
        counter <= counter + 1;
        if (counter >= value) pulse = 1;
        else pulse = 0;
    end

endmodule